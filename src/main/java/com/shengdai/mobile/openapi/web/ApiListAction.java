package com.shengdai.mobile.openapi.web;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.kpi.dictionary.DictionaryLib;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.mobile.openapi.ApiConstants;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;
import com.shengdai.mobile.openapi.web.form.ApiForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demolist_list.jsp
 * @author xpp 2013-1-18
 *
 */
@Controller
public class ApiListAction extends JsonListTemplateAction<ApiEntity, Serializable, ApiForm> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5588997786179108513L;
	
	@Autowired
	private IApiService apiService;
	@Autowired
	public void setApiService(IApiService apiService) {
		this.apiService = apiService;
		super.setBaseService(apiService);
	}
	
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String name = ParamUtils.getParameter(req, "name");
		String types = ParamUtils.getParameter(req, "type");
		String type = null;
		if(!StringUtils.isBlank(types))
			type=DictionaryLib.getItemValue(ApiConstants.DIC_ACTION_TYPE,types);	

		
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("name",name,null,QueryOperSymbolEnum.like))
					  .addParam(new QueryHibernatePlaceholderParam("type",type,null,QueryOperSymbolEnum.like))
					  .addOrder(new QueryOrderby(1,"createTime",SortOrderEnum.desc));
		
		req.setAttribute(Request_Criterion, queryCriterion);
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "openapilist", location = "openapilist_list.jsp")
	public String openapiList() throws Exception {
		
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, 
				DefaultPropertiesLoader.CONFIG_FILE);
		
		ServletActionContext.getRequest().setAttribute("apiType", 
				DictionaryLib.getSelectJsonByCode(ApiConstants.DIC_ACTION_TYPE));
		
		return "openapilist";
		
	}
	
}
