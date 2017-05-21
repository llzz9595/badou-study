package com.badou.project.orderSystem.web.count;
import java.io.Serializable;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IWorkerService;
import com.badou.project.orderSystem.service.LigeruiListVO;
import com.badou.project.orderSystem.web.form.CountForm;
import com.badou.project.orderSystem.web.form.OrderForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.common.page.Pagelet;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.StringUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 查询事件
 * <p>对应的请求路径是：${context}/orderSystem/count/countlist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/orderSystem/menu/menulist_list.jsp
 * @author
 *
 */
@Controller
public class OrderListAction extends JsonListTemplateAction<WorkerEntity, Serializable, OrderForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IWorkerService workerService;
	@Autowired
	public void setCountService(IWorkerService workerService) {
		this.workerService = workerService;
		super.setBaseService(workerService);
	}
/*	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String orderdate= ParamUtils.getParameter(request, "order_Date");
		String order_Time=request.getParameter("order_Time");
		String menuName=request.getParameter("menuName");
		String workerName=request.getParameter("workerName");
		double priceSum= getDoubleParameter("priceSum");
		String restaurant=request.getParameter("restaurant");
		QueryCriterion queryCriterion = new QueryCriterion();
		QueryCriterion addParam = queryCriterion.addParam(new QueryHibernatePlaceholderParam("order_Date",orderdate,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("order_Time",order_Time,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("menuName",menuName,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("workerName",workerName,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("priceSum",priceSum,null,QueryOperSymbolEnum.like))
			.addParam(new QueryHibernatePlaceholderParam("restaurant",restaurant,null,QueryOperSymbolEnum.like));	
	}*/
	
LigeruiListVO<OrderForm> childlistvo1 = new LigeruiListVO<OrderForm>();
	
	public LigeruiListVO<OrderForm> getChildlistvo1() {
		return childlistvo1;
	}
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@JSONResult(params={"root","childlistvo1"})
	public String detailJSON() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderdate= ParamUtils.getParameter(request, "orderdate");
		String opinionDecoder = ParamUtils.getParameter(request, "ordertime");
		String dateTime = StringUtils.isEmpty(opinionDecoder) ? null: URLDecoder.decode(opinionDecoder,"utf-8");
		List list = workerService.querydetaillist(orderdate, dateTime);
		childlistvo1.setRows(list);
		childlistvo1.setTotal(list.size());
		return "detailJSON";
	}		
	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@DispatcherResult(name="result",location="/WEB-INF/jsp/ordersystem/count/orderlist_list.jsp")
	public String result() throws Exception {
		pageSize = PropertyUtils.getIntProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_PAGESIZE,
				DefaultPropertiesLoader.CONFIG_FILE);
		pageOptions = PropertyUtils.getProperty(DefaultPropertiesLoader.SDAP_APPFRAMEWORK_OPTIONS_PAGESIZE, 
				DefaultPropertiesLoader.CONFIG_FILE);
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderdate= ParamUtils.getParameter(request, "orderdate");
		String opinionDecoder = ParamUtils.getParameter(request, "ordertime");
		String dateTime = StringUtils.isEmpty(opinionDecoder) ? null: URLDecoder.decode(opinionDecoder,"utf-8");
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("opinionDecoder", dateTime);
		return "result";
	}
	
	
}
	
