package com.badou.project.moduleDemo.web.demo17.children;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.badou.project.moduleDemo.service.IDemo12ChildService;
import com.badou.project.moduleDemo.service.IDemo12Service;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
/**
 * 功能1示例删除事件
 * <p>对应的请求路径是：${context}/moduleDemo12//children/Demo12delete/方法名.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo17ChildDeleteAction extends BaseJsonDeleteStrutsAction<Demo12ChildEntity, Serializable> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo12Service Demo12Service;
	@Autowired
	private IDemo12ChildService Demo12ChildService;
	@Autowired
	public void setDemo12ChildService(IDemo12ChildService Demo12ChildService) {
		this.Demo12ChildService = Demo12ChildService;
		super.setBaseService(Demo12ChildService);
	}
	
	
}
