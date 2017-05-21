package com.badou.project.jinhan.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.jinhan.dao.IJinhanHolidayDao;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.jinhan.service.IJinhanHolidayService;
import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.kpi.attach.AttachConfig;
import com.shengdai.kpi.attach.model.Attach;


/*
 * 请假单服务接口实现
 * */
@Service
public class JinhanHolidayServiceImpl extends BaseSpringService<JinhanHolidayEntity, Serializable> implements IJinhanHolidayService{
	@Autowired
	private IJinhanHolidayDao jinhanHolidayDao;
	
	//@Autowired
	//private IAttachService attachService;

	@Autowired
	public void setJinhanHolidayDao(IJinhanHolidayDao jinhanHolidayDao) {
		this.jinhanHolidayDao = jinhanHolidayDao;
		super.setBaseDAO(jinhanHolidayDao);
	}
	private String getAttachBasePath() {
		return AttachConfig.ATTACH_PREFIX + "/" + createSavePath();
	}
	private String createSavePath(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String savePath = sdf.format(new java.util.Date());
		return savePath;
	}
	private String getAbsolutePathByRealPath(String realPath) throws Exception {
		return AttachConfig.getInstance().getAttachSavePath() +"/"+ realPath;
	}
	
	public Attach uploadAPPFile(Attach attach) throws Exception {
		String basePath = getAttachBasePath();
		String absolutePath = AttachConfig.getInstance().getAttachSavePath() + "/" + basePath;
		String attachBaseFileName = attach.getFileName();
		String absoluteFileName = absolutePath + "/" + attachBaseFileName;
		//重新把全路径设置
		attach.setFileName(basePath+"/" + attachBaseFileName);
		attach.setGenDate(new Date());
		
		File f = new File(absolutePath);
		if (!f.exists()) {
			f.mkdirs();
		}
	
		FileOutputStream os = new FileOutputStream(absoluteFileName);
		os.write(attach.getFileContent());
		os.close();
		
		//如果需要保存到数据库
	/*	if (!AttachConfig.isSaveToDB()) {
			attach.setFileContent(null);
		}
		AttachServiceImp attachService=new AttachServiceImp();
		attachService.addAttach(attach);*/

		return attach;
	}
	
	//保存附件
	@Override
	public String saveJinhanHoliday(JinhanHolidayEntity entity, List<Attach> attachList) {

		try {
				if (attachList != null && attachList.size() != 0) {
					if (attachList.size() == 1) {
						Attach a = new Attach();
						a = attachList.get(0);
						Attach b=this.uploadAPPFile(a);
						entity.setLink1(b.getFileName());
					} else {
						for (int i = 0; i < attachList.size(); i++) {
							Attach a = new Attach();
							a = attachList.get(i);
							Attach b=this.uploadAPPFile(a);
							switch (i) {
							case 0:
								entity.setLink1(b.getFileName());
								break;
							case 1:
								entity.setLink2(b.getFileName());
								break;
							case 2:
								entity.setLink3(b.getFileName());
								break;
							default:
								i=attachList.size();
							}
						}
	
					}
				}
			if(StringUtils.isNotBlank(entity.getId()))
			{
				
				jinhanHolidayDao.update(entity);
				return "2";
			}
			else
			{
				jinhanHolidayDao.create(entity);
				return "1";
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("大错误");
			return "0";
		}

	}
	
	/**
	 * 下载文件
	 */
	@Override
	public int downloadFile(String id,HttpServletResponse response,int link) {
		JinhanHolidayEntity jinhan=jinhanHolidayDao.get(id);
		String fileName=null;
		switch(link){
		case 1:
			fileName=jinhan.getLink1();
			break;
		case 2:
			fileName=jinhan.getLink2();
			break;
		case 3:
			fileName=jinhan.getLink2();
			break;
		}
		if(fileName==null||fileName.equals("")){
			return 0;
		}
		response.setContentType("application/octet-stream;");
		response.setCharacterEncoding("UTF-8");
		try{
		InputStream is = null;
		response.setHeader("Content-Disposition", "attachment; filename="
				+ URLEncoder.encode(new String(fileName.replaceAll("/", "-").getBytes()), "UTF-8"));
		OutputStream outStream = response.getOutputStream();
		String realPath = getAbsolutePathByRealPath(fileName);
		File file = new File(realPath);
			if(!file.exists()) {
				is=null;
			} else {
				is = new FileInputStream(realPath);
			}
			IOUtils.copy(is, outStream);
			is.close();
			return 1;
		}
		catch(Exception e){
			return 0;
		}

	}


}
