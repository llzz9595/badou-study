package com.badou.project.moduleDemo.web.fun3.children;
import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
import com.shengdai.kpi.util.ParamUtils;
import com.badou.project.moduleDemo.model.Fun3DemoChildEntity;
import com.badou.project.moduleDemo.service.IFun3DemoChildService;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoChildForm;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun3/Fun3demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/Fun3/Fun3demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun3DemoChildListAction extends JsonListTemplateAction<Fun3DemoChildEntity, Serializable, Fun3DemoChildForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun3DemoService Fun3DemoService;
	@Autowired
	private IFun3DemoChildService Fun3DemoChildService;
	@Autowired
	public void setFun3DemoChildService(IFun3DemoChildService Fun3DemoChildService) {
		this.Fun3DemoChildService = Fun3DemoChildService;
		super.setBaseService(Fun3DemoChildService);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String menuId = ParamUtils.getParameter(req, "fun3DemoId");
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("MENU_ID",menuId,null,QueryOperSymbolEnum.eq))
			.addOrder(new QueryOrderby(1,"priority",SortOrderEnum.ase))
			.addOrder(new QueryOrderby(2,"createTime",SortOrderEnum.desc));
		req.setAttribute(Request_Criterion, queryCriterion);
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}
