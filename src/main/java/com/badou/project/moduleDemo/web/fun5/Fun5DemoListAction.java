package com.badou.project.moduleDemo.web.fun5;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;



import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.badou.project.moduleDemo.service.IFun5DemoService;
import com.badou.project.moduleDemo.web.form.Fun5DemoForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/fun5/fun5demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun5/fun5demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun5DemoListAction extends JsonListTemplateAction<Fun5DemoEntity, Serializable, Fun5DemoForm> {

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
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String name = ParamUtils.getParameter(req, "name");
		String stuID = ParamUtils.getParameter(req, "stuID");
		String address = ParamUtils.getParameter(req, "address");
		String sex = ParamUtils.getParameter(req, "sex");
		QueryCriterion queryCriterion = new QueryCriterion();
		QueryCriterion addParam = queryCriterion.addParam(new QueryHibernatePlaceholderParam("stuID",stuID,null,QueryOperSymbolEnum.like))
				
				.addParam(new QueryHibernatePlaceholderParam("name",name,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("address",address,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("sex",sex,null,QueryOperSymbolEnum.eq))
			.addOrder(new QueryOrderby(2,"age",SortOrderEnum.ase));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}
