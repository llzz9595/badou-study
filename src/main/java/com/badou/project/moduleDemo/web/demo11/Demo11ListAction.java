package com.badou.project.moduleDemo.web.demo11;

import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo11Entity;
import com.badou.project.moduleDemo.service.IDemo11Service;
import com.badou.project.moduleDemo.web.form.Demo11Form;
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
public class Demo11ListAction extends JsonListTemplateAction<Demo11Entity, Serializable, Demo11Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo11Service Demo11Service;
	@Autowired
	public void setDemo11Service(IDemo11Service Demo11Service) {
		this.Demo11Service = Demo11Service;
		super.setBaseService(Demo11Service);
	}
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String ID = ParamUtils.getParameter(req, "id");
		String orderTitle = ParamUtils.getParameter(req, "orderTitle");
		String salmon = ParamUtils.getParameter(req, "salmon");
		String remark = ParamUtils.getParameter(req, "remark");
		String creator = ParamUtils.getParameter(req, "creator");
		Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
//		Date createDate = ParamDateUtils.getParameter(req, "createDate",DateUtils.DATE_FMT_CN_YMD);
		String lastUpdator = ParamUtils.getParameter(req, "lastUpdator");
		Date lastUpdateDate = ParamDateUtils.getParameter(req, "lastUpdateDate",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("id",ID,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("orderTitle",orderTitle,null,QueryOperSymbolEnum.rlike))
		.addParam(new QueryHibernatePlaceholderParam("salmon",salmon,null,QueryOperSymbolEnum.rlike))
		.addParam(new QueryHibernatePlaceholderParam("remark",remark,null,QueryOperSymbolEnum.rlike))
		.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.rlike))
		.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeStart,null,QueryOperSymbolEnum.ge))
		.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeEnd,null,QueryOperSymbolEnum.le))
		.addParam(new QueryHibernatePlaceholderParam("lastUpdator",lastUpdator,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("lastUpdateDate",lastUpdateDate,null,QueryOperSymbolEnum.eq))
		.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));
	req.setAttribute(Request_Criterion, queryCriterion);
		
		
	}
	
}
