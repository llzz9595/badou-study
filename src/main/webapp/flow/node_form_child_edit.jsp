<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<%
	String nodeCode = request.getParameter("nodeCode");
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>���ڶ���</title>
		<%request.setAttribute("flowNodeExtList2", request
					.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			%>
	</head>
<script language="javascript">

//�������༭ҵ�������������
function add_para(id){
	var returnValue = window.showModalDialog('${ROOT}/flow/flow_busi_param_add.jsp?id='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
     if(returnValue=="success"){
    location.href = "${ROOT}/nodeEditPage.do1?nodeCode=<%=nodeCode%>&tab=3"+urlPara;   
    }
}

function editNodeExt(id){
var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do1?busiParamId='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
    location.href = "${ROOT}/nodeEditPage.do1?nodeCode=<%=nodeCode%>&tab=3"+urlPara;  
   }
}

function deleteNodeExt(id){
if (confirm("��ȷ��Ҫɾ����¼��")) { 
document.form2.action = "${ROOT}/deleteBusiParam.do1?nodeCode=<%=nodeCode%>&type=nodeEdit&id="+id;
document.form2.submit();
}else{
return;
}
}

function checkJs(){
return true;
}

function addRow1(){
  var tbl = document.getElementById("remineTbl");
  var arow = tbl.insertRow();
   var td = arow.insertCell(0);
  td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
  td = arow.insertCell(1);
  td.innerHTML="<br/><input type=\"hidden\" name=\"type\" value=\"1\"/>"+
	"<input type=\"hidden\" name=\"frequencyRelativeCycle\" value=\"1\"/>"+
	"<input type=\"hidden\" name=\"frequencyCycle\" value=\"1\"/>"+
	"<input type=\"hidden\" name=\"frequencyMonth\" value=\"1\"/>"+
	"<input type=\"hidden\" name=\"frequencyDay\" value=\"1\"/>"+
	"<input type=\"hidden\" name=\"frequencyHour\" value=\"0\"/>"+
    "<input type=\"hidden\" name=\"remineId\" value=\"\"/>ϵͳ���ڴ����������" +
	"<select name=\"way\">" +
		"<option value=\"1\" >�ʼ�</option>" +
		"<option value=\"0\" >����</option>" +
	"</select>��ʽ����" +
	"<select name='reminder'>" +
	"<option value='1'>������</option>" +
	"<option value='0'>������</option>" +
	"</select>" +
	"<input type='text' name=\"firstTimes\" check=\"isInt();\" required='nullable' class=editline size=2 value='1' >��," +
	"���ڴ�ʱ��֮��Ĵ�����δ�ύ" +
	"<input type='text' name=\"limitFrequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
	"<select name='limitFrequencyUnit'>	" +
	"	<option value=\"2\">��</option>" +
	"	<option value=\"1\">Сʱ</option>" +
	"</select>�󣬼����Դ˷�ʽÿ��" +
	"<input type='text' name=\"frequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
	"<select name='frequencyUnit'>	" +
	"	<option value=\"2\">��</option>" +
	"	<option value=\"1\">Сʱ</option>" +
	"</select>����һ�Σ���������Ϊ:<br/>" +
	"<INPUT type='text' name='remineContent' check=\"isString('#',100);\" required='nullable' class=editline size=80 value='' >��";
  td = arow.insertCell(2);
  td.innerHTML="<input type='button' name='delRemine' onclick=\"deleteCurrentRow(this,'${o.id}');return false;\" value='ɾ��' title=\"ɾ������������\" class=\"button\">";
}

function addRow2(){
	  var tbl = document.getElementById("remineTbl");
	  var arow = tbl.insertRow();
	  var td = arow.insertCell(0);
	  td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
	  td = arow.insertCell(1);
	  td.innerHTML="<br/><input type=\"hidden\" name=\"type\" value=\"2\"/>"+
		 " <input type=\"hidden\" name=\"remineId\" value=\"\"/>ϵͳ���ڴ��쵽����" +
	    "<select name='frequencyRelativeCycle'>	" +
		"	<option value=\"1\">��</option>" +
		"	<option value=\"2\">��</option>" +
		"</select>" +
		"<select name='frequencyCycle' onchange='ev_changeUnit(this);'>	" +
		"	<option value=\"1\">��</option>" +
		"	<option value=\"2\">��</option>" +
		"	<option value=\"4\">��</option>" +
		"</select>" +
		"<span style='display:none;'>��<input type='text' name=\"frequencyMonth\" showName='��' check=\"isInt('+');setNumber(1,12);\" required='nullable' class=editline size=2 value='1' >��</span>" +
		"<input type='text' name=\"frequencyDay\" check=\"isInt('+');setNumber(1,31);\" required='nullable' showName='��' class=editline size=2 value='1' >��" +
		"<input type='text' name=\"frequencyHour\" check=\"isInt();setNumber(0,59);\" showName='ʱ' required='nullable' class=editline size=2 value='0' >ʱ" +
		"��<select name=\"way\">" +
			"<option value=\"1\" >�ʼ�</option>" +
			"<option value=\"0\" >����</option>" +
		"</select>��ʽ����" +
		"<select name='reminder'>" +
		"<option value='1'>������</option>" +
		"<option value='0'>������</option>" +
		"</select>" +
		"<input type='text' name=\"firstTimes\" check=\"isInt();\" required='nullable' class=editline size=2 value='1' >��," +
		"���ڴ�����δ�ύ" +
		"<input type='text' name=\"limitFrequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
		"<select name='limitFrequencyUnit'>	" +
		"	<option value=\"2\">��</option>" +
		"	<option value=\"1\">Сʱ</option>" +
		"</select>�󣬼����Դ˷�ʽÿ��" +
		"<input type='text' name=\"frequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
		"<select name='frequencyUnit'>	" +
		"	<option value=\"2\">��</option>" +
		"	<option value=\"1\">Сʱ</option>" +
		"</select>����һ�Σ���������Ϊ:<br/>" +
		"<INPUT type='text' name='remineContent' check=\"isString('#',100);\" required='nullable' class=editline size=80 value='' >��";
	  td = arow.insertCell(2);
	  td.innerHTML="<input type='button' name='delRemine' onclick=\"deleteCurrentRow(this,'${o.id}');return false;\" value='ɾ��' title=\"ɾ������������\" class=\"button\">";
}

function deleteCurrentRow(obj,id){
	if(id!=""&&id!=undefined){
		if(confirm("��ȷ��Ҫɾ����¼��")){
			var nodeMinedeleteurl = "${ROOT}/deleteNodeMine.do1?id="+id+"&nodeCode=<%=nodeCode%>&tab=1&noCache="+Math.random()+urlPara;
			LoadAjaxContent(nodeMinedeleteurl,function(){
					var result = this.request.responseText;
					if(result=="ok"){
						
					}
				});
		}else{
			return;
		}
	}
	var tbl = document.getElementById("remineTbl");
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--ɾ����ǰ��--%>
}


function updateFlwNode(){
	if(CheckForm(form2)){
		form2.action = "${ROOT}/editNode.do1?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>"+urlPara;
		form2.submit();
	}
}

function updateFlwNodeForRoot(){
form2.action = "${ROOT}/editNodeForRoot.do1?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>"+urlPara;
form2.submit();
}

<%-------------------------------- ���´��뿪ʼ����ͬ����ʽҳ��ķ�Ӧ ------------------------------------------%>
var ways = new Array();
function way(id, tip, flgNeedHandler){
	this.id = id;
	this.tip = tip;
	this.flgNeedHandler = flgNeedHandler;	
}

<logic:iterate id="way" name="handleTypewayList" indexId="index" >
	var way<%=index%> = new way();
	way<%=index%>.id='<bean:write name="way" property="id" />';
	way<%=index%>.tip='<bean:write name="way" property="pageRemark" />';
	way<%=index%>.flgNeedHandler='<bean:write name="way" property="flgNeedHandler" />';
	ways[<%=index%>]=way<%=index%>;
</logic:iterate>
function changetState(flag){
	var value = document.all.handleWay.value;
	if(value==""){
		document.all.methodAlert.innerText="��ѡ����ʽ;";
		document.all.nodeHandlerTr.style.display = "none";
	}else{
		for(var i=0; i<ways.length; i++){
			var way = ways[i];
			if(way.id==value){
				document.all.methodAlert.innerText=way.tip;
				if(way.flgNeedHandler=='1')
					document.all.nodeHandlerTr.style.display = "";
				else
					document.all.nodeHandlerTr.style.display = "none";
			}
		}
	} 	
	
	if(flag==1){
	    document.all.viewName.value = "";
	    document.all.viewId.value = "";
    }
}

<%-------------------------------------- <<<<<<<<<<<<<<<<   >>>>>>>>>>>>>>>>> -------------------------------------%>

function selectView(){
var handleWay = document.all.handleWay.value;
if(handleWay.length==0){
	alert("��ѡ����ʽ!");
	return ;
}
var url = "${ROOT}/selectDefaultViewPage.do1?nodeCode=${flwNode.nodeCode}&handleWay="+handleWay+urlPara;
var temps = document.all.viewId.value;
var obj = new Object();
obj.defaultView = temps;
var returnValue = window.showModalDialog(url,obj,"dialogHeight:450px;dialogWidth:700px;status=no");
    if(returnValue!=""&&returnValue!=undefined){
    var returnTemps = returnValue.split(":");
    //alert(returnValue);
   document.all.viewName.value = returnTemps[0];
   document.all.viewId.value = returnTemps[1];
   }
}

function addVariable(){
	form2.msgTitle.value=form2.msgTitle.value+form2.variable.value;
}

function ev_handler(){
	var url="${ROOT}/flow/select_handler.jsp";
	window.showModalDialog(url,'',"dialogHeight:550px;dialogWidth:750px;status=no");
}
function changetSpreadPersonStatus(flgSpread){
if(flgSpread==1){
document.all.spreadPerson.style.display="";
}
if(flgSpread==0){
document.all.spreadPerson.style.display="none";
}
}

function ev_changeUnit(dom){
	var value = dom.value;
	var nextDom = dom.nextSibling;
	if(nextDom) {
		if(value == 2 || value == 4) nextDom.style.display = '';
		else nextDom.style.display = 'none';
	}
}
</script>
	<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3 >
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
		<br>
		<form id="form2" name="form2" method="post" action="">
		<% FlwNode node = (FlwNode)request.getAttribute("flwNode");%>
			<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
				<tr>
					<td>
						<br>
						<DIV class=tab-pane id=tabPane1>
							<SCRIPT type=text/javascript>
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	tp1.selectedIndex =<%=tab%>;
	</SCRIPT>



							<DIV class=tab-page id=tabPage1>
								<H2 class=tab>
									��������
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<!-- ����Ƕ�����̻������� -->
								<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<input name="flowCode" type="hidden" value="" />
									<input name="nodeCode" type="hidden" value="<bean:write name="flwNode" property="nodeCode"/>" />
									<TBODY>
									
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												�������ƣ�
											</TD>
											<TD width="72%" height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="nodeName"/>" name="nodeName" check="notBlank" showName="��������" required="true" maxlength="50"/>
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												����˵����
											</TD>
											<TD height=25>
											<textarea cols="50" rows="6" name="memo">${flwNode.memo}</textarea>
											</TD>
										</TR>
										<logic:equal name="flwNode" property="flgRoot" value="0">
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												��ʾ˳��
											</TD>
											<TD height=25>
												<bean:write name="flwNode" property="priority" />
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red" >*</font>
											</td>
											<TD align=left height=35>
												����ʽ��
											</TD>
											<TD height=25 nowrap="nowrap">
											<html:select name="nodeForm" property="handleWay" onchange="changetState(1)">
											<option value="">--��ѡ����ʽ--</option>
											<html:optionsCollection name="handleTypewayList" value="id" label="selectLable"/>
											</html:select>
											<br/>
											<font color="red" id="methodAlert"></font>
											</TD>
										</TR>
										<TR id="nodeHandlerTr">
											<td align="right">
												
											</td>
											<TD align=left height=35>
												���ڴ����ˣ�
											</TD>
											<TD height=25>
											<input type="hidden" name="nodeHandler" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getId() %>"/>
											<INPUT type="hidden" name="nodeProcessorValue" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getValue() %>"/>
											<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getText() %>" name="nodeProecessorText" readonly="readonly">
											<input type='button' id='b1' value='ѡ��' class="button"
											  onclick="javascript:getAddressList('40;20;100','n','3;1;','nodeProcessorText','nodeProcessorValue');" >
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												������ʾ��ʽ��
											</TD>
											<TD height=25>
											
											  <INPUT class=editline size=30 value="${flwNode.viewName }" name="viewName" check="notBlank" showName="������ʾ��ʽ" required="true" readonly="readonly">
											  <INPUT type="hidden" name="viewId" value="${flwNode.viewId }">
											  <INPUT type="button" name="selectTemp" value="ѡ��" onclick="javascript:selectView()" class="button">
											  <br><html:checkbox name="flwNode" property="flgFullScreen" value="1">ȫ���򿪴���</html:checkbox> 
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												�����ύ��ʽ��
											</TD>
											<TD height=25>
												<html:radio name="flwNode" property="flgSubmitSync" value="1">ͬ���ύ</html:radio>
												<html:radio name="flwNode" property="flgSubmitSync" value="0">�첽�ύ</html:radio>
											</TD>
										</TR>
										<TR  id="spreadMethod">
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												�Ƿ���
											</TD>
											<TD height=25>
												<html:radio name="flwNode" property="flgSpread" value="1"  onclick="changetSpreadPersonStatus(1)"/>
												��&nbsp;
												<html:radio name="flwNode" property="flgSpread" value="0"  onclick="changetSpreadPersonStatus(0)"/>
												��
											</TD>
										</TR>
										<TR  id="spreadPerson" <logic:equal name="flwNode" property="flgSpread" value="0" >style="display:none"</logic:equal> >
											<td align="right">												
											</td>
											<TD align=left height=35>
												������
											</TD>
											<TD align=left height=35 colspan="2">
											<input type="hidden" name="spreadHandler" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getId() %>"/>
											<INPUT type="hidden" name="spreadProcessorValue" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getValue() %>"/>
											<INPUT id="spreadProcessorText" class=editline size=35 value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getText()%>" name="spreadProecessorText" readonly="readonly">
											<input type='button' id='b1' value='ѡ��' class="button"
											  onclick="javascript:getAddressList('10;20','n','1','spreadProcessorText','spreadProcessorValue');" >
											</TD>
										</TR>
										</logic:equal>										
										<tr>
											<td colspan="3" align="left">
												<font color="#0099FF">˵�������ǣ�</font><font color="red">*</font><font color="#0099FF">������Ϊ��</font>
											</td>
										</tr>
								</table>
							</DIV>
							<logic:equal name="flwNode" property="flgRoot" value="0">
							<DIV class=tab-page id=tabPage2>
								<H2 class=tab>
									��չ����
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
								<!-- ����Ƕ�����̸��� -->
								<table id="tbl" class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
								<tr>
									<td>
										<FIELDSET align=center style="width:96%;">
	       							<LEGEND>��������</LEGEND>
	       							<input type='button' name='addRemine' onclick="addRow1();return false;" value='�������Դ߰�' class="button">
	       							<input type='button' name='addRemine' onclick="addRow2();return false;" value='������ʱ�߰�' class="button">
	       							<table id="remineTbl" cellSpacing=1 cellPadding=5 width="100%" border=0>
	       							<c:forEach var="o" items="${nodeMineList}" varStatus="idx">
	       							<c:if test="${o.type==1}">
									<tr>
									<td>
									<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>
									</td>
									<td>
									<input type="hidden" name="type" value="${o.type}"/>
									<input type="hidden" name="remineId" value="${o.id}"/>
									<input type="hidden" name="frequencyRelativeCycle" value="1"/>
									<input type="hidden" name="frequencyCycle" value="1"/>
									<input type="hidden" name="frequencyMonth" value="1"/>
									<input type="hidden" name="frequencyDay" value="1"/>
									<input type="hidden" name="frequencyHour" value="0"/>
									ϵͳ���ڴ����������
									<select name="way">
										<option value="1" ${o.way==1?'selected':'' }>�ʼ�</option>
										<option value="0" ${o.way==0?'selected':'' }>����</option>
									</select>��ʽ����
									<select name='reminder'>
									<option value='1' ${o.reminder==1?'selected':'' }>������</option>
									<option value='0' ${o.reminder==0?'selected':'' }>������</option>
									</select>
									<input type='text' name="firstTimes" check="isInt();" required='nullable' class=editline size=2 value='${o.firstTimes}' >��,
									���ڴ�����δ�ύ
									<input type='text' name="limitFrequency" check="isInt();" required='nullable' class=editline size=2 value='${o.limitFrequency}' >
									<select name='limitFrequencyUnit'>
										<option value="2" ${o.limitFrequencyUnit==2?'selected':'' }>��</option>	
										<option value="1" ${o.limitFrequencyUnit==1?'selected':'' }>Сʱ</option>
									</select>�󣬼����Դ˷�ʽÿ��
									<input type='text' name="frequency" check="isInt();" required='nullable' class=editline size=2 value='${o.frequency}' >
									<select name='frequencyUnit'>
										<option value="2" ${o.frequencyUnit==2?'selected':'' }>��</option>	
										<option value="1" ${o.frequencyUnit==1?'selected':'' }>Сʱ</option>
									</select>����һ�Σ���������Ϊ:<br/>
									<INPUT type='text' name='remineContent' check="isString('#',100);" required='nullable' class=editline size=80 value='${o.remineContent}' >��
									</td>
									<td>
									<input type='button' name='delRemine' onclick="deleteCurrentRow(this,'${o.id}');return false;" value='ɾ��' title="ɾ������������" class="button">
									</td>
									</tr>
									</c:if>
									<c:if test="${o.type==2}">
										 <td><a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>
										 </td>
									<td>
										  <br/><input type="hidden" name="type" value="2"/>
										<input type="hidden" name="remineId" value="${o.id}"/>ϵͳ���ڴ��쵽����
										    <select name='frequencyRelativeCycle'>	
												<option value="1" ${o.frequencyRelativeCycle==1?'selected':'' }>��</option>
												<option value="2" ${o.frequencyRelativeCycle==2?'selected':'' }>��</option>
											</select>
											<select name='frequencyCycle' onchange="ev_changeUnit(this);">
												<option value="1" ${o.frequencyCycle==1?'selected':'' }>��</option>
												<option value="2" ${o.frequencyCycle==2?'selected':'' }>��</option>
												<option value="4" ${o.frequencyCycle==4?'selected':'' }>��</option>
											</select><span style='display:none;'>��<input type='text' name="frequencyMonth" showName='��' check="isInt('+');setNumber(1,12);" required='nullable' class=editline size=2 value='${o.frequencyMonth}' >��</span>
											<input type='text' name="frequencyDay" check="isInt('+');setNumber(1,31);" required='nullable' showName='��' class=editline size=2 value='${o.frequencyDay}' >��
											<input type='text' name="frequencyHour" check="isInt();setNumber(0,59);" showName='ʱ' required='nullable' class=editline size=2 value='${o.frequencyHour}' >ʱ
											��<select name="way">
												<option value="1" ${o.way==1?'selected':'' }>�ʼ�</option>
												<option value="0" ${o.way==0?'selected':'' }>����</option>
											</select>��ʽ����
											<select name='reminder'> 
											<option value='1' ${o.reminder==1?'selected':'' }>������</option> 
											<option value='0' ${o.reminder==0?'selected':'' }>������</option> 
											</select> 
											<input type='text' name="firstTimes" check="isInt();" required='nullable' class=editline size=2 value='${o.firstTimes}' >��,
											���ڴ�ʱ��֮��Ĵ�����δ�ύ
											<input type='text' name="limitFrequency" check="isInt();" required='nullable' class=editline size=2 value='${o.limitFrequency}' >
											<select name='limitFrequencyUnit'>
												<option value="2" ${o.limitFrequencyUnit==2?'selected':'' }>��</option>	
												<option value="1" ${o.limitFrequencyUnit==1?'selected':'' }>Сʱ</option>
											</select>�󣬼����Դ˷�ʽÿ��
											<input type='text' name="frequency" check="isInt();" required='nullable' class=editline size=2 value='${o.frequency}' >
											<select name='frequencyUnit'>
												<option value="2" ${o.frequencyUnit==2?'selected':'' }>��</option>	
												<option value="1" ${o.frequencyUnit==1?'selected':'' }>Сʱ</option>
											</select>����һ�Σ���������Ϊ:<br/> 
											<INPUT type='text' name='remineContent' check="isString('#',100);" required='nullable' class=editline size=80 value='${o.remineContent}' >��
										  </td>
									<td>
									<input type='button' name='delRemine' onclick="deleteCurrentRow(this,'${o.id}');return false;" value='ɾ��' title="ɾ������������" class="button">
									</td>
									</c:if>
									<br/>
									</c:forEach>
									
	       							</table>
	       						</FIELDSET>
									</td>
								</tr>
									<tr>																			
											<td>
												<font color="red">*</font>˵����<a href="#" onclick="Util.toggle('remineRemark');return false;">[����˴��鿴˵��]</a></br>
												<span id="remineRemark" style="display:none;">
												1�����Դ߰죺������������Ѵ���Ϊ������0��ʱ����ʾ�����������������;���ύ��/Сʱ�����򡰼����/Сʱ����Ϊ������0���߲���ʱ��ʾ��һ�����Ѻ󽫲������ѡ�<br/>
												2����ʱ�߰죺������ǰ��������ʱ���뵽��ʱ����ͬһ���ڡ���:��ǰ��������ʱ���ڵ���ʱ�����һ�����ڣ�
												����û����յ������ʱ��С�����õ�ʱ�䣬��ôϵͳ�������õ�ʱ�����д߰�;����û����յ������ʱ�����/�������õ�ʱ�䣬��ôϵͳ�����յ������ͬʱ���Ͻ��д߰죻
												���Ѵ���Ϊ0�����򲻽������ѡ�<br/>
												<font color='red'>ʾ��1��ϵͳ���ڴ����������(�ʼ�)��ʽ����(������)(1)�Σ����ڴ�����δ�ύ(3)(��)��,�����Դ˷�ʽ�ڸ�(1)(��)����һ��,��������Ϊ��XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)��ǰ���ڲ�������󣬼�������һ�δ����ˣ�������3��������δ�ύ������£�ÿ��1�췢һ�����ѡ�<br/>
												<font color='red'>ʾ��2��ϵͳ���ڴ��쵽����(��)(��)(6)��(18)ʱ,��(�ʼ�)��ʽ����(������)(1)�Σ����ڴ�ʱ��֮��Ĵ�����δ�ύ(1)(��)��,ÿ��(1)(��)����һ��,��������Ϊ��XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)���쵽��ʱ��Ϊ2011-5-10 12:10�����ڴ�������δ�ύ��������µ�[2011��5��18��10ʱ],�Դ����˽����ʼ�����һ�Ρ�[2011��5��18��10ʱ]֮��ÿ��һ������һ�Ρ�<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;b)���쵽��ʱ��Ϊ2011-5-19 12:10���������Դ����˽����ʼ�����һ��(���쵽��ʱ���ѳ�������ʱ��),����ÿ��һ������һ�Ρ�<br/>
												<font color='red'>ʾ��3��ϵͳ���ڴ��쵽����(��)(��)��(3)��(10)��(10)ʱ,��(�ʼ�)��ʽ����(������)(1)�Σ����ڴ�ʱ��֮��Ĵ�����δ�ύ(1)(��)��,ÿ��(1)(��)����һ��,��������Ϊ��XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)���쵽��ʱ��Ϊ2011-12-1 12:10�����ڵ�ǰ���ڲ���������Ҵ�������δ�ύ��������µ�[2012��3��10��10ʱ],�Դ����˽����ʼ�����һ�Ρ�[2012��3��10��10ʱ]֮��ÿ��1������һ�Ρ�<br/>
											</span></td>
									</tr>
								</table>
							</DIV>
							<DIV class=tab-page id=tabPage5>
								<H2 class=tab>
									ҵ���������
								</H2>
								<SCRIPT>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
								<!-- ����Ƕ��ҵ��������� -->
							<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
	  						<tr><td width="100%">
								<jsp:include flush="true" page="flow_ext_config.jsp" >
								<jsp:param name="mainId" value="<%=nodeCode%>" />
	  							</jsp:include>
	  						</td></tr> 
							</table>
							</DIV></logic:equal>
						</DIV>
						<!-- 	����TAB���� -->
					</td>
				</tr>
			</table>
		</form>
</div></td></tr></table>
	</body>
<script>
<logic:equal name="flwNode" property="flgRoot" value="0">
	changetState();	
</logic:equal>
</script>
</html>
