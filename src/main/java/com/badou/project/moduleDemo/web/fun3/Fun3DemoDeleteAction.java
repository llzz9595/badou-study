package com.badou.project.moduleDemo.web.fun3;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IFun3DemoService;
/**
 * 功能3示例删除事件
 * <p>对应的请求路径是：${context}/moduledemo/fun3/fun3demodelete/方法名.do
 * @author xiangsf 2013-3-18
 *
 */
@Controller
public class Fun3DemoDeleteAction extends BaseJsonDeleteStrutsAction<Fun3DemoEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun3DemoService Fun3DemoService;

	@Autowired
	public void setFun3DemoService(IFun3DemoService Fun3DemoService) {
		this.Fun3DemoService = Fun3DemoService;
		super.setBaseService(Fun3DemoService);
	}
	
	
}
