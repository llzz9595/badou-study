package com.badou.project.moduleDemo.web.demo12;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo12Entity;
import com.badou.project.moduleDemo.service.IDemo12ChildService;
import com.badou.project.moduleDemo.service.IDemo12Service;
import com.badou.project.moduleDemo.web.form.Demo12Form;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduleDemo12//Demo12save/save.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo12SaveAction extends JsonSaveTemplateAction<Demo12Entity, Serializable, Demo12Form> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo12Service Demo12Service;
	@Autowired
	private IDemo12ChildService Demo12ChildService;
	@Autowired
	public void setDemo12Service(IDemo12Service Demo12Service) {
		this.Demo12Service = Demo12Service;
		super.setBaseService(Demo12Service);
	}
	
	
}
