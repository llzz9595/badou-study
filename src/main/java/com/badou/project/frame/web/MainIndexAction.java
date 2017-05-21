package com.badou.project.frame.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.BaseStrutsAction;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class MainIndexAction extends BaseStrutsAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -22504034601732727L;
	/**
	 * 管理员角色-我的首页
	 * @return
	 * @throws Exception
	 */
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult(name="content",location="/content.jsp")
	public String adminIndex() throws Exception{
		
		return null;
	}
	
}
