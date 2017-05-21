package com.badou.project.moduleDemo.web.Demo16;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo16Entity;
import com.badou.project.moduleDemo.service.IDemo16Service;
import com.badou.project.moduleDemo.web.form.Demo16Form;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
/**
 * 编辑事件
 * 
 * Created by lps on 2017/3/28.
 *
 */
@Controller
public class Demo16EditAction extends JsonEditTemplateAction<Demo16Entity, Serializable, Demo16Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 6680776894637809336L;
	@Autowired
	private IDemo16Service Demo16Service;
	@Autowired
	public void setDemoService(IDemo16Service Demo16Service) {
		this.Demo16Service = Demo16Service;
		super.setBaseService(Demo16Service);
	}
	

	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@DispatcherResult
	@Override
	public String edit() throws Exception {
		String creator = LogonCertificateHolder.getLogonCertificate().getUserName();
		Date createDate = new Date();
		request.setAttribute("creator", creator);
		request.setAttribute("createDate", createDate);
		return "edit";
	}
}
