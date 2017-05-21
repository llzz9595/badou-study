package com.badou.project.common.tags.flow;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.shengdai.bpms.beans.instance.NodeInstanceBean;
import com.shengdai.bpms.beans.instance.RouteInstanceBean;
import com.shengdai.bpms.iface.IBpmsFlowInstanceService;
import com.shengdai.factory.InstanceFactory;

public class LigerUIRouteTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4414945334179837557L;

	private String worklistId;
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		IBpmsFlowInstanceService bpmsFlowInstanceService = InstanceFactory.getInstance(IBpmsFlowInstanceService.class);
		List<RouteInstanceBean> routes = bpmsFlowInstanceService.getWorklistRoutes(worklistId);
		NodeInstanceBean nodeInstance = bpmsFlowInstanceService.getNodeInstance(worklistId);
		JspWriter out = pageContext.getOut();
		
		try {
			out.print("<input type='hidden' id='flgFullScreen' name='flgFullScreen' value='"+nodeInstance.isFlgFullScreen()+"'/>");
			out.print("<input type='hidden' id='worklistId' name='worklistId' value='"+worklistId+"'/>");
			out.print("<input type='hidden' id='handleWay' name='handleWay' value='"+nodeInstance.getHandleWay()+"'/>");
			out.print(makeRouteButtons(routes));
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	private String makeRouteButtons(List<RouteInstanceBean> routes){
		StringBuilder sbuilder = new StringBuilder();
		sbuilder.append("<div class=\"form-top-bar\"><div class=\"form-bar-inner\">");
		for(RouteInstanceBean r : routes){
			int width = r.getRouteName().length()*15;
			sbuilder.append("<div id=\""+r.getId()+"\" class=\"l-dialog-btn l-route-btn l-routeSubmit\" style=\"width:"+width+"px\" routeId=\""+r.getId()+"\"><div class=\"l-dialog-btn-l\"></div>")
			.append("<div class=\"l-dialog-btn-r\"></div><div class=\"l-dialog-btn-inner\">"+r.getRouteName()+"</div></div>");
		}
		
		sbuilder.append("</div></div>");
		
		return sbuilder.toString();
	}
	/**
	 * @return the worklistId
	 */
	public String getWorklistId() {
		return worklistId;
	}
	/**
	 * @param worklistId the worklistId to set
	 */
	public void setWorklistId(String worklistId) {
		this.worklistId = worklistId;
	}

	
}
