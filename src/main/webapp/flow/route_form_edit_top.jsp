<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
</head>
<body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          	<button name="btnSave" onclick="buttonEve('saveroute')">保存</button>
          	<button name="btnDelete" onclick="buttonEve('delroute')">删除</button>
          	</div></td>
          </tr>
  		</table>
<script>


function buttonEve(partment)
{
 if(partment=='save')
 {
    parent.buttomFrame.Entrys.submit_me();
 }
if (partment =='savenode')
{
    parent.buttomFrame.Entrys.buttonEve("save");
}
if (partment =='saveroute')
{
	parent.buttomFrame.Entrys.ev_save();
}
if (partment =='delnode')
{
    parent.buttomFrame.Entrys.buttonEve("del");
}
if (partment =='delroute')
{
    if (confirm("您确认要删除记录？")) {
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/deleteRoute.do1?routeCode=<%=request.getParameter("routeCode")%>&flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=request.getParameter("nodeCode") %>";
    parent.buttomFrame.Entrys.form1.submit();
    }else{
    return;
    }
}
if (partment == 'newnode')
{ 
     flowCode = document.temp.flowCode.value;  
  	 var mapFormArray = parent.buttomFrame.Entrys.FlwAF_Flow;
	 var mapForm
	 if (mapFormArray != null){
    	mapForm = mapFormArray[0]
	 }
     even = mapForm.all("even");
    if (  flowCode != "" && flowCode != "null" && even!="new") {
      parent.buttomFrame.Entrys.location.href="/initNode.do1?flowCode="+flowCode;
      parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode="+flowCode+"&flwType=NODE";
   }
   else{
   		alert("请先添加流程信息！");
   }
}

if (partment == 'newroute')
{
    var nodeCode = document.temp.nodeCode.value;
    if (nodeCode =="")
        nodeCode = parent.buttomFrame.Entrys.form1.nodeCode.value;
   if (  nodeCode != "" && nodeCode != "null") {
    parent.buttomFrame.Entrys.location.href="/initRoute.do1?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode;
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode+"&flwType=ROUTE";
   }
}

 if(partment=='exit')
 {
   parent.window.location.href="/FlowUI/Flw/FlowUI_Flw_List.jsp?typeCode=LCDY"+urlPara;
 }

if(partment=='exitflow')
 {
    parent.buttomFrame.Entrys.location.href="/showFlow.do1?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F";
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&flwType=FLOW";
 }
}
</script>
</body>
</html>
