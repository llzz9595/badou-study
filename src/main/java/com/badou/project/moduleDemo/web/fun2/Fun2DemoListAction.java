package com.badou.project.moduleDemo.web.fun2;
import java.io.Serializable;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.badou.project.moduleDemo.model.Fun2DemoEntity;
import com.badou.project.moduleDemo.service.IFun2DemoService;
import com.badou.project.moduleDemo.web.form.Fun2DemoForm;
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
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun2/Fun2demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/Fun2/Fun2demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun2DemoListAction extends JsonListTemplateAction<Fun2DemoEntity, Serializable, Fun2DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun2DemoService Fun2DemoService;
	@Autowired
	public void setFun2DemoService(IFun2DemoService Fun2DemoService) {
		this.Fun2DemoService = Fun2DemoService;
		super.setBaseService(Fun2DemoService);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String fieldName1 = ParamUtils.getParameter(req, "fieldName1");
		String fieldName2=request.getParameter("fieldName2");
		String creator = ParamUtils.getParameter(req, "creator");
		Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("fieldName1",fieldName1,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("fieldName2",fieldName2,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeStart,null,QueryOperSymbolEnum.ge))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeEnd,null,QueryOperSymbolEnum.le))
			.addOrder(new QueryOrderby(2,"createTime",SortOrderEnum.desc));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}
