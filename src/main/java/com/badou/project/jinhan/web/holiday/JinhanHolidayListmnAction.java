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
public class JinhanHolidayListmnAction extends JsonListTemplateAction<JinhanHolidayEntity, Serializable, JinhanHolidayForm>{
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
		HttpSession session=request.getSession();
		LogonCertificate certificate = (LogonCertificate)session.getAttribute(com.shengdai.kpi.system.Globals.LOGON_KPIUSER);
		String memberId=certificate.getUserId();
		String agreeFlag=ParamUtils.getParameter(req, "agreeFlag");
		int days=Integer.parseInt(ParamUtils.getParameter(req, "days","1"));
		Date periodb = ParamDateUtils.getParameter(req, "periodb",DateUtils.DATE_FMT_CN_YMD);
		Date periode = ParamDateUtils.getParameter(req, "periode",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("memberId",memberId,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("periodb",periodb,null,QueryOperSymbolEnum.ge))
		.addParam(new QueryHibernatePlaceholderParam("periode",periode,null,QueryOperSymbolEnum.le))
		.addParam(new QueryHibernatePlaceholderParam("agreeFlag",agreeFlag,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("days",days,null,QueryOperSymbolEnum.ge));
		req.setAttribute(Request_Criterion, queryCriterion);
	}
		
}
