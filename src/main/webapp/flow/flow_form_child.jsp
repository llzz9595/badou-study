<%-- ���� zyf 2008-1-8 --%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String tab = request.getParameter("tab");
	if (tab == null || tab.equals("")) {
		tab = "0";
	}
%>
</head>
<script language="javascript">
//�������༭ҵ�������������
function add_para(){
	var returnValue = window.showModalDialog('${ROOT}/flow/flow_busi_param_add.jsp','','dialogHeight:320px;dialogWidth:500px;status=off')
    if(returnValue=="success"){
    	location.href = "${ROOT}/listFlowPage.do1?tab=3";
    }   
}

function editNodeExt(id){
	var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do1?busiParamId='+id,'','dialogHeight:320px;dialogWidth:500px;status=off')
   	if(returnValue=="success"){
    	location.href = "${ROOT}/listFlowPage.do1?tab=3";  
    }
}

function deleteNodeExt(id){
	if (confirm("��ȷ��Ҫɾ����¼��")) { 
		document.form1.action = "${ROOT}/deleteBusiParam.do1?id="+id;
		document.form1.submit();
	}else{
		return;
	}
}

function upload(id){
	window.showModalDialog('${ROOT}/common/upload/upload.jsp?resourceId='+id,'','dialogHeight:300px;dialogWidth:650px;status=off')
    location.href = "${ROOT}/listFlowPage.do1?tab=1&resourceId="+id;  
}
/*
function checkJs(){
if(document.all.busiType.value==""){
alert("��ѡ��������𣡣�");
return false;
}
return true;
}
*/
</script>
<body bgColor=#f0f0f0 >
  <br/>
  <form id="form1" name="form1" method="post" action="">
    <input type="hidden" name="flgFree" value="0"/><!-- �Ƿ�̻�����0��,1�� -->
	<table cellSpacing=0 cellPadding=0 width=500 align=center border=0>
	  <tr>
		<td>
		<br/>
		  <DIV class=tab-pane id=tabPane1>
			<SCRIPT type=text/javascript>
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
				tp1.selectedIndex =<%=tab%>;
			</SCRIPT>
			<DIV class=tab-page id=tabPage1>
			  <H2 class=tab>��������</H2>
			  <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
			  <!-- ����Ƕ�����̻������� -->
				<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				  <TBODY>
					<TR>
					  <TD align=right width="28%" height=35>
						<font color="red">*</font>�������ƣ�
					  </TD>
					  <TD width="72%" height=25>
						<INPUT type="hidden" name="parentFlowCode" value="<%=request.getParameter("parentFlowCode")%>"/>
						<INPUT class=editline size=40 value="" name="flowName" check="notBlank;isString('#',50)" showName="��������" required="true" maxlength="50"/>
					  </TD>
					</TR>
					<TR>
					  <TD align=right width="28%" height=35>����˵����</TD>
   					  <TD width="72%" height=25>
   					  <textarea cols="50" rows="6" name="memo"></textarea>
					  </TD>
					</TR>
				<%
					if(request.getParameter("parentFlowCode")==null){
				%>
					<TR>
					  <TD align=right width="28%" height=35>�������</TD>
  					  <TD width="72%" height=25>
  					    ${busi.busiName }<input type="hidden" name="busiType" value="${busi.id}"/>
					<%--
						<html:select name="flowForm" property="busiType">
							<html:option value="">--��ѡ��--</html:option>
							<html:optionsCollection name="commBusiList" label="busiName" value="id" />
						</html:select>
					--%>
					  </TD>
					</TR>
				<%
					}
				%>
					<tr>
					  <td colspan="2" align="left">
						<font color="#0099FF">˵�������ǣ�</font><font color="red">*</font><font color="#0099FF">������Ϊ��</font>
					  </td>
					</tr>
	  			  </table>
				</DIV>
			  </DIV>
	     	  <!-- 	����TAB���� -->
			</td>
		  </tr>
		</table>
	  </form>
	</body>
</html>
