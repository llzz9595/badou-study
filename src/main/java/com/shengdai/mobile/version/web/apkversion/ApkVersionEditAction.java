package com.shengdai.mobile.version.web.apkversion;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.service.IApkVersionService;
import com.shengdai.mobile.version.web.form.ApkVersionForm;
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
public class ApkVersionEditAction extends JsonEditTemplateAction<ApkVersionEntity, Serializable, ApkVersionForm> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2605021288327426299L;
	@Autowired
	private IApkVersionService apkVersionService;
	
	protected ApkVersionForm apkVersionForm;
	
	@Autowired
	public void setFun1DemoService(IApkVersionService apkVersionService) {
		this.apkVersionService = apkVersionService;
		super.setBaseService(apkVersionService);
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editAddUrl", location = "apkversionlist_detail.jsp")
	public String editAddUrl() throws Exception {
		return "editAddUrl";
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editUpdateUrl", location = "apkversionlist_detail.jsp")
	public String editUpdateUrl() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String apkVersionId = request.getParameter("apkVersionId");
		apkVersionForm = new ApkVersionForm();
		ApkVersionEntity instance = apkVersionService.find(apkVersionId);
		apkVersionForm.setEntityToFormProperties(instance);
		return "editUpdateUrl";
		
	}

	public ApkVersionForm getApkVersionForm() {
		return apkVersionForm;
	}

	public void setApkVersionForm(ApkVersionForm apkVersionForm) {
		this.apkVersionForm = apkVersionForm;
	}
	
	
}
