package com.badou.project.moduleDemo.web.fun1;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.moduleDemo.service.IFun1DemoChildService;
import com.badou.project.moduleDemo.service.IFun1DemoService;
import com.badou.project.moduleDemo.web.form.Fun1DemoForm;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demoedit_edit.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun1DemoEditAction extends JsonEditTemplateAction<Fun1DemoEntity, Serializable, Fun1DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun1DemoService fun1DemoService;
	@Autowired
	private IFun1DemoChildService fun1DemoChildService;
	@Autowired
	public void setFun1DemoService(IFun1DemoService fun1DemoService) {
		this.fun1DemoService = fun1DemoService;
		super.setBaseService(fun1DemoService);
	}
	
	
}
