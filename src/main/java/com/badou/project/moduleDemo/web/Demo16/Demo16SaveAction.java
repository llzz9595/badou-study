package com.badou.project.moduleDemo.web.Demo16;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo16Entity;
import com.badou.project.moduleDemo.service.IDemo16Service;
import com.badou.project.moduleDemo.web.form.Demo16Form;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 *保存新增事件
 * 
 * <p>对应的请求路径是：${context}/moduleDemo16//Demo16save/save.do

 *
 */
@Controller
public class Demo16SaveAction extends JsonSaveTemplateAction<Demo16Entity, Serializable, Demo16Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 6680776894637809336L;
	@Autowired
	private IDemo16Service Demo16Service;
	@Autowired
	public void setDemo16Service(IDemo16Service Demo16Service) {
		this.Demo16Service = Demo16Service;
		super.setBaseService(Demo16Service);
	}
	
	
}
