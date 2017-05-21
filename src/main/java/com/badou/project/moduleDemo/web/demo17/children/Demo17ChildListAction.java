package com.badou.project.moduleDemo.web.demo17.children;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.badou.project.moduleDemo.service.IDemo12ChildService;
import com.badou.project.moduleDemo.service.IDemo12Service;
import com.badou.project.moduleDemo.web.form.Demo12ChildForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduleDemo12//Demo12list/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo12//Demo12list_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo17ChildListAction extends JsonListTemplateAction<Demo12ChildEntity, Serializable, Demo12ChildForm> {

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
	@Override
	protected void exeBeforeList() throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		String orderID = ParamUtils.getParameter(req, "ID");
	  
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("orderID",orderID,null,QueryOperSymbolEnum.eq))
			
			.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));
		
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}
