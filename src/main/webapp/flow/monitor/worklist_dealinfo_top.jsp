<%@ page contentType="text/html;charset=utf-8" language="java" import="com.shengdai.kpi.flow.valueobject.*"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>流程批次监控管理</title>
</head>

<script language="javascript">

function ev_add(){
	location.href="${ROOT}/flow/monitor/monitor_form.jsp";
}

function ev_update(){
var ids = listFrame.getAllChecked('checkname');
if(ids==""){
alert("请您选择要修改的一项!!");
return;
}
var idArray = ids.split(",");
if(idArray.length>1){
alert("只能选择一项!!");
return;
}
location.href="${ROOT}/flow/monitor/monitor_edit_form.jsp?id="+idArray[0];
}

function ev_del(){
var ids = listFrame.getAllChecked('checkname');
if(ids=="") {alert("请您选择要删除的记录!");return;}
  if (confirm("您确认要删除记录？")) { 
listFrame.form1.action="${ROOT}/deleteMonitor.do1?ids="+ids;
listFrame.form1.submit();
 }else{
    return;
    }
}

function ev_exit(){
location.href="${ROOT}/flow/monitor/monitor_top.jsp?id=<%=request.getParameter("monitorId")%>&recBatchId=<%=request.getParameter("recBatchId")%>";
}

function ev_save(){
listFrame.saveRecBatchLimit();
}

function transferWorklistItem(){
var ids = listFrame.getAllChecked('checkname');
if(ids==""){
alert("请您选择要转移的项!!");
return;
}
var url = "${ROOT}/listFlowNode.do1?formNodeCode="+listFrame.form1.currentCode.value
	var obj = new Object();
	obj.ids = ids;
	var value = window.showModalDialog(url,obj,"dialogHeight:350px;dialogWidth:400px;status=off");
	if(value=="success"){
	  location.reload();
	}
}
</script>

<body class="command_body">
<table width="100%" height="100%"   cellpadding=0 border=0>
  <tr>
  	<td width="100%" height="5%" valign="top" colspan="2">
    <table cellpadding=0 cellspacing=0 width="100%" border="0" bgcolor="#eceae6" class="toolBar1">
      <tr>
		<td>
		<table id="toolBar" border="0">
	    <tr>
		  <td class="coolButton" align="left" width="3"><img src="${ROOT}/web/flow/img/toolbar.gif"></td>
			<td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出</td>
			<%
			if(WorklistItem.STATUS_UNDO==Integer.parseInt(request.getParameter("status"))){
			%>
			<td class="coolButton" onaction="javascript:transferWorklistItem()" id="exitbtn">转移待办</td>
			<%
			}
			%>                    
		  </tr>
		</table>
		</td>
	   </tr>
	</table>    
    </td></tr>
  <tr>
	 	<td width="100%">
		<IFRAME name=listFrame src="${ROOT}/listFlowNodeDetailForDelegate.do1?monitorId=<%=request.getParameter("monitorId")%>&flwCode=<%=request.getParameter("flwCode")%>&recBatchId=<%=request.getParameter("recBatchId")%>&flwNodeCode=<%=request.getParameter("flwNodeCode")%>&status=<%=request.getParameter("status")%>" width="100%" height="100%"></IFRAME>
 	</td></tr>
</table>

</body>

<SCRIPT language=javascript>
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
  for (var i = 1; i < cells.length; i++){
     createButton(cells[i]);
  }

</SCRIPT>
</html>
