package com.badou.project.moduleDemo.web.Demo16;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo16Entity;
import com.badou.project.moduleDemo.service.IDemo16Service;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
/**
 * 删除事件
 * Created by lps on 2017/3/28.
 *
 */
@Controller
public class Demo16DeleteAction extends BaseJsonDeleteStrutsAction<Demo16Entity, Serializable> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 6680776894637809336L;
	@Autowired
	private IDemo16Service Demo16Service;

	@Autowired
	public void setFun2DemoService(IDemo16Service Demo16Service) {
		this.Demo16Service = Demo16Service;
		super.setBaseService(Demo16Service);
	}
	
	
}
