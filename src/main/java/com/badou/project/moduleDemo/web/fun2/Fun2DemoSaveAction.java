package com.badou.project.moduleDemo.web.fun2;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.badou.project.moduleDemo.model.Fun2DemoEntity;
import com.badou.project.moduleDemo.service.IFun2DemoService;
import com.badou.project.moduleDemo.web.form.Fun2DemoForm;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun2/Fun2demosave/save.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun2DemoSaveAction extends JsonSaveTemplateAction<Fun2DemoEntity, Serializable, Fun2DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun2DemoService Fun2DemoService;
	@Autowired
	public void setFun2DemoService(IFun2DemoService Fun2DemoService) {
		this.Fun2DemoService = Fun2DemoService;
		super.setBaseService(Fun2DemoService);
	}
	
	
}
