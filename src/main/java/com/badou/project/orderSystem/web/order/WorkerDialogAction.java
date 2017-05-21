package com.badou.project.orderSystem.web.order;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
import com.shengdai.ui.ligerui.vo.LigeruiListVO;
import com.badou.project.orderSystem.model.MenuEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IMenuService;
import com.badou.project.orderSystem.service.IWorkerService;
import com.badou.project.orderSystem.web.form.MenuForm;
import com.badou.project.orderSystem.web.form.WorkerForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.global.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;

/**
 * @author Lin
 * @date 2013-3-9 上午11:30:03
 */
@Controller
public class WorkerDialogAction extends JsonListTemplateAction<MenuEntity, Serializable, MenuForm>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7816492485843634755L;

	protected List<WorkerEntity> queryValue=null;
	@Autowired
	private IMenuService MenuService;
	@Autowired
	public void setMenuService(IMenuService MenuService) {
		this.MenuService = MenuService;
		super.setBaseService(MenuService);
	}
	public List<WorkerEntity> getQueryValue() {
		return queryValue;
	}

	protected Integer pageSize = 0;

	protected String pageOptions;
	public Integer getPageSize() {
		return pageSize;
	}
	public String getPageOptions() {
		return pageOptions;
	}

	
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult(name="query",location="/WEB-INF/jsp/ordersystem/workeredit_edit.jsp")
	public String query() throws Exception {
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, DefaultPropertiesLoader.CONFIG_FILE);
		return "query";
	}
	
	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@DispatcherResult(name="list",location="/WEB-INF/jsp/ordersystem/order/workeredit_edit.jsp")
	@Override
	public String list() throws Exception {
		// TODO Auto-generated method stub
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, DefaultPropertiesLoader.CONFIG_FILE);
	
		return super.list();
	}
	

	/*@Action(interceptorRefs = @InterceptorRef("pageStack"))
	@JSONResult(params={"root","listvo"})
	public String queryJSON()throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		String params=ParamUtils.getParameter(request, "params");
		if(params!=null)
			params=params.trim();
		pagelet = workerService.queryByParams(params);//加载得到客户数据
		
		convert(pagelet);
		this.exeAfterList();
		listvo = new LigeruiListVO<WorkerForm>();
		listvo.setTotal(pagelet.getTotalCount());
		System.out.println(pagelet.getDatas());
		listvo.setRows(pagelet.getDatas());
		return "queryJSON";
	}
	
	//将CustomEntity的列表转换成Object类的列表
	public List<Object> entityToObject(List<WorkerEntity> queryValue){
		//List<Object> list=new List();
		List<Object> list = new ArrayList<Object>();
		for(int i=0;i<queryValue.size();i++)
			list.add(i, (Object)queryValue.get(i));
		return list;
	}	*/
	
	/*exeBeforeList()方法是：执行列表前事件（搜索）
	 * 打开页面后，会先加载一个搜索框，将搜索的条件放入QueryCriterion
	 * */
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();	//创建一个request对象，通过request的getRequest()方法获取前台传过来的参数。
		String menuName = ParamUtils.getParameter(req, "menuName");
		String restaurant=request.getParameter("restaurant");
		//Quericition是一个查询对象，它的addparamer()方法将前台搜索框的参数放进这个对象里面，然后再把这个对象放进request里面
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("menuName",menuName,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("restaurant",restaurant,null,QueryOperSymbolEnum.like));
		req.setAttribute(Request_Criterion, queryCriterion);	//此request是一个线程变量，之后就可以通过request.getattribute方法获取这些参数了
	}
}
