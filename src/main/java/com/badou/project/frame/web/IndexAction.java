package com.badou.project.frame.web;

import java.util.List;


import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;

import com.shengdai.base.support.struts.BaseStrutsAction;
import com.shengdai.brms.BrmsRoleHelper;
import com.shengdai.brms.beans.RoleBean;
import com.shengdai.brms.iface.IBrmsOrgService;
import com.shengdai.global.util.http.UrlUtils;
import com.shengdai.kpi.system.security.service.IResourceService;
import com.shengdai.kpi.system.security.service.IRoleService;
import com.shengdai.kpi.system.security.vo.Resource;
import com.shengdai.kpi.system.security.vo.Role;
import com.shengdai.kpi.system.security.web.MenuTreeForm;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.RedirectFullResult;
import com.shengdai.ssl.local.LogonCertificateHolder;

public class IndexAction extends BaseStrutsAction {

	public static final String FORWORD_TAB_ID_PARAMNAME = "menuId";
	/** 
	 * @Description TODO
	 * @Fields serialVersionUID 
	 */ 
	private static final long serialVersionUID = 7373836405790865480L;
	@Autowired
	private IResourceService resourceService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	protected IBrmsOrgService brmsOrgService;

	
	private String menuId; 
	private List<MenuTreeForm> menus;
	public String getMenuId() {
		return menuId;
	}

	public List<MenuTreeForm> getMenus() {
		return menus;
	}
	
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult(name="top",location="/top.jsp")
	public String top(){
		String currentRoleId = LogonCertificateHolder.getLogonCertificate().getRoleId();
		boolean toporderbutton=false;
		if(StringUtils.isNotBlank(currentRoleId)){
			RoleBean roleBean = BrmsRoleHelper.getRole(currentRoleId);
			toporderbutton = roleBean.isSaler();
		}
		ServletActionContext.getRequest().setAttribute("toporderbutton",toporderbutton);
		ServletActionContext.getRequest().setAttribute("currentUser", com.shengdai.kpi.system.CommonLoginUser.getCurrentDefaultUserHolder());
		return "top";
	}
	

	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult(name="content",location="/content.jsp")
	public String content(){
		//获得菜单
		menus = resourceService.getMenuModule();
		for(MenuTreeForm m : menus){
			m.getLigerTree().setShowRoot(false);
			m.setTreeJson(m.toJSONTreeText());
		}
		Role role = roleService.findById(LogonCertificateHolder.getLogonCertificate().getRoleId());
		ServletActionContext.getRequest().setAttribute("indexUrl", 
				role != null && StringUtils.isNotBlank(role.getIndexUrl()) ? role.getIndexUrl() : "/main.jsp");
		return "content";
	}

	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@DispatcherResult(name="bottom",location="/bottom.jsp")
	public String bottom(){
		return "bottom";
	}

	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@RedirectFullResult
	public String forward(){
		Resource menu = resourceService.findById(menuId);
		if(menu != null){
			//组装
			String url = menu.getUrl();
			if(StringUtils.isNotEmpty(url)){
				return UrlUtils.combUrl(url.trim(), FORWORD_TAB_ID_PARAMNAME, menu.getId());
			}
		}
		//没有地址，转到一个中间页面
		return EERROR;
	}
}
