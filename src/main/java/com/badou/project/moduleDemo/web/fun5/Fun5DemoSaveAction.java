package com.badou.project.moduleDemo.web.fun5;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import antlr.StringUtils;

import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.service.IFun5DemoService;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
import com.badou.project.moduleDemo.web.form.Fun5DemoForm;
import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;

import freemarker.template.utility.StringUtil;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun4/Fun4demosave/save.do
 * @author xiangsf 4013-1-18
 *
 */
@Controller
public class Fun5DemoSaveAction extends JsonSaveTemplateAction<Fun5DemoEntity, Serializable, Fun5DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun5DemoService Fun5DemoService;
	@Autowired
	public void setFun5DemoService(IFun5DemoService Fun5DemoService) {
		this.Fun5DemoService = Fun5DemoService;
		super.setBaseService(Fun5DemoService);
	}
	

}
