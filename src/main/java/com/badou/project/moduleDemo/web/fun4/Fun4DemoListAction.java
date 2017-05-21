package com.badou.project.moduleDemo.web.fun4;
import java.io.Serializable;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
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
 * <p>对应的请求路径是：${context}/moduledemo/fun4/fun4demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun4/fun4demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun4DemoListAction extends JsonListTemplateAction<Fun4DemoEntity, Serializable, Fun4DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun4DemoService Fun4DemoService;
	@Autowired
	public void setFun4DemoService(IFun4DemoService Fun4DemoService) {
		this.Fun4DemoService = Fun4DemoService;
		super.setBaseService(Fun4DemoService);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String workerNum = ParamUtils.getParameter(req, "workerNum");
		String workerName=request.getParameter("workerName");
		String genre = ParamUtils.getParameter(req, "genre");
		Date entryTimeStart = ParamDateUtils.getParameter(req, "entryTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date entryTimeEnd = ParamDateUtils.getParameter(req, "entryTimeEnd",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		QueryCriterion addParam = queryCriterion.addParam(new QueryHibernatePlaceholderParam("workerNum",workerNum,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("workerName",workerName,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("genre",genre,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("entryTime",entryTimeStart,null,QueryOperSymbolEnum.ge))
			.addParam(new QueryHibernatePlaceholderParam("entryTime",entryTimeEnd,null,QueryOperSymbolEnum.le))
			.addOrder(new QueryOrderby(2,"entryTime",SortOrderEnum.desc));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}
