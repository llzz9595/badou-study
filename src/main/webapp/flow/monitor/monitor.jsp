<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.shengdai.kpi.system.Globals" %>
<%@ include file="/web/pub/flow.inc"%>
<%@ include file="/flow/secure.inc" %>
<%
	//解决返回页面无法刷新的问题
	response.setHeader("Cache-Control",""); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control",""); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
  
	pageContext.setAttribute("FREQUENCY_YEAR",""+Globals.FREQUENCY_YEAR);
	pageContext.setAttribute("FREQUENCY_QUARTER",""+Globals.FREQUENCY_QUARTER);
	pageContext.setAttribute("FREQUENCY_MONTH",""+Globals.FREQUENCY_MONTH);
 %>
<html>
	<head>
		<title>流程批次监控表</title>
	</head>
	<style type="text/css">
<!--
.bigbutton{
	width:200px;height:18px;font-size:12px;margin:1px;border:1px solid #A4B3C8;background-color:#DFE7EF;
}
-->
</style>
	<script src="${ROOT}/component/calendar/Calendar.js"></script>
	<script language="javascript">

function ev_detail(id){
var disp = document.getElementById(id).style.display;
if(disp=="none"){
document.all.detailButton.value="隐藏明细";
document.getElementById(id).style.display = "";
}else{
document.all.detailButton.value="处理明细";
document.getElementById(id).style.display = "none";
}
}

function startBatch(monitorId){
var year = document.all.year.value;
var type = document.all.scopeType.value;
var value = "";
if(year==""){
alert("请你选择年份！！");
document.all.year.focus();
return;
}
if(type==<%=Globals.FREQUENCY_MONTH%>){
if(document.all.month.value==""){
alert("请你选择月份！！");
document.all.month.focus();
return;
}
value = document.all.month.value;
}
if(type==<%=Globals.FREQUENCY_QUARTER%>){
if(document.all.quarter.value==""){
alert("请你选择季度！！");
document.all.quarter.focus();
return;
}
value = document.all.quarter.value;
}
var url = "${ROOT}/nextRecBatchStart.do1?id="+monitorId+"&type="+type+"&year="+year+"&month="+value+"&nocache="+Math.random()+urlPara;
document.all.BATCH_ACTION_STARTING.style.display="";
LoadAjaxContent(url,callBackMethod);
}

function callBackMethod(){
document.all.BATCH_ACTION_STARTING.style.display="none";
eval(this.request.responseText);
}

function viewDetail(obj){
	if(obj.value==""){
	    alert("请选择考核周期!");
		return ;
	}
	window.location = "${ROOT}/listWorklistForRecBatch.do1?monitorId=${monitor.id}&id="+obj.value+urlPara;
}

function deleteRecBatch(id){
	if (confirm("您确认要删除记录？")) { 
		var url = "${ROOT}/deleteBatch.do1?id="+id+"&monitorId=${monitor.id}"+urlPara;
		LoadAjaxContent(url,deleteRecBachCallBackMethod);
	}
}

function deleteRecBachCallBackMethod(){
eval(this.request.responseText);
}

function batchSubmit(batchId,routeId){
if (confirm("您确认要批量提交此路由吗？")) { 
var url = "${ROOT}/batchSubmitNext.do1?batchId="+batchId+"&routeId="+routeId+"&nocache="+Math.random()+"&mid=<bean:write name="monitor" property="id" />"+urlPara;
LoadAjaxContent(url,batchSubmitCallBackMethod);
}
}

function batchSubmitCallBackMethod(){
eval(this.request.responseText);
}

function saveRecBatchLimit(){
if(document.all.id.value==""){
alert("请选择一考核周期！");
return;
}
if(confirm("您修改的路由时限要保存吗？")){
form1.action = "${ROOT}/addRecBatchLimit.do1";
form1.submit();
}
}
function unLoadSave(){
if(document.all.limitChange.value=="1"){
saveRecBatchLimit();
}
}

function changeRecLimit(){
document.all.limitChange.value = "1";
}

function linkToWorklistDetailInfo(flwCode,recBatchId,flwNodeCode,status){
	location.href = "${ROOT}/listFlowNodeDetailForDelegate.do1?monitorId=<%=request.getParameter("monitorId")%>&flwCode="+flwCode+"&recBatchId="+recBatchId+"&flwNodeCode="+flwNodeCode+"&status="+status+urlPara;
}

function viewFreeFlowMonitor(flowCode,batchId,type){
parent.location.href = "${ROOT}/listFreeFlowMonitor.do1?monitorId=<%=request.getParameter("monitorId")%>&batchId="+batchId+"&parentFlowCode="+flowCode+"&type="+type+urlPara;
}

function hiddenLimitContent(){
var value = document.all.limitContent.style.display;
if(value=="none"){
document.all.limitContent.style.display = "";
document.all.limitHidden.value="隐藏时限";
}else{
document.all.limitContent.style.display = "none";
document.all.limitHidden.value="显示时限";
}
}

