<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	组织列表
</title>
<%@ include file="/web/pub/head.inc"%>
<%
	session.setAttribute(Globals.COPY_DATA_IDS,null);
	
	//复制粘贴流程的session数据初始化清空 end
	String busiId = ParamUtils.getParameter(request,"busiId",null);
	String ftree = context+"/treeOrg.do1?jsFunc=listFlowBy"+busiId;
 %>
</head>
<body >
	<div class="kpi">
		<div id="divTree" class="sidebar">
			<h3>组织列表</h3>
			<iframe id="ftree"  src="<%=ftree %>" scrolling="auto" frameborder="0" name="ftree" width="100%" height="450px"></iframe>
		</div>
		<div id="divList" class="content2">
			<iframe src="${ROOT}/flow/view_flow_list_init.jsp" id="fbody" scrolling="no" frameborder="0" name="fbody" width="100%" height="450px" ></iframe>
		</div>
	</div>
</body>
</html>