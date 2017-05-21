package com.badou.project.moduleDemo.web.fun3.children;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
import com.badou.project.moduleDemo.model.Fun3DemoChildEntity;
import com.badou.project.moduleDemo.service.IFun3DemoChildService;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoChildForm;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/children/Fun3/Fun3demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/children/Fun3/Fun3demoedit_edit.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun3DemoChildEditAction extends JsonEditTemplateAction<Fun3DemoChildEntity, Serializable, Fun3DemoChildForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun3DemoService Fun3DemoService;
	@Autowired
	private IFun3DemoChildService Fun3DemoChildService;
	@Autowired
	public void setFun3DemoChildService(IFun3DemoChildService Fun3DemoChildService) {
		this.Fun3DemoChildService = Fun3DemoChildService;
		super.setBaseService(Fun3DemoChildService);
	}
	
	
}
