package com.badou.project.moduleDemo.web.demo13;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
/**
 * 功能3示例删除事件
 * <p>对应的请求路径是：${context}/moduleDemo13//Demo13delete/方法名.do
 * @author xiangsf 2013-3-18
 *
 */
@Controller
public class Demo13DeleteAction extends BaseJsonDeleteStrutsAction<Demo13Entity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo13Service Demo13Service;

	@Autowired
	public void setDemo13Service(IDemo13Service Demo13Service) {
		this.Demo13Service = Demo13Service;
		super.setBaseService(Demo13Service);
	}
	
	
}
