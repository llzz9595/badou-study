package com.shengdai.mobile.version.web.resourceversion;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.service.IResourceVersionService;
import com.shengdai.mobile.version.web.form.ResourceVersionForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class ResourceVersionListAction extends JsonListTemplateAction<ResourceVersionEntity, Serializable, ResourceVersionForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3728861841959838666L;
	@Autowired
	private IResourceVersionService resourceVersionService;
	
	protected String apkId;
	
	@Autowired
	public void setFun1DemoService(IResourceVersionService resourceVersionService) {
		this.resourceVersionService = resourceVersionService;
		super.setBaseService(resourceVersionService);
	}
	
	@Override
	protected void exeBeforeList() throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String versionName = ParamUtils.getParameter(req, "versionName");
		String versionNum = ParamUtils.getParameter(req, "versionNum");
		
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("versionName",versionName,null,QueryOperSymbolEnum.like))
					  .addParam(new QueryHibernatePlaceholderParam("versionNum",versionNum,null,QueryOperSymbolEnum.like))
					  .addParam(new QueryHibernatePlaceholderParam("apkId",apkId,null,QueryOperSymbolEnum.eq));
		
		req.setAttribute(Request_Criterion, queryCriterion);
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult (name = "list", location = "resourceversionlist_list.jsp")
	public String list() throws Exception {
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, 
				DefaultPropertiesLoader.CONFIG_FILE);
		HttpServletRequest req = ServletActionContext.getRequest();
		apkId = ParamUtils.getParameter(req, "apkId");
		System.out.println(apkId);
		return "list";
	}

	public String getApkId() {
		return apkId;
	}

	public void setApkId(String apkId) {
		this.apkId = apkId;
	}
	
}
