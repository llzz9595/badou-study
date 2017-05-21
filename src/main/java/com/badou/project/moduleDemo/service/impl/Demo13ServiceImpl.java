package com.badou.project.moduleDemo.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.moduleDemo.dao.IDemo13DAO;
import com.badou.project.moduleDemo.help.AttachImgCaches;
import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.badou.project.moduleDemo.vo.Demo14Vo;
import com.badou.project.moduleDemo.vo.Demo15VO;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.version.VersionPropertiesLoader;

@Service
public class Demo13ServiceImpl extends
                 BaseSpringService<Demo13Entity, Serializable> implements
                 		IDemo13Service  {
	@Autowired
	private IDemo13DAO Demo13DAO;
	@Autowired
	private AttachFactory attachFactory;

	
	@Autowired
	public void setDemo13DAO(IDemo13DAO Demo1313DAO) {
		this.Demo13DAO = Demo13DAO;
		super.setBaseDAO(Demo13DAO);
	}
	
	@Override
	public void updateDemo13(Demo13Form demo13Form, File file, String fileName,
			String attachFileContentType, String fileType) throws Exception {
		Demo13Entity demo13 = new  Demo13Entity();
		demo13 = Demo13DAO.find(demo13Form.getId());
//		ApkVersionEntity apkVersionEntity = apkVersionDAO.find(resourceVersionForm.getApkId());
		
		demo13Form.setFormToEntityProperties(demo13);

		if (file == null && StringUtils.isBlank(fileName)){
			Demo13DAO.update(demo13);
		}else
		{
			// 读取配置文件 获得apk上传文件的存放根目录
			String basePath = PropertyUtils.getProperty(
					VersionPropertiesLoader.resourceVersionPath,
					VersionPropertiesLoader.VERSION_FILE);
			String basePathFileName = basePath + "/" +demo13.getName()+ fileName;
			
			
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
	
			demo13.setImgUrl(demo13.getImgUrl());
			demo13.setName(fileName);
	
			Demo13DAO.update(demo13);
		}
		
	}
	@Override
	public void addDemo13(Demo13Form demo13Form, File file, String fileName,
			String attachFileContentType, String fileType) throws Exception {
		// TODO Auto-generated method stub

		Demo13Entity demo13 = new Demo13Entity();
		
		
		demo13Form.setFormToEntityProperties(demo13);

		if (file == null && StringUtils.isBlank(fileName))
			Demo13DAO.create(demo13);
		else{
			// 读取配置文件 获得apk上传文件的存放根目录
			
			String basePath = PropertyUtils.getProperty(VersionPropertiesLoader.resourceVersionPath,VersionPropertiesLoader.VERSION_FILE);
			String basePathFileName = basePath + "/" + fileName;
	
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
	
			demo13.setImgUrl(fileName);
			demo13.setName(demo13.getName());
	
			Demo13DAO.create(demo13);
		}
	}
	@Override
	public void downloadFile(String demo13Id, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String basePath = PropertyUtils.getProperty(
				VersionPropertiesLoader.resourceVersionPath,
				VersionPropertiesLoader.VERSION_FILE);
        System.out.println("////////"+basePath);
		Demo13Entity demo13 = new Demo13Entity();
		demo13 = Demo13DAO.find(demo13Id);
//		response.setContentType("application/octet-stream;");
//		response.setCharacterEncoding("UTF-8");
//		response.setHeader("Content-Disposition","attachment; filename="
//						+ (new String(goodsImg.getName().getBytes("GBK"), "iso8859-1") + goodsImg.getSuffix()));
//		IOUtils.copy(goodsImg.getIs(), outStream);
//
		// 下载本地文件
		String fileName = demo13.getName()+".jpg"; // 文件的默认保存名
		// 读到流中
		InputStream inStream = new FileInputStream(basePath + "/"
				+ demo13.getImgUrl());// 文件的存放路径
//		// 设置输出的格式
//		response.reset();
//		response.setContentType("bin");
//		response.addHeader("Content-Disposition", "attachment; filename=\""
//				+ URLEncoder.encode(new String(fileName.getBytes()), "UTF-8")
//				+ "\"");
		response.setContentType("text/html; charset=UTF-8"); 
		response.setContentType("image/jpeg"); //设置图片格式格式，这里可以忽略 

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
	@Override
	public void deleteFile(String apkVersionId, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Demo13Entity html5Version(String apkId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Demo15VO> findBySQL() {
		return Demo13DAO.findBySQL();
	}

	@Override
	public List<Demo13Entity> findByName(String s){
		System.out.println("sssssssss");
		// TODO Auto-generated method stub
		return Demo13DAO.findByName(s);
	}


}
