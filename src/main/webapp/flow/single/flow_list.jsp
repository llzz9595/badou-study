<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.system.valueobject.User"/>
<jsp:directive.page import="com.shengdai.kpi.ag.valueobject.AssessGroup"/>
<%@ include file="/web/pub/flow.inc"%>
<html>
<%	String aid=request.getParameter("id"); 
	String busiCode = request.getParameter("busiCode");
	request.getSession().setAttribute(AssessGroup.ASSESS_GROUP_SESSION, AssessGroup.ROOT_PUBLIC_ID);
%>
<head>

<title>流程列表</title>
<link rel="stylesheet" type="text/css" href="${ROOT}/css/css.css">

</head>
<script type="text/javascript">

function ev_add(){
	var url = "${ROOT}/flow/flow_view_frame.jsp";
	window.open(url, "_blank", "width=900,height=600,left=60,top=80,resizable=no,status=no,scrollbars=no");
}

function ev_del()
{
	var val=getAllChecked("checkname");
	if(val==""){
		alert("请选择您要删除的流程");
		return;
	}
  	if (confirm("您确认要删除记录？")) 
  	{ 
		flowForm.action="${ROOT}/deleteFlow.do1?busi=<%=busiCode%>&ids="+val;
		flowForm.submit();
 	}
}
function ev_view(id){
	var url = "${ROOT}/flow/flow_view_frame.jsp?flowCode="+id;
	window.open(url, "_blank", "width=900,height=600,left=60,top=80,resizable=no,status=no,scrollbars=no");
}

function ev_monitor(id){
	var url = "${ROOT}/listBusiRecFlow.do1?id="+id;
	window.open(url, "_blank", "width=800,height=600,left=110,top=80,resizable=no,status=no,scrollbars=1");
}

</script>

<body topmargin="0" leftmargin="0">
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   	<tr> 
     	<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     	<td id=search width="500"> 
	 	<input type="button" class="button" value="新增" onclick="javascript:ev_add();">
	 	<input type="button" value="删除" class=button onclick="ev_del()" >
	 	<page:clone name="flow"/>
     </td>     
     </tr></table></td></tr>     
</table>
<div align="center" class="title">流程浏览</div>
<form name=flowForm action="/listFlowByBusi.do1" method="post">
<input type="hidden" name="assessGroupId" value="<%=aid%>"/>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
	<tr>
		<td class="title-header" align="center" width="5%" nowrap height="22">
			<span class="style32"> 选择<input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'checkname');"> </span>
		</td>
		<page:tabTitle title="名称" column="f.flowName" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="15%" align="center" />
		<page:tabTitle title="类别" column="f.priority" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="15%" align="center" />
		<page:tabTitle title="操作" column="f.priority" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="10%" align="center" />
	</tr>
	<logic:iterate id="flwFlow" name="flowList" indexId="index">
		<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
			<%FlwFlow ffl=(FlwFlow)flwFlow;
			 %>
			<td align="center" height="20">
			<input type="checkbox" name="checkname" value="<bean:write name="flwFlow" property="flowCode"/>" id="<%=ffl.getAssessGroup()==null?"000000":ffl.getAssessGroup().getId() %>">
			</td>
			<td align="left">
				<a href="javascript:ev_view('<bean:write name="flwFlow" property="flowCode"/>');"><bean:write name="flwFlow" property="flowName" /></a>
			</td>
			<td align="center">
			<logic:notEmpty name="flwFlow" property="commBusi">
					<bean:write name="flwFlow" property="commBusi.busiName" />
				</logic:notEmpty>
				<logic:empty name="flwFlow" property="commBusi">
				&nbsp;
				</logic:empty>
			</td>
			<td align="center" nowrap="nowrap">
			<a href="#" onClick="ev_monitor('<bean:write name="flwFlow" property="id"/>');" title="查看已发起的流程">监控</a> 
			</td>
		</tr>
	</logic:iterate>
</table>
</body>

</html>
