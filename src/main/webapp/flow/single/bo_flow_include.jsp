<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecFlow"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwNode"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecNode"/>
<jsp:directive.page import="java.util.Iterator"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="com.shengdai.kpi.system.common.StringUtils"/>
<%@ include file="/web/pub/flow.inc" %>
<%	FlwFlow flow = (FlwFlow)request.getAttribute("flow");
	RecFlow recFlow = (RecFlow)request.getAttribute("recFlow");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
 %>
<html><html:base target="_self"/>
<head>
<title>业务对象流程</title>
</head>
<script language="JavaScript" type="text/javascript">
window.onload=function (){
	for(var i=1;i<=8;i++){
		parent.document.getElementById("td"+i).background="${ROOT}/web/flow/img/doc/doc_unselect.jpg";
	}
	parent.document.getElementById("td7").background="${ROOT}/web/flow/img/doc/doc_select.jpg";
	parent.document.getElementById("buttons").innerHTML = "";  
	parent.statusBtn();

	if(parent.onlyReadVersion=='true'){
		disableButton("parent");
		disableButton("this");
	}
}


</script>

<body  >
<form id="form1" name="form1" method="post" action="">
<%	if(flow==null){ out.print("流程尚未启动");
	} else {
%>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
    <tr>
      <td class="title-header" align="center" width="25%">环节</td>
      <td class="title-header" align="center" width="15%">处理方式</td>
      <td class="title-header" align="center" width="45%">处理人</td>
      <td class="title-header" align="center">到达时间</td>
    </tr>
<% 	List nodeList = new ArrayList(flow.getNodeSet());
	for(int i=0; i<nodeList.size(); i++){
		FlwNode node = (FlwNode)nodeList.get(i);
		if(node.getFlgRoot()==1)	continue;//结束节点则忽略不显示
		RecNode recNode = recFlow.containNode(node.getNodeCode());
		int rowspan = recNode!=null?recNode.getWorklistItemSet().size():1;		
 %>
    <tr>
      <td align="center" rowspan="<%=rowspan%>"><%=node.getNodeName()%></td>
      <td align="center" rowspan="<%=rowspan%>"><%=node.getHandleTypeway().getHandleTypeName()%></td>
 <%
 		if(recNode!=null){		
 			int j=0;
			for(Iterator iter=recNode.getWorklistItemSet().iterator(); iter.hasNext(); j++){
				WorklistItem item = (WorklistItem)iter.next();
				if(j>1){	
					out.println("<tr>");
				}
				out.println("<td align='left' >["+item.getHandlerName()+"]："+
					(StringUtils.isEmpty(item.getOpinion())?"（未填意见）":item.getOpinion())+"</td>");
				out.println("<td align='center' >"+sdf.format(item.getGenDate())+"</td></tr>");			
			}
		} else {
			out.println("<td align='left' >"+(node.getNodeProcessor()==null? 
					"<font color=red >(未设定)</font>":node.getNodeProcessor().handlerText())+"</td>");
			out.println("<td align='center' ><font color=red >(未处理)</font></td></tr>");
		}
	} %>    
  </table>
<%} %>
</form>
</body>
</html>
