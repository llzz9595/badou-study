package com.badou.project.moduleDemo.web.fun5;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.service.IFun5DemoService;
/**
 * 功能1示例删除事件
 * <p>对应的请求路径是：${context}/moduledemo/fun4/fun4demodelete/方法名.do
 * @author xiangsf 4013-1-18
 *
 */
@Controller
public class Fun5DemoDeleteAction extends BaseJsonDeleteStrutsAction<Fun5DemoEntity, Serializable> {

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
