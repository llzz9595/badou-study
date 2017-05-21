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
import com.shengdai.mobile.version.dao.IResourceVersionDAO;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.service.IResourceVersionService;
import com.shengdai.mobile.version.web.form.ResourceVersionForm;
import com.shengdai.version.VersionPropertiesLoader;
/**
 * 功能2示例业务层接口实现
 * @author xpp
 *
 */
@Service
public class ResourceVersionServiceImpl extends BaseSpringService<ResourceVersionEntity, Serializable>
		implements IResourceVersionService {
	
	@Autowired
	private IResourceVersionDAO resourceVersionDAO;
	@Autowired
	private IApkVersionDAO apkVersionDAO;
	@Autowired
	public void setMenuDAO(IResourceVersionDAO resourceVersionDAO) {
		this.resourceVersionDAO = resourceVersionDAO;
		super.setBaseDAO(resourceVersionDAO);
	}
	
	@Override
	public void addResourceVersion(ResourceVersionForm resourceVersionForm, File file,
			String fileName, String attachFileContentType, String oldattachId)
			throws Exception {

		ResourceVersionEntity resourceVersion = new ResourceVersionEntity();
		ApkVersionEntity apkVersionEntity = apkVersionDAO.find(resourceVersionForm.getApkId());
		resourceVersion.setApkVersion(apkVersionEntity);
		resourceVersionForm.setFormToEntityProperties(resourceVersion);

		if (file == null && StringUtils.isBlank(fileName))
			resourceVersionDAO.create(resourceVersion);
		else{
			// 读取配置文件 获得apk上传文件的存放根目录
			
			String basePath = PropertyUtils.getProperty(VersionPropertiesLoader.resourceVersionPath,VersionPropertiesLoader.VERSION_FILE);
			String basePathFileName = basePath + "/" +resourceVersion.getVersionName()+resourceVersion.getVersionNum()+ fileName;
	
			File f = new File(basePath);
			if (!f.exists()) {// 指定目录是否存在
				f.mkdirs(); // 知道目录不存在 自动创建目录
			}
	
			// 优化流操作
			// 把传入的file转换成流
			InputStream is = new FileInputStream(file);
			byte[] data = new byte[(int) is.available()];
			data = IOUtils.toByteArray(is);
	
			FileOutputStream os = new FileOutputStream(basePathFileName);
			os.write(data);
	
			is.close();
			os.close();
	
			resourceVersion.setResourceUrl(resourceVersion.getVersionName()+resourceVersion.getVersionNum());
			resourceVersion.setAttachName(fileName);
	
			resourceVersionDAO.create(resourceVersion);
		}
	}

	@Override
	public void updateResourceVersion(ResourceVersionForm resourceVersionForm, File file,
			String fileName, String attachFileContentType, String oldattachId)
			throws Exception {

		ResourceVersionEntity resourceVersion = new  ResourceVersionEntity();
		resourceVersion = resourceVersionDAO.find(resourceVersionForm.getId());
		ApkVersionEntity apkVersionEntity = apkVersionDAO.find(resourceVersionForm.getApkId());
		resourceVersion.setApkVersion(apkVersionEntity);
		resourceVersionForm.setFormToEntityProperties(resourceVersion);

		if (file == null && StringUtils.isBlank(fileName)){
			resourceVersionDAO.update(resourceVersion);
		}else
		{
			// 读取配置文件 获得apk上传文件的存放根目录
			String basePath = PropertyUtils.getProperty(
					VersionPropertiesLoader.resourceVersionPath,
					VersionPropertiesLoader.VERSION_FILE);
			String basePathFileName = basePath + "/" +resourceVersion.getVersionName()+resourceVersion.getVersionNum()+ fileName;
			
			
			File f = new File(basePath);
			if (!f.exists()) {// 指定目录是否存在
				f.mkdirs();//如果不存在 则创建
			}
	
			// 优化流操作
			// 把传入的file转换成流
			InputStream is = new FileInputStream(file);
			byte[] data = new byte[(int) is.available()];
			data = IOUtils.toByteArray(is);
	
			FileOutputStream os = new FileOutputStream(basePathFileName);
			os.write(data);
	
			is.close();
			os.close();
	
			resourceVersion.setResourceUrl(resourceVersion.getVersionName()+resourceVersion.getVersionNum());
			resourceVersion.setAttachName(fileName);
	
			resourceVersionDAO.update(resourceVersion);
		}
	}

	public void downloadFile(String resourceVersionId, HttpServletResponse response)
			throws Exception {
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.resourceVersionPath,
				VersionPropertiesLoader.VERSION_FILE);

		ResourceVersionEntity resourceVersion = new ResourceVersionEntity();
		resourceVersion = resourceVersionDAO.find(resourceVersionId);

		// 下载本地文件
		String fileName = resourceVersion.getAttachName(); // 文件的默认保存名
		// 读到流中
		InputStream inStream = new FileInputStream(basePath + "/"
				+ resourceVersion.getResourceUrl() + resourceVersion.getAttachName());// 文件的存放路径
		// 设置输出的格式
		response.reset();
		response.setContentType("bin");
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

	public void deleteFile(String resourceVersionId, HttpServletResponse response)
			throws Exception {
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.resourceVersionPath,
				VersionPropertiesLoader.VERSION_FILE);

		ResourceVersionEntity resourceVersion = new ResourceVersionEntity();
		resourceVersion = resourceVersionDAO.find(resourceVersionId);
		
		File deleteFile = new File(basePath + "/" + resourceVersion.getResourceUrl()+resourceVersion.getAttachName());
		if (deleteFile.exists()) {// 指定文件是否存在
			deleteFile.delete(); // 如果已经存在 就删除
		}
		
		resourceVersion.setResourceUrl("");
		resourceVersion.setAttachName("");
		resourceVersionDAO.update(resourceVersion);
		
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
	public ResourceVersionEntity html5Version(String apkId) throws Exception {
		return resourceVersionDAO.html5Version(apkId);
	}
	
}
