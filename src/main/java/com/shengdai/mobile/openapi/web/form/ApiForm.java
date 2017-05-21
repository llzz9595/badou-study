package com.shengdai.mobile.openapi.web.form;

import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.kpi.dictionary.DictionaryLib;
import com.shengdai.mobile.openapi.ApiConstants;
import com.shengdai.mobile.openapi.model.ApiEntity;

public class ApiForm extends BaseStrutsEntityForm<ApiEntity>{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6811382562138719363L;
	/**
	 * 接口名称
	 */
	private String name;
	
	/**
	 * 接口路径
	 */
	private String url;
	
	/**
	 * 接口状态
	 */
	private String type;
	
	/**
	 * 消息代码
	 */
	private String msgCode;
	
	/**
	 * 接口状态 从字典库中取出
	 */
	private String typeDesc;
	
	
	
	public String getTypeDesc() {
		return DictionaryLib.getItemName(ApiConstants.DIC_ACTION_TYPE, this.getType());	
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMsgCode() {
		return msgCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}

	@Override
	public void setEntityToFormProperties(ApiEntity instance) {
		super.setEntityToFormProperties(instance);
	}

	@Override
	public void setFormToEntityProperties(ApiEntity instance) {
		instance.setName(this.getName());
		instance.setMsgCode(this.getMsgCode());
		instance.setType(DictionaryLib.getItemValue(ApiConstants.DIC_ACTION_TYPE,this.getType()));
		instance.setUrl(this.getUrl());
	}
	

}
