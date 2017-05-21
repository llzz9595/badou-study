package com.shengdai.mobile.common.struts2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.shengdai.base.support.struts.BaseStrutsAction;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.mobile.MobileConstants;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;

public class JsonMobileTemplateAction extends BaseStrutsAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2124879070643074582L;

	@Override
	public void prepare() throws Exception {
		super.prepare();
		String userId  = ParamUtils.getParameter(request, "userId");
		if(StringUtils.isNotBlank(userId)){
			LogonCertificateHolder.setLogonCertificate(new LogonCertificate("", userId, ""));
		}else{ //这里给一个默认值，以防止后面空指针，尽管这个值是错误的
			LogonCertificateHolder.setLogonCertificate(new LogonCertificate("sa", "000010004700001", "sa"));
		}
	}

	public void outJsonp(Object o) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String callback = ParamUtils.getParameter(request, MobileConstants.JSONP_CALLBACK);
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(callback + "(" + o + ")");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			out.print(callback + "()");
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}
	
	public void outJson(Object o) {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(o);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			out.print(false);
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}
}
