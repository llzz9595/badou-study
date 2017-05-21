package com.badou.project.jinhan.web.holiday;

import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.jinhan.service.IJinhanHolidayService;
import com.badou.project.jinhan.web.form.JinhanHolidayForm;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.ChainResult;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/*
 * 列表动作*/
@Controller
public class JinhanHolidayListAction extends JsonListTemplateAction<JinhanHolidayEntity, Serializable, JinhanHolidayForm>{
	private static final long serialVersionUID = 1670148639446876250L;
	@Autowired
	private IJinhanHolidayService jinhanHolidayService ;
	@Autowired
	public void setJinhanHolidayService(IJinhanHolidayService jinhanHolidayService) {
		this.jinhanHolidayService = jinhanHolidayService;
		super.setBaseService(jinhanHolidayService);
	}
	
		@Override
	protected void exeBeforeList() throws Exception {
HttpServletRequest req = ServletActionContext.getRequest();
		/*String periodb = ParamUtils.getParameter(req, "periodb");*/
		String membername = ParamUtils.getParameter(req, "membername");
		String agreeFlag=ParamUtils.getParameter(req, "agreeFlag");
		Date periodb = ParamDateUtils.getParameter(req, "periodb",DateUtils.DATE_FMT_CN_YMD);
		Date periode = ParamDateUtils.getParameter(req, "periode",DateUtils.DATE_FMT_CN_YMD);
		int days=Integer.parseInt(ParamUtils.getParameter(req, "days","1"));
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("memberName",membername,null,QueryOperSymbolEnum.rlike))
		.addParam(new QueryHibernatePlaceholderParam("periodb",periodb,null,QueryOperSymbolEnum.ge))
		.addParam(new QueryHibernatePlaceholderParam("periode",periode,null,QueryOperSymbolEnum.le))
		.addParam(new QueryHibernatePlaceholderParam("agreeFlag",agreeFlag,null,QueryOperSymbolEnum.eq))
				.addParam(new QueryHibernatePlaceholderParam("days",days,null,QueryOperSymbolEnum.ge));
	/*	queryCriterion.addParam(new QueryHibernatePlaceholderParam("code",code,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("name",name,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeStart,null,QueryOperSymbolEnum.ge))
			.addParam(new QueryHibernatePlaceholderParam("createTime",createTimeEnd,null,QueryOperSymbolEnum.le))
			.addOrder(new QueryOrderby(1,"priority",SortOrderEnum.ase))
			.addOrder(new QueryOrderby(2,"updateTime",SortOrderEnum.desc));*/
		req.setAttribute(Request_Criterion, queryCriterion);
	}
		
}
