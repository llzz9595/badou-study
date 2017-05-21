<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<%
	String nodeCode = request.getParameter("nodeCode");
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>环节定义</title>
		<%request.setAttribute("flowNodeExtList2", request
					.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			%>
	</head>
<script language="javascript">

//新增，编辑业务参数弹出窗口
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
if (confirm("您确认要删除记录？")) { 
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
    "<input type=\"hidden\" name=\"remineId\" value=\"\"/>系统将在待办产生后以" +
	"<select name=\"way\">" +
		"<option value=\"1\" >邮件</option>" +
		"<option value=\"0\" >短信</option>" +
	"</select>方式提醒" +
	"<select name='reminder'>" +
	"<option value='1'>处理人</option>" +
	"<option value='0'>发送人</option>" +
	"</select>" +
	"<input type='text' name=\"firstTimes\" check=\"isInt();\" required='nullable' class=editline size=2 value='1' >次," +
	"且在此时间之后的待办尚未提交" +
	"<input type='text' name=\"limitFrequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
	"<select name='limitFrequencyUnit'>	" +
	"	<option value=\"2\">天</option>" +
	"	<option value=\"1\">小时</option>" +
	"</select>后，继续以此方式每隔" +
	"<input type='text' name=\"frequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
	"<select name='frequencyUnit'>	" +
	"	<option value=\"2\">天</option>" +
	"	<option value=\"1\">小时</option>" +
	"</select>提醒一次，提醒内容为:<br/>" +
	"<INPUT type='text' name='remineContent' check=\"isString('#',100);\" required='nullable' class=editline size=80 value='' >。";
  td = arow.insertCell(2);
  td.innerHTML="<input type='button' name='delRemine' onclick=\"deleteCurrentRow(this,'${o.id}');return false;\" value='删除' title=\"删除提醒配置项\" class=\"button\">";
}

function addRow2(){
	  var tbl = document.getElementById("remineTbl");
	  var arow = tbl.insertRow();
	  var td = arow.insertCell(0);
	  td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
	  td = arow.insertCell(1);
	  td.innerHTML="<br/><input type=\"hidden\" name=\"type\" value=\"2\"/>"+
		 " <input type=\"hidden\" name=\"remineId\" value=\"\"/>系统将在待办到达后的" +
	    "<select name='frequencyRelativeCycle'>	" +
		"	<option value=\"1\">本</option>" +
		"	<option value=\"2\">下</option>" +
		"</select>" +
		"<select name='frequencyCycle' onchange='ev_changeUnit(this);'>	" +
		"	<option value=\"1\">月</option>" +
		"	<option value=\"2\">季</option>" +
		"	<option value=\"4\">年</option>" +
		"</select>" +
		"<span style='display:none;'>第<input type='text' name=\"frequencyMonth\" showName='月' check=\"isInt('+');setNumber(1,12);\" required='nullable' class=editline size=2 value='1' >月</span>" +
		"<input type='text' name=\"frequencyDay\" check=\"isInt('+');setNumber(1,31);\" required='nullable' showName='日' class=editline size=2 value='1' >日" +
		"<input type='text' name=\"frequencyHour\" check=\"isInt();setNumber(0,59);\" showName='时' required='nullable' class=editline size=2 value='0' >时" +
		"以<select name=\"way\">" +
			"<option value=\"1\" >邮件</option>" +
			"<option value=\"0\" >短信</option>" +
		"</select>方式提醒" +
		"<select name='reminder'>" +
		"<option value='1'>处理人</option>" +
		"<option value='0'>发送人</option>" +
		"</select>" +
		"<input type='text' name=\"firstTimes\" check=\"isInt();\" required='nullable' class=editline size=2 value='1' >次," +
		"且在待办尚未提交" +
		"<input type='text' name=\"limitFrequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
		"<select name='limitFrequencyUnit'>	" +
		"	<option value=\"2\">天</option>" +
		"	<option value=\"1\">小时</option>" +
		"</select>后，继续以此方式每隔" +
		"<input type='text' name=\"frequency\" check=\"isInt();\" required='nullable' class=editline size=2 value='0' >" +
		"<select name='frequencyUnit'>	" +
		"	<option value=\"2\">天</option>" +
		"	<option value=\"1\">小时</option>" +
		"</select>提醒一次，提醒内容为:<br/>" +
		"<INPUT type='text' name='remineContent' check=\"isString('#',100);\" required='nullable' class=editline size=80 value='' >。";
	  td = arow.insertCell(2);
	  td.innerHTML="<input type='button' name='delRemine' onclick=\"deleteCurrentRow(this,'${o.id}');return false;\" value='删除' title=\"删除提醒配置项\" class=\"button\">";
}

function deleteCurrentRow(obj,id){
	if(id!=""&&id!=undefined){
		if(confirm("您确认要删除记录？")){
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
	tbl.deleteRow(rindex);<%--删除当前行--%>
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

<%-------------------------------- 以下代码开始处理不同处理方式页面的反应 ------------------------------------------%>
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
		document.all.methodAlert.innerText="请选择处理方式;";
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
	alert("请选择处理方式!");
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
									基本配置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<!-- 这里嵌套流程基本配置 -->
								<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<input name="flowCode" type="hidden" value="" />
									<input name="nodeCode" type="hidden" value="<bean:write name="flwNode" property="nodeCode"/>" />
									<TBODY>
									
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												环节名称：
											</TD>
											<TD width="72%" height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="nodeName"/>" name="nodeName" check="notBlank" showName="环节名称" required="true" maxlength="50"/>
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												环节说明：
											</TD>
											<TD height=25>
											<textarea cols="50" rows="6" name="memo">${flwNode.memo}</textarea>
											</TD>
										</TR>
										<logic:equal name="flwNode" property="flgRoot" value="0">
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												显示顺序：
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
												处理方式：
											</TD>
											<TD height=25 nowrap="nowrap">
											<html:select name="nodeForm" property="handleWay" onchange="changetState(1)">
											<option value="">--请选择处理方式--</option>
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
												环节处理人：
											</TD>
											<TD height=25>
											<input type="hidden" name="nodeHandler" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getId() %>"/>
											<INPUT type="hidden" name="nodeProcessorValue" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getValue() %>"/>
											<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getText() %>" name="nodeProecessorText" readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('40;20;100','n','3;1;','nodeProcessorText','nodeProcessorValue');" >
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												界面显示方式：
											</TD>
											<TD height=25>
											
											  <INPUT class=editline size=30 value="${flwNode.viewName }" name="viewName" check="notBlank" showName="界面显示方式" required="true" readonly="readonly">
											  <INPUT type="hidden" name="viewId" value="${flwNode.viewId }">
											  <INPUT type="button" name="selectTemp" value="选择" onclick="javascript:selectView()" class="button">
											  <br><html:checkbox name="flwNode" property="flgFullScreen" value="1">全屏打开待办</html:checkbox> 
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												待办提交方式：
											</TD>
											<TD height=25>
												<html:radio name="flwNode" property="flgSubmitSync" value="1">同步提交</html:radio>
												<html:radio name="flwNode" property="flgSubmitSync" value="0">异步提交</html:radio>
											</TD>
										</TR>
										<TR  id="spreadMethod">
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												是否抄送
											</TD>
											<TD height=25>
												<html:radio name="flwNode" property="flgSpread" value="1"  onclick="changetSpreadPersonStatus(1)"/>
												是&nbsp;
												<html:radio name="flwNode" property="flgSpread" value="0"  onclick="changetSpreadPersonStatus(0)"/>
												否
											</TD>
										</TR>
										<TR  id="spreadPerson" <logic:equal name="flwNode" property="flgSpread" value="0" >style="display:none"</logic:equal> >
											<td align="right">												
											</td>
											<TD align=left height=35>
												抄送人
											</TD>
											<TD align=left height=35 colspan="2">
											<input type="hidden" name="spreadHandler" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getId() %>"/>
											<INPUT type="hidden" name="spreadProcessorValue" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getValue() %>"/>
											<INPUT id="spreadProcessorText" class=editline size=35 value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getText()%>" name="spreadProecessorText" readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('10;20','n','1','spreadProcessorText','spreadProcessorValue');" >
											</TD>
										</TR>
										</logic:equal>										
										<tr>
											<td colspan="3" align="left">
												<font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
											</td>
										</tr>
								</table>
							</DIV>
							<logic:equal name="flwNode" property="flgRoot" value="0">
							<DIV class=tab-page id=tabPage2>
								<H2 class=tab>
									扩展设置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
								<!-- 这里嵌套流程附件 -->
								<table id="tbl" class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
								<tr>
									<td>
										<FIELDSET align=center style="width:96%;">
	       							<LEGEND>提醒配置</LEGEND>
	       							<input type='button' name='addRemine' onclick="addRow1();return false;" value='新增个性催办' class="button">
	       							<input type='button' name='addRemine' onclick="addRow2();return false;" value='新增定时催办' class="button">
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
									系统将在待办产生后以
									<select name="way">
										<option value="1" ${o.way==1?'selected':'' }>邮件</option>
										<option value="0" ${o.way==0?'selected':'' }>短信</option>
									</select>方式提醒
									<select name='reminder'>
									<option value='1' ${o.reminder==1?'selected':'' }>处理人</option>
									<option value='0' ${o.reminder==0?'selected':'' }>发送人</option>
									</select>
									<input type='text' name="firstTimes" check="isInt();" required='nullable' class=editline size=2 value='${o.firstTimes}' >次,
									且在待办尚未提交
									<input type='text' name="limitFrequency" check="isInt();" required='nullable' class=editline size=2 value='${o.limitFrequency}' >
									<select name='limitFrequencyUnit'>
										<option value="2" ${o.limitFrequencyUnit==2?'selected':'' }>天</option>	
										<option value="1" ${o.limitFrequencyUnit==1?'selected':'' }>小时</option>
									</select>后，继续以此方式每隔
									<input type='text' name="frequency" check="isInt();" required='nullable' class=editline size=2 value='${o.frequency}' >
									<select name='frequencyUnit'>
										<option value="2" ${o.frequencyUnit==2?'selected':'' }>天</option>	
										<option value="1" ${o.frequencyUnit==1?'selected':'' }>小时</option>
									</select>提醒一次，提醒内容为:<br/>
									<INPUT type='text' name='remineContent' check="isString('#',100);" required='nullable' class=editline size=80 value='${o.remineContent}' >。
									</td>
									<td>
									<input type='button' name='delRemine' onclick="deleteCurrentRow(this,'${o.id}');return false;" value='删除' title="删除提醒配置项" class="button">
									</td>
									</tr>
									</c:if>
									<c:if test="${o.type==2}">
										 <td><a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>
										 </td>
									<td>
										  <br/><input type="hidden" name="type" value="2"/>
										<input type="hidden" name="remineId" value="${o.id}"/>系统将在待办到达后的
										    <select name='frequencyRelativeCycle'>	
												<option value="1" ${o.frequencyRelativeCycle==1?'selected':'' }>本</option>
												<option value="2" ${o.frequencyRelativeCycle==2?'selected':'' }>下</option>
											</select>
											<select name='frequencyCycle' onchange="ev_changeUnit(this);">
												<option value="1" ${o.frequencyCycle==1?'selected':'' }>月</option>
												<option value="2" ${o.frequencyCycle==2?'selected':'' }>季</option>
												<option value="4" ${o.frequencyCycle==4?'selected':'' }>年</option>
											</select><span style='display:none;'>第<input type='text' name="frequencyMonth" showName='月' check="isInt('+');setNumber(1,12);" required='nullable' class=editline size=2 value='${o.frequencyMonth}' >月</span>
											<input type='text' name="frequencyDay" check="isInt('+');setNumber(1,31);" required='nullable' showName='日' class=editline size=2 value='${o.frequencyDay}' >日
											<input type='text' name="frequencyHour" check="isInt();setNumber(0,59);" showName='时' required='nullable' class=editline size=2 value='${o.frequencyHour}' >时
											以<select name="way">
												<option value="1" ${o.way==1?'selected':'' }>邮件</option>
												<option value="0" ${o.way==0?'selected':'' }>短信</option>
											</select>方式提醒
											<select name='reminder'> 
											<option value='1' ${o.reminder==1?'selected':'' }>处理人</option> 
											<option value='0' ${o.reminder==0?'selected':'' }>发送人</option> 
											</select> 
											<input type='text' name="firstTimes" check="isInt();" required='nullable' class=editline size=2 value='${o.firstTimes}' >次,
											且在此时间之后的待办尚未提交
											<input type='text' name="limitFrequency" check="isInt();" required='nullable' class=editline size=2 value='${o.limitFrequency}' >
											<select name='limitFrequencyUnit'>
												<option value="2" ${o.limitFrequencyUnit==2?'selected':'' }>天</option>	
												<option value="1" ${o.limitFrequencyUnit==1?'selected':'' }>小时</option>
											</select>后，继续以此方式每隔
											<input type='text' name="frequency" check="isInt();" required='nullable' class=editline size=2 value='${o.frequency}' >
											<select name='frequencyUnit'>
												<option value="2" ${o.frequencyUnit==2?'selected':'' }>天</option>	
												<option value="1" ${o.frequencyUnit==1?'selected':'' }>小时</option>
											</select>提醒一次，提醒内容为:<br/> 
											<INPUT type='text' name='remineContent' check="isString('#',100);" required='nullable' class=editline size=80 value='${o.remineContent}' >。
										  </td>
									<td>
									<input type='button' name='delRemine' onclick="deleteCurrentRow(this,'${o.id}');return false;" value='删除' title="删除提醒配置项" class="button">
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
												<font color="red">*</font>说明：<a href="#" onclick="Util.toggle('remineRemark');return false;">[点击此处查看说明]</a></br>
												<span id="remineRemark" style="display:none;">
												1、个性催办：产生待办后提醒次数为负数或0次时，表示产生待办后不马上提醒;“提交天/小时”数或“间隔天/小时”数为负数、0或者不填时表示第一次提醒后将不再提醒。<br/>
												2、定时催办：本：当前待办提醒时间与到达时间在同一周期。下:当前待办提醒时间在到达时间的下一个周期；
												如果该环节收到待办的时间小于配置的时间，那么系统将在配置的时间点进行催办;如果该环节收到待办的时间大于/等于配置的时间，那么系统将在收到待办的同时马上进行催办；
												提醒次数为0或不填则不进行提醒。<br/>
												<font color='red'>示例1：系统将在待办产生后以(邮件)方式提醒(处理人)(1)次，且在待办尚未提交(3)(天)后,继续以此方式第隔(1)(天)提醒一次,提醒内容为：XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)当前环节产生待办后，即会提醒一次处理人，并且在3天后待办尚未提交的情况下，每隔1天发一次提醒。<br/>
												<font color='red'>示例2：系统将在待办到达后的(本)(月)(6)日(18)时,以(邮件)方式提醒(处理人)(1)次，且在此时间之后的待办尚未提交(1)(天)后,每隔(1)(天)提醒一次,提醒内容为：XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)待办到达时间为2011-5-10 12:10，则在处理人尚未提交待办情况下的[2011年5月18日10时],对处理人进行邮件提醒一次。[2011年5月18日10时]之后，每隔一天提醒一次。<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;b)待办到达时间为2011-5-19 12:10，则立即对处理人进行邮件提醒一次(待办到达时间已超过配置时间),并且每隔一天提醒一次。<br/>
												<font color='red'>示例3：系统将在待办到达后的(下)(年)第(3)月(10)日(10)时,以(邮件)方式提醒(处理人)(1)次，且在此时间之后的待办尚未提交(1)(天)后,每隔(1)(天)提醒一次,提醒内容为：XXXXXX.</font><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;a)待办到达时间为2011-12-1 12:10，则在当前环节产生待办后且处理人尚未提交待办情况下的[2012年3月10日10时],对处理人进行邮件提醒一次。[2012年3月10日10时]之后，每隔1天提醒一次。<br/>
											</span></td>
									</tr>
								</table>
							</DIV>
							<DIV class=tab-page id=tabPage5>
								<H2 class=tab>
									业务参数管理
								</H2>
								<SCRIPT>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
								<!-- 这里嵌套业务参数配置 -->
							<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
	  						<tr><td width="100%">
								<jsp:include flush="true" page="flow_ext_config.jsp" >
								<jsp:param name="mainId" value="<%=nodeCode%>" />
	  							</jsp:include>
	  						</td></tr> 
							</table>
							</DIV></logic:equal>
						</DIV>
						<!-- 	整个TAB结束 -->
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
