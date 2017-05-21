package com.badou.project.moduleDemo.web.Demo16;

import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo16Entity;
import com.badou.project.moduleDemo.service.IDemo16Service;
import com.badou.project.moduleDemo.web.form.Demo16Form;
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
 * Created by lps on 2017/3/28.
 *
 */
@Controller
public class Demo16ListAction extends JsonListTemplateAction<Demo16Entity, Serializable, Demo16Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 6680776894637809336L;
	@Autowired
	private IDemo16Service Demo16Service;
	@Autowired
	public void setDemo16Service(IDemo16Service Demo16Service) {
		this.Demo16Service = Demo16Service;
		super.setBaseService(Demo16Service);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String ID = ParamUtils.getParameter(req, "id");
		
		Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
//		Date createDate = ParamDateUtils.getParameter(req, "createDate",DateUtils.DATE_FMT_CN_YMD);
		String lastUpdator = ParamUtils.getParameter(req, "lastUpdator");
		Date lastUpdateDate = ParamDateUtils.getParameter(req, "lastUpdateDate",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("id",ID,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeStart,null,QueryOperSymbolEnum.ge))
		.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeEnd,null,QueryOperSymbolEnum.le))
		.addParam(new QueryHibernatePlaceholderParam("lastUpdator",lastUpdator,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("lastUpdateDate",lastUpdateDate,null,QueryOperSymbolEnum.eq))
		.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));
	req.setAttribute(Request_Criterion, queryCriterion);
		
		
	}
	
}
