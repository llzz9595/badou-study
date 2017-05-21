package com.shengdai.mobile.openapi.web;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;
/**
 * 功能1示例删除事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demodelete/方法名.do
 * @author xpp 
 *
 */
@Controller
public class ApiDeleteAction extends BaseJsonDeleteStrutsAction<ApiEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4350587579602777184L;

	@Autowired
	private IApiService apiService;
	@Autowired
	public void setApiService(IApiService apiService) {
		this.apiService = apiService;
		super.setBaseService(apiService);
	}
	
	
}
