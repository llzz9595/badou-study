package com.badou.project.moduleDemo.service;

import java.io.File;
import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.vo.Demo15VO;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.base.support.spring.IBaseSpringService;

public interface IDemo13Service extends IBaseSpringService<Demo13Entity, Serializable>{
			
public void updateDemo13(Demo13Form resourceVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;
	
	public void addDemo13(Demo13Form resourceVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;

	public void downloadFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public void deleteFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public Demo13Entity html5Version(String apkId) throws Exception;
	public List<Demo15VO> findBySQL() ;

	List<Demo13Entity> findByName(String s);

//	void saveDemo13(Demo13Entity Demo13, List<Attach> attachList, String imgid);
}
