<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>流程</title>
</head>
<script language="javascript">
function flow_save(){
	parent.buttomFrame.Entrys.flowSave();
}

function enableButtons(){
	enableButton("this");
}

function node_add(){
	parent.topFrame.location.href = "${ROOT}/flow/node_form_add_top.jsp?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
	parent.buttomFrame.Entrys.location.href = "${ROOT}/nodeAddPage.do1?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}

function node_order(){
	parent.topFrame.location.href = "${ROOT}/flow/node_order_form.jsp?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
	parent.buttomFrame.Entrys.location.href = "${ROOT}/listNode.do1?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}

function view_monitor(){
	parent.location.href = "${ROOT}/flow/monitor/monitor_edit_form.jsp?isFlowIn=isFlowIn&flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}
</script>
	<body>
	<form name="curForm1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<button name="btnSave" onclick="flow_save()">保存</button>
          		<button name="node_add()" onclick="node_add()">新增环节</button>
          		<button name="node_order()" onclick="node_order()">环节排序</button>

          	</div></td>
          </tr>
    </table>
    </form>
	</body>
</html>
