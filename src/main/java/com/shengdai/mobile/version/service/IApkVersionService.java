package com.shengdai.mobile.version.service;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.HttpServletResponse;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.web.form.ApkVersionForm;

public interface IApkVersionService extends IBaseSpringService<ApkVersionEntity, Serializable>{

	public void updateApkVersion(ApkVersionForm apkVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;
	
	public void addApkVersion(ApkVersionForm apkVersionForm,File attach,String  attachFileName,String attachFileContentType, String fileType) throws Exception;

	public void downloadFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public void deleteFile(String apkVersionId,HttpServletResponse response) throws Exception;
	
	public ApkVersionEntity getLatestVersion() throws Exception;
	
}
