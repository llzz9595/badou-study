package com.shengdai.mobile.version.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.net.URLEncoder;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.mobile.version.dao.IApkVersionDAO;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.service.IApkVersionService;
import com.shengdai.mobile.version.web.form.ApkVersionForm;
import com.shengdai.version.VersionPropertiesLoader;

/**
 * 功能2示例业务层接口实现
 * 
 * @author xpp
 * 
 */
@Service
public class ApkVersionServiceImpl extends
		BaseSpringService<ApkVersionEntity, Serializable> implements
		IApkVersionService {

	@Autowired
	private IApkVersionDAO IApkVersionDAO;

	@Autowired
	public void setMenuDAO(IApkVersionDAO IApkVersionDAO) {
		this.IApkVersionDAO = IApkVersionDAO;
		super.setBaseDAO(IApkVersionDAO);
	}

	@Override
	public void addApkVersion(ApkVersionForm apkVersionForm, File file,
			String fileName, String attachFileContentType, String oldattachId)
			throws Exception {

		ApkVersionEntity apkVersion = new ApkVersionEntity();
		apkVersionForm.setFormToEntityProperties(apkVersion);

		if (file == null && StringUtils.isBlank(fileName))
			IApkVersionDAO.create(apkVersion);
		else{
			saveFile(apkVersion, file, fileName);
	
			apkVersion.setApkUrl(apkVersion.getVersionNum() + File.separator + fileName);
			apkVersion.setAttachName(fileName);
	
			IApkVersionDAO.create(apkVersion);
		}
	}
	
	@Override
	public void updateApkVersion(ApkVersionForm apkVersionForm, File file,
			String fileName, String attachFileContentType, String oldattachId)
			throws Exception {

		ApkVersionEntity apkVersion = new ApkVersionEntity();
		apkVersion = IApkVersionDAO.get(apkVersionForm.getId());
		apkVersionForm.setFormToEntityProperties(apkVersion);

		if (file == null && StringUtils.isBlank(fileName)){
			IApkVersionDAO.update(apkVersion);
		}else
		{
			saveFile(apkVersion, file, fileName);
	
			apkVersion.setApkUrl(apkVersion.getVersionNum() + File.separator + fileName);
			apkVersion.setAttachName(fileName);
	
			IApkVersionDAO.update(apkVersion);
		}
	}

	private void saveFile(ApkVersionEntity apkVersion, File file, String fileName) throws Exception{
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.apkVersionPath,
				VersionPropertiesLoader.VERSION_FILE);
		String dir = basePath + File.separator + apkVersion.getVersionNum();
		String basePathFileName = dir + File.separator + fileName;

		File f = new File(dir);
		if (!f.exists()) {
			f.mkdirs(); 
		}

		InputStream is = new FileInputStream(file);
		FileOutputStream os = new FileOutputStream(basePathFileName);
		byte[] buffer = new byte[1024];
		int len = 0;
		long total = 0;
		while ((len = is.read(buffer)) != -1) {
			total += len;
			os.write(buffer, 0, len);
		}
		apkVersion.setAttachSize(total);
		
		os.flush();
		os.close();
		is.close();
	}

	public void downloadFile(String apkVersionId, HttpServletResponse response)
			throws Exception {
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.apkVersionPath,
				VersionPropertiesLoader.VERSION_FILE);

		ApkVersionEntity apkVersion = IApkVersionDAO.find(apkVersionId);

		// 下载本地文件
		String fileName = apkVersion.getAttachName(); // 文件的默认保存名
		// 读到流中
		InputStream inStream = new FileInputStream(basePath + File.separator + apkVersion.getApkUrl());// 文件的存放路径
		// 设置输出的格式
		response.reset();
		response.setContentType("application/octet-stream");
		response.setContentLength(apkVersion.getAttachSize().intValue());
		response.addHeader("Content-Disposition", "attachment; filename=\""
				+ URLEncoder.encode(new String(fileName.getBytes()), "UTF-8")
				+ "\"");
		// 循环取出流中的数据
		byte[] b = new byte[100];
		int len;
		try {
			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void deleteFile(String apkVersionId, HttpServletResponse response)
			throws Exception {
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.apkVersionPath,
				VersionPropertiesLoader.VERSION_FILE);

		ApkVersionEntity apkVersion = new ApkVersionEntity();
		apkVersion = IApkVersionDAO.find(apkVersionId);
		
		File deleteFile = new File(basePath + File.separator + apkVersion.getApkUrl());
		if (deleteFile.exists()) {// 指定文件是否存在
			deleteFile.delete(); // 如果已经存在 就删除
		}
		
		apkVersion.setApkUrl(null);
		apkVersion.setAttachName(null);
		IApkVersionDAO.update(apkVersion);
		
	}

	// 递归
	public long getFileSize(File f) throws Exception// 取得文件[wen jian]夹大小
	{
		long size = 0;
		File flist[] = f.listFiles();
		for (int i = 0; i < flist.length; i++) {
			if (flist[i].isDirectory()) {
				size = size + getFileSize(flist[i]);
			} else {
				size = size + flist[i].length();
			}
		}
		return size;
	}

	public String FormetFileSize(long fileS) {// 转换[zhuan huan]文件[wen
		// jian]大小[wen jian da xiao]
		DecimalFormat df = new DecimalFormat("#.00");
		String fileSizeString = "";
		if (fileS < 1024) {
			fileSizeString = df.format((double) fileS) + "B";
		} else if (fileS < 1048576) {
			fileSizeString = df.format((double) fileS / 1024) + "K";
		} else if (fileS < 1073741824) {
			fileSizeString = df.format((double) fileS / 1048576) + "M";
		} else {
			fileSizeString = df.format((double) fileS / 1073741824) + "G";
		}
		return fileSizeString;
	}

	@Override
	public ApkVersionEntity getLatestVersion() throws Exception {
		return IApkVersionDAO.getLatestVersion();
	}

}
