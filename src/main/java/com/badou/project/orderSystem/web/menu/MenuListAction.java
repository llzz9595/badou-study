package com.badou.project.orderSystem.web.menu;

import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.orderSystem.model.MenuEntity;
import com.badou.project.orderSystem.service.IMenuService;
import com.badou.project.orderSystem.web.form.MenuForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 查询事件
 * <p>对应的请求路径是：${context}/orderSystem/menu/menulist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/orderSystem/order/menulist_list.jsp
 * @author
 *
 */
@Controller
public class MenuListAction extends JsonListTemplateAction<MenuEntity, Serializable, MenuForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IMenuService MenuService;
	@Autowired
	public void setMenuService(IMenuService MenuService) {
		this.MenuService = MenuService;
		super.setBaseService(MenuService);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String menuName = ParamUtils.getParameter(req, "menuName");
		String restaurant=request.getParameter("restaurant");
		String effective =request.getParameter("effective");
		QueryCriterion queryCriterion = new QueryCriterion();
		QueryCriterion addParam = queryCriterion.addParam(new QueryHibernatePlaceholderParam("menuName",menuName,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("restaurant",restaurant,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("effective",effective,null,QueryOperSymbolEnum.like));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}

