package com.shengdai.mobile.openapi.web;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;
import com.shengdai.mobile.openapi.web.form.ApiForm;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demosave/save.do
 * @author xpp 2013-1-18
 *
 */
@Controller
public class ApiSaveAction extends JsonSaveTemplateAction<ApiEntity, Serializable, ApiForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4075156567734548217L;
	
	@Autowired
	private IApiService apiService;
	
	@Autowired
	public void setApiService(IApiService apiService) {
		this.apiService = apiService;
		super.setBaseService(apiService);
	}
	
	
}
