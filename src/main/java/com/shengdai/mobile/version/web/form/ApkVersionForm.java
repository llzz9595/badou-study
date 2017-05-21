package com.shengdai.mobile.version.web.form;

import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.mobile.version.model.ApkVersionEntity;


public class ApkVersionForm extends BaseStrutsEntityForm<ApkVersionEntity>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4708545043433572018L;

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
	private String apkUrl;
	
	/**
	 * 附件ID
	 */
	private String attachId;
	
	/**
	 * 附件名称
	 */
	private String attachName;

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

	public String getApkUrl() {
		return apkUrl;
	}

	public void setApkUrl(String apkUrl) {
		this.apkUrl = apkUrl;
	}

	public String getAttachId() {
		return attachId;
	}

	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	@Override
	public void setEntityToFormProperties(ApkVersionEntity instance) {
		
		super.setEntityToFormProperties(instance);
	}

	@Override
	public void setFormToEntityProperties(ApkVersionEntity instance) {
		instance.setVersionName(this.getVersionName());
		instance.setVersionDescription(this.getVersionDescription());
		instance.setVersionNum(this.getVersionNum());
	}
	

}
