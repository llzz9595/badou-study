<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.service.IUserService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<%
	String nodeCode = request.getParameter("nodeCode");
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>���˿���</title>
		<%
		//request.setAttribute("flowNodeExtList2", request.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			int size = ((List)request.getAttribute("nodeMineList")).size();

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
/*if(checkSelectByName("flgHead",1,"�Ƿ����̷��𻷽�")){
 //if(document.all.handleType.value==""){
 //alert("��ѡ����ʽ����");
 //document.all.handleType.focus();
 //return false;
 //}
 //if(!document.all.addHandlerButton.disabled){
 //if(document.all.flwNodeHandlerValue.value==""){
 //alert("����ѡ�����ˣ���");
 //document.all.addHandlerButton.focus();
 //return false;
 //}
 //}
 return true;
 }*/
return true;
}

var rowsnum=<%=size%>;<%--��¼����--%>
var rindex="";
var rindex1="";
var tempRowNum = <%=size%>;
var ary = new Array();
<%
if(size==0){
out.println("ary[0] = 0;");
}
for(int i=0;i<size;i++){
out.println("ary["+i+"] = "+i+";");
}
%>
function addRow(){
  rowsnum++;
  var arow = tbl.insertRow(Number(tempRowNum));
   var td = arow.insertCell(0);
  td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
  var td = arow.insertCell(1);
  td.innerHTML="ϵͳ����ʱ��ǰ<input type='text' name=\"fromHoure"+rowsnum+"\" class=editline size=2 value='' >"+
  		"Сʱ��<INPUT  type='text' name='toHoure"+rowsnum+"' class=editline size=2 value= >Сʱ��"+
  		"<select name='way"+rowsnum+"'><option value='0'>С��ͨ����</option><option value='1'>�ʼ�</option></select>"+
  		"��ʽ����<select name='reminder"+rowsnum+"'><option value='1'>������</option></select>��"+
  		"ÿ<INPUT type='text' name='frequency"+rowsnum+"' class=editline size=2 value= >"+
  		"<select name='frequencyUnit"+rowsnum+"'><option value='0'>����</option><option value='1'>Сʱ</option><option value='2'>��</option></select>"+
  		"����һ��,��������Ϊ<INPUT type='text' name='remindContent"+rowsnum+"' class=editline size=40 value= >��";
  		
  var td = arow.insertCell(2);
  td.innerHTML="<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this)'> ";
  tempRowNum++;
  var obj = document.all.rowsnum;
  obj.value = rowsnum;
  ary[parseInt(ary.length)]=rowsnum;
  
}

function deleteCurrentRow(obj,id)
{
if(id!=""&&id!=undefined){
if(confirm("��ȷ��Ҫɾ����¼��")){
var nodeMinedeleteurl = "${ROOT}/deleteNodeMine.do1?id="+id+"&nodeCode=<%=nodeCode%>&tab=1&noCache="+Math.random()+urlPara;
LoadAjaxContent(nodeMinedeleteurl,deleteNodeMinecallBackMethod);
}else{
return;
}
}
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--ɾ����ǰ��--%>
	tempRowNum--;
	remove(ary,rindex)
	//alert(ary);
}

function deleteNodeMinecallBackMethod(){
eval(this.request.responseText);
}

function remove(array,index)
{
    if(isNaN(index)||index>array.length){return false;}
    for(var i=0,n=0;i<array.length;i++)
    {
        if(array[i]!=array[index])
        {
            array[n++]=array[i]
        }
    }
   if(array.length!=0){
    array.length-=1
    }
}

function updateFlwNode(){
form2.action = "${ROOT}/editNode.do1?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>&remindIds="+ary+urlPara;
form2.submit();
}

function updateFlwNodeForRoot(){
form2.action = "${ROOT}/editNodeForRoot.do1?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>"+urlPara;
form2.submit();
}

function changetState(flag){
	var value = document.all.handleWay.value;
	if(value==12){
		document.all.methodAlert.innerText="��ÿ��ָ�����ô�����,��������/���˱����ÿ��˹�ϵ;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==11){
		document.all.methodAlert.innerText="������ָ������������,��������/���˱����ÿ��˹�ϵ;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==13){
		document.all.methodAlert.innerText="";//����ȴ���ʽ;
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==1){
		document.all.methodAlert.innerText="��������˰�˳����д���,��һ���˴����,�ڶ����˲����յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==2){
		document.all.methodAlert.innerText="������ô�����,һ���˴���������˲�������;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==3){
		document.all.methodAlert.innerText="������ô�����,����ÿ���˴��������ύ����һ����,ͬʱ�յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==7){
		document.all.methodAlert.innerHTML="����������е��������̶��ߵ��˻��ڲ����ύ����һ����,<br/>һ���˴���������˲�������;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==15){
		document.all.methodAlert.innerHTML="�ʾ������ô�����(��ǩ��ʽ�ύ);";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==""){
		document.all.methodAlert.innerText="��ѡ����ʽ;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==16){				//add by dkm 08-03-26
		document.all.methodAlert.innerText="������ô�����,����ÿ���˴��������ύ����һ����,ͬʱ�յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==17){
		document.all.methodAlert.innerText="������ô�����,����ÿ���˴��������ύ����һ����,ͬʱ�յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==18){
		document.all.methodAlert.innerText="������ô�����,����ÿ���˴��������ύ����һ����,ͬʱ�յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==19){
		document.all.methodAlert.innerText="������ô�����,����ÿ���˴��������ύ����һ����,ͬʱ�յ�����;";
		document.all.nodeHandlerTr.style.display = "";
	}
	if(flag==1){
	    document.all.viewName.value = "";
	    document.all.viewId.value = "";
    }
}

