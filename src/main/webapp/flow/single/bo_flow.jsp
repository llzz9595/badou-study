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

function transfer(toNode){
	if(confirm("确定转移待办吗？")){		
		form1.action="${ROOT}/transferWorklistItem.do1?toTranNodeCode="+toNode;
		form1.submit();
	}
}

function viewFreeNode(nodeCode){
	var url = "${ROOT}/freeeNodeEditPage.do1?nodeCode="+nodeCode;
	var value=window.open(url,'',"width=700,height=480;status=off");
}
</script>

<body  >
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   <tr> 
     <td class=coolButton align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     <td class=coolbutton id=search onaction="" width="60" >${script }</td>         
	 <td align="right"><input type="button" class="button" value="关闭" onclick="window.close();">
     </td></tr></table></td></tr></table>
     
<div align="center" class="title">业务对象流程</div>
<form id="form1" name="form1" method="post" action="">
<input type="hidden" name="flgBatch" value="0">
<input type="hidden" name="tranBoIds" value="<%=flow.getBoId()%>">
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
    <tr>      
      <td class="title-header" align="center" width="15%">环节</td>
      <td class="title-header" align="center" width="10%">处理方式</td>
      <td class="title-header" align="center" width="36%">处理人</td>
      <td class="title-header" align="center" width="12%">到达时间</td>
      <td class="title-header" align="center" width="12%">处理时间</td>
      <td class="title-header" align="center" width="15%">操作</td>
    </tr>
<% 	List nodeList = new ArrayList(flow.getNodeSet());
	String fromNode = "";
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
				String handleStatus = "未提交";		
				if(j>1){	
					out.println("<tr>");
				}
				if(item.getStatus()==WorklistItem.STATUS_UNREAD || 
						item.getStatus()==WorklistItem.STATUS_HASREAD){
					handleStatus = "未阅";	
					out.println("<td align='left' >["+item.getHandlerName()+"]的传阅信息</td>");
				} else {
					out.println("<td align='left' >["+item.getHandlerName()+"]："+
						(StringUtils.isEmpty(item.getOpinion())?"（未填意见）":item.getOpinion())+"</td>");
				}
				out.println("<td align='center' >"+sdf.format(item.getGenDate())+"</td>");	
				if(item.getStatus()==WorklistItem.STATUS_DONE || 
						item.getStatus()==WorklistItem.STATUS_OVERTIME_DONE ||
						item.getStatus()==WorklistItem.STATUS_HASREAD){
					out.println("<td align='center' >"+sdf.format(item.getCompDate())+"</td>");
				} else {
					out.println("<td align='center' ><font color=red >("+handleStatus+")</font></td>");					
					if(StringUtils.isEmpty(fromNode)){
						fromNode = node.getNodeCode();
						out.println("<input type='hidden' name='formNodeCode' value='"+node.getNodeCode()+"'>");
					}
				}
				
				//多人处理的情况，只显示一个环节处理
				if(j==0){
					out.println("<td align='center' rowspan='"+rowspan+"'>");			
					if(fromNode.equals(node.getNodeCode())){//没必要转移至当前环节
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					} else {
						out.println("<a href=\"javascript:transfer('"+node.getNodeCode()+"')\" >转移至此</a>&nbsp;");
					}
					if(recNode!=null){//已过的环节不能修改
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					} else {
						out.println("<a href=\"javascript:viewFreeNode('"+node.getNodeCode()+"')\" >修改</a>&nbsp;");
					}		
					out.println("</td></tr>");				
				} else {
					out.println("</tr>");	
				}
			}
		} else {
			System.out.println("node:"+node);
			out.println("<td align='left' >"+(node.getNodeProcessor()==null? 
					"<font color=red >(未设定)</font>":node.getNodeProcessor().handlerText())+"</td>");
			out.println("<td align='center' ><font color=red >(未到达)</font></td>");
			out.println("<td align='center' ><font color=red >----</font></td>");
			
			out.println("<td align='center' rowspan='"+rowspan+"'>");			
			if(fromNode.equals(node.getNodeCode())){//没必要转移至当前环节
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			} else {
				out.println("<a href=\"javascript:transfer('"+node.getNodeCode()+"')\" >转移至此</a>&nbsp;");
			}
			if(recNode!=null){//已过的环节不能修改
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			} else {
				out.println("<a href=\"javascript:viewFreeNode('"+node.getNodeCode()+"')\" >修改</a>&nbsp;");
			}		
			out.println("</td></tr>");
		}
		
	} %>		
  </table>
</form>
</body>
</html>
