package com.badou.project.moduleDemo.web.fun3;
import java.io.Serializable;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import com.shengdai.base.support.struts.BaseStrutsEntityAction;
import com.shengdai.global.Globals;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoTreeForm;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;

public class Fun3DemoTreeAction extends BaseStrutsEntityAction<Fun3DemoEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2907612083822393710L;
	@Autowired
	private IFun3DemoService fun3DemoService;
	@Autowired
	public void setFun3DemoService(IFun3DemoService fun3DemoService) {
		this.fun3DemoService = fun3DemoService;
		super.setBaseService(fun3DemoService);
	}
	private List<Fun3DemoTreeForm> treeForms;
	
	public List<Fun3DemoTreeForm> getTreeForms() {
		return treeForms;
	}
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@JSONResult(params={"root", "treeForms"})
	public String tree() throws Exception {
		treeForms = fun3DemoService.getTreeByParentId(Globals.RESOURCE_ROOT_ID);
		return "tree";
	}
}