function selectView(){
var handleWay = document.all.handleWay.value;
if(handleWay.length==0){
	alert("��ѡ����ʽ!");
	return ;
}
var url = "${ROOT}/selectDefaultViewPage.do1?nodeCode=<bean:write name="flwNode" property="nodeCode"/>&handleWay="+handleWay+urlPara;
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


function saveNodeTemplate(){
	if(document.getElementById("nodeCode").value!=""){
		form2.action="editNodeTemplate.do1?remindIds="+ary;
	}else{
		form2.action="addNodeTemplate.do1?remindIds="+ary;
	}

	form2.submit();
	window.close();
	window.setTimeout(window.opener.location.reload(),3000);
}

function changeHandleWay(){
	form2.action="getNodeTemplate.do1";
	$_E("HTW").value = 1;
	$_E("remindIds").value = ary;
	form2.submit();
}
</script>
	<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3 >
	
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
		<br>
		
		<form id="form2" name="form2" method="post" action="">
			<input id="remindIds" name="remindIds" type="hidden">
			<input id="HTW" name="HTW" type="hidden">
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
												ҵ�����ͣ�
											</TD>
											<TD width="72%" height=25>											
											<html:select name="flwNode" property="busiId" onchange="changeHandleWay();">
											<%--<option value="" selected>--��ѡ��ҵ��ʽ--</option>--%>
											<html:optionsCollection name="busiList" value="id" label="busiName"/>
											
											</html:select>
											</TD>
										</TR>
										
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
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="memo"/>" name="memo" maxlength="50">
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
											<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getText()%>" name="nodeProecessorText" readonly="readonly">
											<input type='button' id='b1' value='ѡ��' class="button"
											  onclick="javascript:getAddressList('0;10;20;100','n','1','nodeProcessorText','nodeProcessorValue');" >
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
										<TR  id="spreadMethod" style="display:none">
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
											  onclick="javascript:getAddressList('0;10;20','n','1','spreadProcessorText','spreadProcessorValue');" >
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
									��������
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
								<!-- ����Ƕ�����̸��� -->
								<INPUT type="hidden" name="rowsnum" value="">
								<table id="tbl" class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<TBODY>
									<logic:iterate id="nodeMine" name="nodeMineList" indexId="index">
									<input type="hidden" name="id<bean:write name="index"/>" value="<bean:write name="nodeMine" property="id"/>"/>
									<input type="hidden" name="srcId<bean:write name="index"/>" value="<bean:write name="nodeMine" property="srcId"/>"/>
									<tr>
									<td>
									<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>
									</td>
									<%
										String maxValue = Integer.MAX_VALUE+"";
										pageContext.setAttribute("maxValue",maxValue);
									%>
									<td>
									ϵͳ����ʱ��ǰ<input type='text' name="fromHoure<bean:write name="index"/>" class=editline size=2 value='<bean:write name="nodeMine" property="formHoure"/>' >Сʱ��
									<INPUT  type='text' name='toHoure<bean:write name="index"/>' class=editline size=2 value='<logic:notEqual name="nodeMine" property="toHoure" value="${maxValue }"><bean:write name="nodeMine" property="toHoure"/></logic:notEqual>' >Сʱ��
									<select name='way<bean:write name="index"/>'>									
									<option value='0' <logic:equal name="nodeMine" property="way" value="0">selected</logic:equal>>С��ͨ����</option>
									<option value='1' <logic:equal name="nodeMine" property="way" value="1">selected</logic:equal>>�ʼ�</option>
									</select>
									��ʽ����
									<select name='reminder<bean:write name="index"/>'>
									<option value='1' <logic:equal name="nodeMine" property="reminder" value="1">selected</logic:equal>>������</option>
									</select>
									��ÿ<INPUT type='text' name='frequency<bean:write name="index"/>' class=editline size=2 value='<bean:write name="nodeMine" property="frequency"/>' >
									<select name='frequencyUnit<bean:write name="index"/>'>									
									<option value='0' <logic:equal name="nodeMine" property="frequencyUnit" value="0">selected</logic:equal>>����</option>
									<option value='1' <logic:equal name="nodeMine" property="frequencyUnit" value="1">selected</logic:equal>>Сʱ</option>
									<option value='2' <logic:equal name="nodeMine" property="frequencyUnit" value="2">selected</logic:equal>>��</option>
									</select>
									����һ��,��������Ϊ<INPUT type='text' name='remindContent<bean:write name="index"/>' class=editline size=30 value='<bean:write name="nodeMine" property="remineContent"/>' >��
									</td>
									<td>
									<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this,"<bean:write name="nodeMine" property="id"/>")'> 
									</td>
									</tr>
									</logic:iterate>
										<tr>																			
											<td colspan="2">
												<font color="red">*</font>��ʼʱ��С�ڽ���ʱ�䣬��ǰ1��Сʱ��ǰ4��Сʱ������ʱ����Բ����ʾû�����ޡ�<br>
												<font color="red">*</font>������<a href="javascript:addRow()" title="��������"><font color="#0000FF">����</font></a>���ѵ㣬Ҳ���Ե�������
												<img src="${ROOT}/web/flow/img/delete_1.gif" border="0" onclick="">
												ɾ��
											</td>
										</tr>
								</table>
							</DIV>
							
</logic:equal>
						</DIV>

						
						
						<!-- 	����TAB���� -->
					</td>
				</tr>
			</table>
<div align="center"><br>
			<input type="button" onclick="saveNodeTemplate()" value="���沢�ر�">&nbsp;&nbsp;	
			<%--<input type="button" onclick="window.close();" value="�ر�">--%>
		</div>
		</form>
</div></td></tr></table>
	</body>
<script>
<logic:equal name="flwNode" property="flgRoot" value="0">
	changetState();	
</logic:equal>
</script>
</html>
