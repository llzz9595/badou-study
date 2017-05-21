package com.badou.project.moduleDemo.web.fun2;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.moduleDemo.model.Fun2DemoEntity;
import com.badou.project.moduleDemo.service.IFun2DemoService;
/**
 * 功能1示例删除事件
 * <p>对应的请求路径是：${context}/moduledemo/fun2/fun2demodelete/方法名.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun2DemoDeleteAction extends BaseJsonDeleteStrutsAction<Fun2DemoEntity, Serializable> {

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
