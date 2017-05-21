package com.badou.project.moduleDemo.web.fun5;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
import com.badou.project.moduleDemo.help.AttachImgCaches;
import com.badou.project.moduleDemo.help.CommonAttachByAttachId;
import com.badou.project.moduleDemo.help.AttachImgCaches.AttachImg;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.service.IFun5DemoService;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
import com.badou.project.moduleDemo.web.form.Fun5DemoForm;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/Fun4/Fun4demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/Fun4/Fun4demoedit_form.jsp
 * @author xiangsf 4013-1-18
 *
 */
@Controller
public class Fun5DemoEditAction extends JsonEditTemplateAction<Fun5DemoEntity, Serializable, Fun5DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;   //一个类的唯一标志
	@Autowired
	private IFun5DemoService Fun5DemoService;
	@Autowired
	public void setFun5DemoService(IFun5DemoService Fun5DemoService) {
		this.Fun5DemoService = Fun5DemoService;
		super.setBaseService(Fun5DemoService);
	}
	
	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@DispatcherResult()
	@Override
	public String edit() throws Exception {
		
		return super.edit();
	}
	
	
	
}