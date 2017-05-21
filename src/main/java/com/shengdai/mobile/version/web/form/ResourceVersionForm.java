package com.shengdai.mobile.version.web.form;

import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.mobile.version.model.ResourceVersionEntity;


public class ResourceVersionForm extends BaseStrutsEntityForm<ResourceVersionEntity>{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5001778356981642295L;

	/**
	 * 版本名称
	 */
	private String versionName;
	
	/**
	 * 版本描述
	 */
	private String versionDescription;	
	
	/**
	 * 版本号
	 */
	private int versionNum;	
	
	/**
	 * 文件存放路径
	 */
	private String resourceUrl;
	
	/**
	 * 文件名称
	 */
	private String attachName;
	
	/**
	 * apk_id
	 */
	private String apkId;

	public String getVersionName() {
		return versionName;
	}

	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}

	public String getVersionDescription() {
		return versionDescription;
	}

	public void setVersionDescription(String versionDescription) {
		this.versionDescription = versionDescription;
	}

	public int getVersionNum() {
		return versionNum;
	}

	public void setVersionNum(int versionNum) {
		this.versionNum = versionNum;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public String getApkId() {
		return apkId;
	}

	public void setApkId(String apkId) {
		this.apkId = apkId;
	}
	
	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	@Override
	public void setEntityToFormProperties(ResourceVersionEntity instance) {
		
		super.setEntityToFormProperties(instance);
	}

	@Override
	public void setFormToEntityProperties(ResourceVersionEntity instance) {
		instance.setVersionName(this.getVersionName());
		instance.setVersionDescription(this.getVersionDescription());
		instance.setVersionNum(this.getVersionNum());
	}
	
}
