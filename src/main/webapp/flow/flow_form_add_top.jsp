<%-- ���� zyf 2008-1-8 --%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����</title>
</head>
<script language="javascript">
function flow_save(){
	if(CheckForm(parent.buttomFrame.Entrys.form1)){
		parent.buttomFrame.Entrys.form1.action="${ROOT}/addFlow.do1?orgId=${param.orgId}&busiId=${param.busiId}";
		parent.buttomFrame.Entrys.form1.submit();
	}
}
</script>
	<body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<button name="btnSave" onclick="flow_save()">����</button>
          	</div></td>
          </tr>
  		</table>
	</body>
</html>
