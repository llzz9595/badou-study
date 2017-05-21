package com.shengdai.mobile.openapi.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shengdai.mobile.openapi.ApiConstants;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.smack.util.PushInterfacesUtil;

public class OpenApiFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String url = request.getServletPath();
		PrintWriter out = null;
		try {
			if (!url.matches(".*appinter/.*do")) {
				chain.doFilter(arg0, arg1);
			}else{
				ApiEntity entity = PushInterfacesUtil.isInterfaceValid(url);
				//HttpReqUtil.isFromMobile(request)
				if (entity != null && 
						ApiConstants.ACTION_TYPE_FORBIDDEN.equals(entity.getType())) {
					out = response.getWriter();
					out.print(ApiConstants.ACTION_MSG_FORBIDDEN);
				}else {
					chain.doFilter(arg0, arg1);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}
}
