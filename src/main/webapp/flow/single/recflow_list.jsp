<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.User"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecFlow"/>
<jsp:directive.page import="com.shengdai.kpi.flow.busi.BusinessObject"/>
<jsp:directive.page import="com.shengdai.kpi.flow.util.FlowUtils"/>
<jsp:directive.page import="com.shengdai.kpi.flow.FlowFactory"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Collections"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecNode"/>
<%@ include file="/web/pub/flow.inc"%>
<html>
<%	FlowFactory flowFactory = (FlowFactory)SpringHelper.getBean("flowFactory");	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<head>

<title>流程列表</title>
<link rel="stylesheet" type="text/css" href="${ROOT}/css/css.css">

</head>
<script type="text/javascript">

function ev_add(){
	var url = "${ROOT}/flow/flow_view_frame.jsp";
	window.open(url, "_blank", "width=800,height=600,left=110,top=80,resizable=no,status=no,scrollbars=yes");
}

function ev_del()
{
	var val=getAllChecked("rfid");
	if(val==""){
		alert("请选择您要删除的流程");
		return;
	}
  	if (confirm("您确认要删除流程？")) 
  	{ 
		flowForm.action="${ROOT}/deleteRecFlow.do1";
		flowForm.submit();
 	}
}

function ev_archive()
{
	var val=getAllChecked("rfid");
	if(val==""){
		alert("请选择您要归档的流程");
		return;
	}
  	if (confirm("您确认要归档流程？")) 
  	{ 
		flowForm.action="${ROOT}/archiveRecFlow.do1";
		flowForm.submit();
 	}
}

function ev_view(id){
	var url = "${ROOT}/monitorBoPrivateFlow.do1?mod=1&boid="+id;
	window.open(url, "_blank", "width=900,height=600,left=60,top=80,resizable=no,status=no,scrollbars=no");
}

function ev_changeArchive(){
	var archiveType = document.getElementById("archiveType").value;
	window.location.href="${ROOT}/listBusiRecFlow.do1?id=<%=request.getParameter("id")%>" +
			"&archiveType=" + archiveType;
}


</script>

<body topmargin="0" leftmargin="0">
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   	<tr> 
     	<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     	<td id=search width="500"> 
	 	<input type="button" value="删除" class=button onclick="ev_del()" >
	 	<input type="button" value="归档" class=button onclick="ev_archive()" >
     </td>     
     </tr></table></td></tr>     
</table>
<div align="center" class="title">流程实例浏览</div>
<div align="right" >
	<select id="archiveType" name="archiveType" onchange="ev_changeArchive();">
		<option value="-1" >全部</option>
		<option value="0" <%="0".equals(request.getParameter("archiveType"))?"selected":""%>>未归档</option>
		<option value="1" <%="1".equals(request.getParameter("archiveType"))?"selected":""%>>归档</option>
	</select>
</div>

<form name=flowForm action="/listFlowByBusi.do1" method="post">
<input type="hidden" name="fid" value="<%=request.getParameter("id")%>">
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
	<tr>
		<td class="title-header" align="center" width="7%" height="22">
			选择<input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'rfid');">
		</td>
		<td class="title-header" align="center" width="33%" height="22">业务对象</td>
		<td class="title-header" align="center" width="15%" height="22">发起时间</td>
		<td class="title-header" align="center" width="15%" height="22">当前环节</td>
		<td class="title-header" align="center" width="15%" height="22">当前达到时间</td>
		<td class="title-header" align="center" width="15%" height="22">归档时间</td>
	</tr>
	<%List list = (List)request.getAttribute("list");
	  for(int i=0; i<list.size(); i++){
	  	RecFlow recFlow=(RecFlow)list.get(i);
	  	BusinessObject bo = (BusinessObject) flowFactory.getObject(
	  			FlowUtils.forName(recFlow.getBoClass()), recFlow.getBoId());
	  	List temp = new ArrayList(recFlow.getRecNodeSet());
	  	Collections.sort(temp);
	  	RecNode recNode = (RecNode)temp.get(temp.size()-1);
	%>
		<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
			<td align="center" height="20">
			<input type="checkbox" name="rfid" value="<%=recFlow.getId()%>" 
				<%=recFlow.getCompletedate()==null?"":"disabled=\"disabled\""%>></td>
			<td align="left">
				<a href="javascript:ev_view('<%=recFlow.getBoId()%>');"><%=bo.getBOName()%></a></td>
			<td align="center"><%=sdf.format(recFlow.getGenDate())%></td>
			<td align="center" nowrap="nowrap">
				<%=recNode.getFlwNode().getNodeName()%>
			</td>
			<td align="center"><%=sdf.format(recNode.getGenDate())%></td>
			<td align="center"><%=recFlow.getCompletedate()==null?
					"<font color='red'>(未归档)</font>":sdf.format(recFlow.getCompletedate())%></td>
		</tr>
	<%} %>
</table>
<page:root inputclass="editline" />
</body>

</html>
