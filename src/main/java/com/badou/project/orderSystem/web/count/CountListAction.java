package com.badou.project.orderSystem.web.count;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.orderSystem.model.CountEntity;
import com.badou.project.orderSystem.service.ICountService;
import com.badou.project.orderSystem.service.LigeruiListVO;
import com.badou.project.orderSystem.web.form.CountForm;
import com.shengdai.base.query.ICriterion;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 查询事件
 * <p>对应的请求路径是：${context}/orderSystem/count/countlist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/orderSystem/menu/menulist_list.jsp
 * @author
 *
 */
@Controller
public class CountListAction extends JsonListTemplateAction<CountEntity, Serializable, CountForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private ICountService countService;
	@Autowired
	public void setCountService(ICountService countService) {
		this.countService = countService;
		super.setBaseService(countService);
	}

 
	LigeruiListVO<CountForm> childlistvo1 = new LigeruiListVO<CountForm>();
	
	public LigeruiListVO<CountForm> getChildlistvo1() {
		return childlistvo1;
	}
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@JSONResult(params={"root","childlistvo1"})
	public String historyJSON() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Date orderdate = ParamDateUtils.getParameter(request, "order_Date",DateUtils.DATE_FMT_CN_YMD);
		String ordertime= ParamUtils.getParameter(request, "order_Time");
		String workerId = ParamUtils.getParameter(request, "workerId");
		double priceSum= getDoubleParameter("priceSum");
		Date createTime = ParamDateUtils.getParameter(request, "CREATE_TIME",DateUtils.DATE_FMT_CN_YMD);
		String status =ParamUtils.getParameter(request, "status");
		pagelet = countService.queryHistory(orderdate,ordertime,workerId,priceSum,createTime,status);
		childlistvo1.setRows(pagelet.getDatas());			
		childlistvo1.setTotal(pagelet.getTotalCount());	
		return "historyJSON";
	}
	private double getDoubleParameter(String string) {
		// TODO Auto-generated method stub
		return 0;
	}	
}

