package com.shengdai.mobile.openapi.web;

import java.io.Serializable;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.kpi.dictionary.DictionaryLib;
import com.shengdai.mobile.openapi.ApiConstants;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;
import com.shengdai.mobile.openapi.web.form.ApiForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demoedit_edit.jsp
 * @author xpp 2013-1-18
 *
 */
@Controller
public class ApiEditAction extends JsonEditTemplateAction<ApiEntity, Serializable, ApiForm> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2605021288327426299L;
	@Autowired
	private IApiService apiService;
	
	protected Integer pageSize;
	protected String pageOptions;
	protected ApiForm apiForm;
	private String apiId; 
	
	@Autowired
	public void setApiService(IApiService apiService) {
		this.apiService = apiService;
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editAddUrl", location = "openapilist_detail.jsp")
	public String editAddUrl() throws Exception {
		this.list();
		return "editAddUrl";
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editUpdateUrl", location = "openapilist_detail.jsp")
	public String editUpdateUrl() throws Exception {
		this.list();
		apiForm = new ApiForm();
		ApiEntity actionEntity = apiService.get(apiId);
		apiForm.setEntityToFormProperties(actionEntity);
		return "editUpdateUrl";
		
	}

	private void list() {
		
		ServletActionContext.getRequest().setAttribute("apiType", 
				DictionaryLib.getSelectJsonByCode(ApiConstants.DIC_ACTION_TYPE));
		
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, 
				DefaultPropertiesLoader.CONFIG_FILE);
		
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageOptions() {
		return pageOptions;
	}

	public void setPageOptions(String pageOptions) {
		this.pageOptions = pageOptions;
	}

	public ApiForm getApiForm() {
		return apiForm;
	}

	public void setApiForm(ApiForm apiForm) {
		this.apiForm = apiForm;
	}

	public String getApiId() {
		return apiId;
	}

	public void setApiId(String apiId) {
		this.apiId = apiId;
	}

}
