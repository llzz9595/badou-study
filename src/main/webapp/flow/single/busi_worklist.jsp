<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="com.shengdai.kpi.flow.busi.BusinessObject"/>
<jsp:directive.page import="com.shengdai.kpi.flow.web.BoInfo"/>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IFlowService"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="/web/pub/flow.inc"%>
<html>
<%	List worklist = (List)request.getAttribute("list"); 
	Map dtLimitDateMap = (Map)request.getAttribute("dtLimitDateMap");
	Map boMap = (Map)request.getAttribute("boMap");
	IFlowService flowService = (IFlowService)SpringHelper.getBean("flowService");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String busi = request.getParameter("busi");
%>
<head>

<title>流程列表</title>
<link rel="stylesheet" type="text/css" href="${ROOT}/css/css.css">
</head>
<script type="text/javascript" src="${ROOT}/common/js/common.js"></script>
<script type="text/javascript">

function ev_submitPrivateRoute(){
	var ids = getAllChecked('wlid');
	if(ids==""){
		alert("请选择一条记录");
		return;	
	}
	if(ids.split(";").length>1){
		alert("只能选择一条记录");
		return;
	}
	if(confirm("您确定提交吗?")){
		var boinfo = ids.split("--")[0];
		var thisNodeCode = ids.split("--")[1];
		window.open("${ROOT}/viewFreeFlow.do1?boInfo="+boinfo+"&thisNodeCode="+thisNodeCode,
				'',"width=750px,heigh:600px,left=150,top=50,status=off"); 
		location.reload();
	}
}

function ev_abandon()
{
	var ids = getAllChecked('wlid');
	if(ids==""){
		alert("请选择一条记录");
		return;	
	}
	if(ids.split(";").length>1){
		alert("只能选择一条记录");
		return;
	}
	if(confirm("您确定废弃该文档吗?文档废弃后会移至回收站。")){
		var boid = ids.split(",")[0];
		location.href="${ROOT}/deleteBoPrivateFlow.do1?forward=busi_worklist&busi=<%=busi%>&boid="+boid;
	}
}

function ev_view(id) 
{
	var url="${ROOT}/viewDocument.do1?flwFlg=1&documentId="+id;
	window.open(url,'',"dialogHeight="+screen.availHeight+"px,dialogWidth="+screen.availWidth+"px,scrollbars=yes,resizable=yes,status=off");
}

</script>

<body topmargin="0" leftmargin="0">
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   	<tr> 
     	<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     	<td id=search width="500"> 
	 	<input type="button" class="button" value="处理" onclick="ev_submitPrivateRoute();">
	 	<input type="button" class="button" value="废弃" onclick="ev_abandon();">
     </td>     
     </tr></table></td></tr>     
</table>
<div align="center" class="title">待处理文档</div>

<form name=flowForm action="/listFlowByBusi.do1" method="post">
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
	<tr>
		<td class="title-header" align="center" width="10%" height="22">
			选择
		</td>
		<td class="title-header" align="center" width="30%" height="22">业务对象</td>
		<td class="title-header" align="center" width="15%" height="22">发起人</td>
		<td class="title-header" align="center" width="15%" height="22">当前环节</td>
		<td class="title-header" align="center" width="15%" height="22">到达时间</td>
		<td class="title-header" align="center" width="15%" height="22">处理时间</td>
	</tr>
	<% 	for(int i=0; i<worklist.size(); i++){
			WorklistItem item = (WorklistItem)worklist.get(i);
			BusinessObject bo = (BusinessObject)boMap.get(item.getId());
			BoInfo info = new BoInfo(item.getBoId(), item.getGenDate(), item
								.getHandler(), item.getHandlerName(), item
								.getSender(), item.getSenderName(), item
								.getNodeCode(), item.getId(), item.getBoClass(),
								item.getSrcHandler(), item.getSrcHandlerName());
	%>
		<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
			<td align="center" height="20">
				<input type="radio" name="wlid" value="<%=info.simpleFormat()+"--"+item.getNodeCode()%>" ></td>
			<td align="left">
				<a href="javascript:ev_view('<%=bo.getBOId()%>');"><%=bo.getBOName()%></a></td>
			<td align="center"><%=bo.getDelegate()%></td>
			<td align="center"><%=flowService.getNode(item.getNodeCode()).getNodeName()%></td>
			<td align="center" nowrap="nowrap"><%=sdf.format(item.getGenDate())%></td>
			<td align="center"><%=dtLimitDateMap.get(item.getId())==null?"----":dtLimitDateMap.get(item.getId())%></td>
		</tr>
	<%	} %>
</table>
</body>

</html>
