<%
	String busiId = request.getParameter("busiId");
	String orgId = request.getParameter("orgId");
	if(orgId == null || orgId.length()==0){
		orgId = (String)request.getAttribute("orgId");
	}
	if(busiId == null || busiId.length()==0)
		busiId = (String)request.getAttribute("busiId");

	pageContext.setAttribute("orgId",orgId);
	pageContext.setAttribute("busiId",busiId);
	String urlPara = "&orgId="+orgId+"&busiId="+busiId;
	//out.println("<script>alert('orgId:"+ orgId +",busiId="+busiId+",url:"+request.getRequestURL()+"');</script>");
	out.println("<script>var urlPara = '"+urlPara+"';</script>");
 %>