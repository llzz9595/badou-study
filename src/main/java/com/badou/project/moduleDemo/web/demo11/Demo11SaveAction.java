package com.badou.project.moduleDemo.web.demo11;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo11Entity;
import com.badou.project.moduleDemo.service.IDemo11Service;
import com.badou.project.moduleDemo.web.form.Demo11Form;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 *保存新增事件
 * 
 * <p>对应的请求路径是：${context}/moduleDemo11//Demo11save/save.do

 *
 */
@Controller
public class Demo11SaveAction extends JsonSaveTemplateAction<Demo11Entity, Serializable, Demo11Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo11Service Demo11Service;
	@Autowired
	public void setDemo11Service(IDemo11Service Demo11Service) {
		this.Demo11Service = Demo11Service;
		super.setBaseService(Demo11Service);
	}
	
	
}
