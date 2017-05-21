package com.shengdai.bpms.view;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.shengdai.base.support.struts.BaseStrutsAction;
import com.shengdai.global.util.ParamUtils;
/**
 * 流程相关的Action基类
 * @author xiangsf 2013-4-3
 *
 */
public class BaseStrutsBpmsAction extends BaseStrutsAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7954295517641049385L;
	/**
	 * 获得流程中的业务对象ID
	 * @return
	 */
	protected String getBusinessObjectId(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String boId = (String)request.getAttribute("boId");
		if(StringUtils.isBlank(boId)){
			boId = ParamUtils.getParameter(request, "boId");
		}
		return boId;
	}
}
