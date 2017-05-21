package com.shengdai.mobile.version.web.resourceversion;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.service.IResourceVersionService;
import com.shengdai.mobile.version.web.form.ResourceVersionForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demoedit_edit.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class ResourceVersionEditAction extends JsonEditTemplateAction<ResourceVersionEntity, Serializable, ResourceVersionForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2103386579686167571L;
	@Autowired
	private IResourceVersionService resourceVersionService;
	
	protected ResourceVersionForm resourceVersionForm;
	protected String versionApkId;
	
	@Autowired
	public void setFun1DemoService(IResourceVersionService resourceVersionService) {
		this.resourceVersionService = resourceVersionService;
		super.setBaseService(resourceVersionService);
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editAddUrl", location = "resourceversionlist_detail.jsp")
	public String editAddUrl() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		versionApkId = request.getParameter("versionApkId");
		return "editAddUrl";
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editUpdateUrl", location = "resourceversionlist_detail.jsp")
	public String editUpdateUrl() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		versionApkId = request.getParameter("versionApkId");
		
		String resourceVersionId = request.getParameter("resourceVersionId");
		resourceVersionForm = new ResourceVersionForm();
		ResourceVersionEntity instance = resourceVersionService.find(resourceVersionId);
		resourceVersionForm.setEntityToFormProperties(instance);
		return "editUpdateUrl";
		
	}

	public ResourceVersionForm getResourceVersionForm() {
		return resourceVersionForm;
	}

	public void setResourceVersionForm(ResourceVersionForm resourceVersionForm) {
		this.resourceVersionForm = resourceVersionForm;
	}

	public String getVersionApkId() {
		return versionApkId;
	}

	public void setVersionApkId(String versionApkId) {
		this.versionApkId = versionApkId;
	}

	
	
}
