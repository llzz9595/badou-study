package com.shengdai.mobile.version.service;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.HttpServletResponse;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.web.form.ResourceVersionForm;

public interface IResourceVersionService extends IBaseSpringService<ResourceVersionEntity, Serializable>{

	public void updateResourceVersion(ResourceVersionForm resourceVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;
	
	public void addResourceVersion(ResourceVersionForm resourceVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;

	public void downloadFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public void deleteFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public ResourceVersionEntity html5Version(String apkId) throws Exception;
	
	

}