function hiddenStyle(){
var type = document.all.scopeType.value;
if(type==<%=Globals.FREQUENCY_YEAR%>){
document.all.freq_moq_text.innerHTML = "";
document.all.month.style.display = "none";
document.all.quarter.style.display = "none";
}
if(type==<%=Globals.FREQUENCY_QUARTER%>){
document.all.freq_moq_text.innerHTML = "季度";
document.all.month.style.display = "none";
document.all.quarter.style.display = "";
}
if(type==<%=Globals.FREQUENCY_MONTH%>){
document.all.freq_moq_text.innerHTML = "月份";
document.all.month.style.display = "";
document.all.quarter.style.display = "none";
}
}

function listStartSingleFlow(){
	var url = "${ROOT}/listFlowSingle.do1?batchId=${recBatch.id}&fid=${monitor.flow.id}"+urlPara;
	window.location = url;
}

function listAllRecInfos(){
	var url = "${ROOT}/listbosInBatch.do1?batchId=${recBatch.id}"+urlPara;
 	var back = window.showModalDialog(url,'',"dialogHeight:550px;dialogWidth:800px;status=off");
 	if(back=="ok"){
 		window.location.href =window.location.href;
 	}
}
function openWin(batchId){
	var url = "${ROOT}/monitorStartOrgVoLog.do1?batchId=${recBatch.id}&monitorId=${monitor.id}";
	window.location = url;
}

</script>
<body>
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
          <c:if test="${recBatch != null}">
           <c:if test="${monitor.flow.commBusi.flgBatch==1}">
            <kpi:secure name="单独发起" onClick="listStartSingleFlow('create')" code="${typeCode }601" resourceId="${orgId }" type="button" className="button4" extend="id='listSingleFlowCreate' "/>
            <kpi:secure name="单独删除" onClick="listAllRecInfos()" code="${typeCode }602" resourceId="${orgId }" type="button" className="button4" extend="id='listSingleFlowDelete' "/>
            <kpi:secure name="批次删除" onClick="deleteRecBatch('${recBatch.id}')" code="${typeCode }603" resourceId="${orgId }" type="button" className="button4" extend="id='batchDelete' "/>
            </c:if>
            <c:if test="${monitor.flow.commBusi.flgBatch==0}">
             <kpi:secure name="删除" onClick="deleteRecBatch('${recBatch.id}')" code="${typeCode }603" resourceId="${orgId }" type="button" className="button4" extend="id='batchDelete' "/>
            </c:if></c:if>
          </div></td>
        </tr>
        <tr>
          <td>
<form id="form1" name="form1" method="post" action="">
			<table border="0" align="center" valign="top" width="90%">
				<tr>
					<td nowrap="nowrap" colspan="5">
						<center>
							<br/><font size="3pt" color="#666666"><b><u>流程监控</u></b></font>
						</center>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
							<tr>
								<td nowrap="nowrap" width="15%">
									<b>流程名称:</b>
								</td>
								<td nowrap="nowrap" width="*" colspan="5" align="left">
									<bean:write name="monitor" property="flow.flowName" />
								</td>
							</tr> 
							<tr>
								<td nowrap="nowrap">
									<b>当前考核周期:</b>
								</td>
								<td nowrap="nowrap" colspan="5" align="left">
									<html:select name="monitorForm" property="id" onchange="viewDetail(this)">
										<OPTION value="">
											--请选择--
										</OPTION>
										<logic:notEmpty name="monitorList">
											<html:optionsCollection name="monitorList" value="id" label="batchName" />
										</logic:notEmpty>
									</html:select>&nbsp;									
								</td>
							</tr>
							<c:if test="${recBatch!=null}">
							<tr>
								<td nowrap="nowrap">
									<b>发起时间:</b>
								</td>
								<td nowrap="nowrap">
									<fmt:formatDate value="${recBatch.genDate}" pattern="yyyy-MM-dd HH:mm"/>
								&nbsp;
								</td>
								<td nowrap="nowrap">
									<b>批次状态:</b>
								</td>
								<td nowrap="nowrap">
									${recBatch.statusName }
								</td>
								<td nowrap="nowrap">
									<b>发起日志:</b>
								</td>
								<td nowrap="nowrap">
									<a href="javascript:openWin('${recBatch.id }');">查看</a>
								</td>
							</tr>
							</c:if>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="button" class="button4" name="detailButton" value="处理明细" onclick="ev_detail('detail');"/>
					</td>
				</tr>

				<tr id="detail">
					<td colspan="5" width="100%">
						<table id="tb1" width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
							<tr>
								<td class="title-header" align="center" width="20%" height="20">
									环节
								</td>
								<td class="title-header" align="center" width="20%">
									未处理
								</td>
								<td class="title-header" align="center" width="20%" nowrap>
									已处理
								</td>
								<td class="title-header" align="center" width="20%" nowrap>
									超时未处理
								</td>
								<td class="title-header" align="center" width="20%">
									超时已处理
								</td>
							</tr>
							<logic:notEmpty name="WorkListHtml">
								<bean:write name="WorkListHtml" filter="false" />
							</logic:notEmpty>
						</table>
					</td>
				</tr>
				</table>
			<hr width="89%" align="center"/>
		</form>

         </td>
        </tr>
      </table>
</body>
</html>

