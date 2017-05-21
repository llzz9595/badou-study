package com.badou.project.moduleDemo.web.fun3;
import java.io.Serializable;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.ui.ligerui.struts2.JsonListTreeTemplateAction;
import com.shengdai.global.Globals;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun2/Fun2demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/Fun2/Fun2demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun3DemoListAction extends JsonListTreeTemplateAction<Fun3DemoEntity, Serializable, Fun3DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun3DemoService fun3DemoService;
	@Autowired
	public void setFun3DemoService(IFun3DemoService fun3DemoService) {
		this.fun3DemoService = fun3DemoService;
		super.setBaseService(fun3DemoService);
	}
	
	

	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String pid = ParamUtils.getParameter(req, "pid", Globals.RESOURCE_ROOT_ID);
		String code = ParamUtils.getParameter(req, "code");
		String name = ParamUtils.getParameter(req, "name");
		String creator = ParamUtils.getParameter(req, "creator");
		Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("parent.id",pid, null, QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("code",code,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("name",name,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeStart,null,QueryOperSymbolEnum.ge))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeEnd,null,QueryOperSymbolEnum.le))
			.addOrder(new QueryOrderby(2,"createTime",SortOrderEnum.desc));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
	@Action
	@DispatcherResult
	public String frame() throws Exception {
		return "frame";
	}
}
