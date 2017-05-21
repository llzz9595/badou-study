package com.badou.project.moduleDemo.web.demo11;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo11Entity;
import com.badou.project.moduleDemo.service.IDemo11Service;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
/**
 * 删除事件
 * Created by lps on 2017/3/28.
 *
 */
@Controller
public class Demo11DeleteAction extends BaseJsonDeleteStrutsAction<Demo11Entity, Serializable> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo11Service Demo11Service;

	@Autowired
	public void setFun2DemoService(IDemo11Service Demo11Service) {
		this.Demo11Service = Demo11Service;
		super.setBaseService(Demo11Service);
	}
	
	
}
