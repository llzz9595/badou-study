<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ include file="/web/pub/flow.inc" %>
<html><html:base target="_self"/>
<head>
<title>流程选择</title>
</head>
<script language="JavaScript" type="text/javascript">
function submitVo(){
	var tmpels = document.getElementsByName("flowCode");
	for(var i=0;i<tmpels.length;i++){
		if(tmpels[i].checked){
			if (window.confirm("您确认要提交审批吗？")) {
				form1.action = "${ROOT}/createFreePrivateFlow.do1";
				form1.submit();
				return;
			}
		}
	}
	alert("请选择一个流程！！");
	return;
}
</script>

<body  >
<div align="center" class="title">流程选择列表</div>
<form id="form1" name="form1" method="post" action="">
  <table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">    
  	<logic:iterate id="flow" name="list" type="com.shengdai.kpi.flow.valueobject.FlwFlow" indexId="index" >
    <tr>
      <td align="center" width="10%"><input type="radio" name="flowCode" value="<bean:write name="flow" property="flowCode"/>" /></td>
      <td nowrap="nowrap"><bean:write name="flow" property="flowName"/></td>
    </tr>
    </logic:iterate>    
  </table>
  <div align="center">
  	<input type="hidden" name="boClass" value="<%=request.getParameter("boClass")%>"/>
  	<input type="hidden" name="boId" value="<%=request.getParameter("boid")%>"/>
      <input type="button" name="Submit" class="button" value="提交" onclick="submitVo();"/>
      <input type="button" name="Submit2" class="button" value="关闭" onclick="if(confirm('确定关闭')){window.close();}" /></td>
  </div>
</form>
</body>
</html>
