package com.shengdai.mobile.version.web.apkversion;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.param.ParamIntegerUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.service.IApkVersionService;
import com.shengdai.mobile.version.web.form.ApkVersionForm;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demolist/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/fun1/fun1demolist_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class ApkVersionListAction extends JsonListTemplateAction<ApkVersionEntity, Serializable, ApkVersionForm> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7752773541515891304L;
	@Autowired
	private IApkVersionService apkVersionService;
	@Autowired
	public void setApkVersionService(IApkVersionService apkVersionService) {
		this.apkVersionService = apkVersionService;
		super.setBaseService(apkVersionService);
	}
	
	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String versionName = ParamUtils.getParameter(req, "versionName");
		Integer versionNum = ParamIntegerUtils.getParameter(req, "versionNum",0);
		
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("versionName",versionName,null,QueryOperSymbolEnum.like));
		if(versionNum!=0){
			queryCriterion.addParam(new QueryHibernatePlaceholderParam("versionNum",versionNum,null,QueryOperSymbolEnum.eq));
		}
		/**
		String orgId = LogonCertificateHolder.getLogonCertificate().getOrgId();
		if(StringUtils.isNotBlank(orgId)){
			if(!orgId.equals("ROOT")){
				queryCriterion.addParam(new QueryHibernatePlaceholderParam("orgId",orgId,null,QueryOperSymbolEnum.eq));
			}
		}
		*/
		req.setAttribute(Request_Criterion, queryCriterion);
		
	}
}
