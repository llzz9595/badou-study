<%@ page contentType="text/html; charset=UTF-8" language="java" import="com.shengdai.kpi.system.*,com.shengdai.kpi.flow.valueobject.*,com.shengdai.kpi.flow.service.*" pageEncoding="GBK"%>
<jsp:directive.page import="java.util.*"/>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>
Flw_MainTop
</title>
<script src="${ROOT}/web/flow/js/menu4.js" type=text/javascript></script>
<script src="${ROOT}/web/flow/js/poslib.js" type=text/javascript></script>
<script src="${ROOT}/web/flow/js/scrollbutton.js" type=text/javascript></script>
</head>
<script language="javascript">
Menu.prototype.cssFile = "${ROOT}/web/flow/css/officexp/officexp.css";
var definedMenu = new Menu();	
<%	
	IFlowService flowService = (IFlowService)SpringHelper.getBean("flowService");%>
<%--	List definedFlwNodeList = flowService.listDefinedFlowNode(request.getParameter("flowCode"));
for(int i=0;i<definedFlwNodeList.size();i++){
FlwNode flwNode = (FlwNode)definedFlwNodeList.get(i);
%>
definedMenu.add( menu1 = new MenuItem( "<%=flwNode.getNodeName()%>", function () { copyDefinedFlowNode('<%=flwNode.getNodeCode()%>');}, 
	"${ROOT}/web/flow/img/options.small.png" ) );
<%
}
--%>
definedMenu.add(new MenuSeparator());	
function viewDefinedFlowNode(){
showContextMenuForDeinedFlow();
}

function copyDefinedFlowNode(nodeCode){
if(confirm("您确认要从预定义环节中更新环节？")){
form1.action = "${ROOT}/updateDefinedFlowNode.do1?toNodeCode=<%=request.getParameter("nodeCode")%>&autoRoute=autoRoute&fromNodeCode="+nodeCode;
form1.submit();
}
}

function showContextMenuForDeinedFlow()
{
  var el = window.event.srcElement;
  var left = window.event.screenX;
  var top = window.event.screenY;
  definedMenu.invalidate();
  definedMenu.show(left,top);

}

</script>
<%
FlwNode flwNode = flowService.getNode(request.getParameter("nodeCode"));
//if(flwNode.getFlgModify()==0&&flwNode.getFlow().getParentFlow()!=null){
//	out.println("<script>window.onload=function (){disableButton('this');}</script>");
//}
%>
<body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
    <tr>
      <td class="define-titlebg">
      <div class="dialog-title">
      <button name="btnSave" onclick="buttonEve('savenode')">保存</button>
        <%if(flwNode.getFlgRoot()==0){%>
         <button name="btnSave" onclick="buttonEve('delnode')">删除</button>
          <button name="btnSave" onclick="buttonEve('newroute')">新增路由</button>
        <%} %>
      </div></td>
    </tr>
  </table>
<script>
  
  function initNodeCode(nodeCode){
  document.all.nodeCode.value = nodeCode;
  }

function buttonEve(partment)
{
if (partment =='savenode')
{
<%
if(flwNode.getFlgRoot()==0){
%>
if(CheckForm(parent.buttomFrame.Entrys.form2)&&parent.buttomFrame.Entrys.checkJs()){
    parent.buttomFrame.Entrys.updateFlwNode();
    return;
    }
    <%
    }else{
    %>
    parent.buttomFrame.Entrys.updateFlwNodeForRoot();
    return;
    <%
    }
    %>
}

if (partment =='delnode')
{
if (confirm("删除环节将会删除指向它的路由？")) {
    parent.buttomFrame.Entrys.form2.action = "${ROOT}/deleteNode.do1?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=request.getParameter("nodeCode") %>";
    parent.buttomFrame.Entrys.form2.submit();
    }else{
    return;
    }
    
}

if (partment == 'newnode'){ 
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
parent.topFrame.location.href = "${ROOT}/flow/route_form.jsp?flowCode=<%=request.getParameter("flowCode")%>&nodeCode=<%=request.getParameter("nodeCode")%>";
parent.buttomFrame.Entrys.location.href = "${ROOT}/routeAddPage.do1?flowCode=<%=request.getParameter("flowCode")%>";
}
}
</script>
<SCRIPT language=javascript>

</SCRIPT>
</body>
</html>
