<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc"%>
<%@ include file="/flow/secure.inc" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>详细处理信息</title>
	</head>
	<script language="javascript">
function transferWorklistItem(){


	var ids = getAllChecked('checkname');
	if(ids==""){
		alert("请您选择要转移的项!!");
		return;
	}
	var isWrite=showMsgDialog();
	if(-1==isWrite){
		return;
	}
	var tmpIner=document.getElementById("topBtn").innerHTML;
	document.getElementById("topBtn").innerHTML="开始【转移待办操作】,请稍候..."
	var url = "${ROOT}/listFlowNode.do1?formNodeCode="+form1.currentCode.value+urlPara;
	var obj = new Object();
	obj.ids = ids;
	obj.msg_opinion=document.getElementById("msg_opinion").value;
	var value = window.showModalDialog(url,obj,"dialogHeight:350px;dialogWidth:400px;status=off;scroll=no");
	if(value=="success"){
	  location.reload();
	}else{
		document.getElementById("topBtn").innerHTML=tmpIner;
	}
}


	function showMsgDialog(){
		detailDialog('msg_opinion'); 		//意见填写
		if(document.getElementById("msg_opinion").value.trim()==""){
			if(window.confirm("转办意见为必填项，请填写!")){
			    return showMsgDialog();
			}else{
				return -1;
			}
				
		}
	}
function ev_display_checkbox(btn){
	var turningItem = document.getElementById("turningItem");
	var worklistItemIds = document.getElementsByName("worklistItemId");
	if(turningItem.style.display=="none"){
		btn.value = "隐藏复选框";
		turningItem.style.display="";
		for(var i = 0;i<worklistItemIds.length;i++){
			worklistItemIds[i].style.display = "";
		}
	}else{
		btn.value = "显示复选框";
		turningItem.style.display="none";
		for(var i = 0;i<worklistItemIds.length;i++){
			worklistItemIds[i].style.display = "none";
		}
	}
	
}
var scrollX = 0, scollY = 0;
var cols = parseInt("${fn:length(nodeList)}")-1;
var rows = parseInt("${fn:length(listForStatus)}");
window.onscroll = function(){

}
function hideAllDom(colIndex){
	for(var i=1;i<=colIndex;i++){
		document.getElementById('titleCol'+i).style.display = 'none';
		for(var r = 1;r <= rows; r++){
			document.getElementById('contentCol'+i+'Row'+r).style.display = 'none';
		}
	}
}
function showAllDom(colIndex){
	for(var i=colIndex;i<=cols;i++){
		document.getElementById('titleCol'+i).style.display = '';
		for(var r = 1;r <= rows; r++){
			document.getElementById('contentCol'+i+'Row'+r).style.display = '';
		}
	}	
}
function getScrollPos(){
	if(document.defaultView)
		return {x:document.defaultView.scrollX,y:document.defaultView.scrollY};
	else if(document.documentElement)
		return {x:document.documentElement.scrollLeft,y:document.documentElement.scrollTop};
	else
		return {x:document.body.scrollLeft,y:document.body.scrollTop}
		
}
function turningItem(btn){
	var url = "${ROOT}/turningItem.do1?";
	
	
	
	var ids = getAllChecked('worklistItemId');
	if(ids==""){
		alert("请选择要转办的对象!");
		return ;
	}
	turnForm.id.value=ids;
	getAddressList('20','1','1','turningHandlerName','turningUserId');
	
	var tmpIner=document.getElementById("topBtn").innerHTML;
	document.getElementById("topBtn").innerHTML="开始【转办操作】,请稍候..."
	if(turnForm.turningUserId.value==""){
		alert("请选择转办人!");
		document.getElementById("topBtn").innerHTML=tmpIner;
		return ;
	}
	
 	var isWrite=showMsgDialog();
	if(-1==isWrite){
		document.getElementById("topBtn").innerHTML=tmpIner;
		return;
	}
 		
 	var confirmContent = "您确认要转办吗?";

	if (confirm(confirmContent)) { 
		//document.getElementById("turningItem").disabled = true;//上面已经把此按钮去掉了,所以得不到
		pageShield();
		var url = "${ROOT}/turningItem.do1?";
		turnForm.action= url;
		turnForm.submit();
	}else{
		document.getElementById("topBtn").innerHTML=tmpIner;
	}
 		
}
function ev_back(){
	location.href = "${ROOT}/listWorklistForRecBatch.do1?monitorId=${param.monitorId}&id=${param.recBatchId}"+urlPara;
}


function detailDialog(tId,extOptions) {
	// 设置可选参数
	var options = {inputText:'',inputTitle:'意见',attachList:true,readOnly:false};
	if(extOptions) {
		$_extend(options,extOptions);
	}
	// 在非只读状态时,输入ID不可以为空
	if(options.readOnly == false && StringUtils.isEmpty(tId)) {
		alert('没有设置textId!');
		return false;
	}
	// 设置窗口的度高
	var dialogConfig = "dialogWidth=657px;dialogHeight=560px;scroll=no;resizable=yes;";
	if(options.attachList == false) {
		dialogConfig = "dialogWidth=507px;dialogHeight=290px;scroll=no;";
	}
	// 取得要填写的内容
	var textDom = $_E(tId);	
	if(textDom) {
		// 判断是从value属性还是innerHTML属性中取值
		options.inputText = textDom.value != null ? textDom.value : textDom.innerHTML;
	}
	//update xsf 获得流程实例ID，传入对话框，以便附件根据资源ID添加附件
	var ids = getAllChecked('checkname');
	options.ids = ids;
	// 打开模式窗口		
	var returnValue = window.showModalDialog(context+ "/flow/dlg/opinion_complete.jsp",
											 options,dialogConfig);
	// 回写值到页面中
	if(options.readOnly == false && returnValue != null) {
		if(textDom) {
			textDom.value = returnValue.outputText;		
		}			
	}
}

</script>
<body style="">
	<form name="turnForm" action="" method="post">
		<INPUT type="hidden" name="turningUserId" id="turningUserId" value="" />
		<INPUT type="hidden" name="turningHandlerName" id="turningHandlerName" value=""/>
		<INPUT type="hidden" name="id" id="id" value="" />
		<INPUT type="hidden" name="close_window" id="close_window" value="0" />
		<INPUT type="hidden" name="msg_opinion" id="msg_opinion" value=""/>
	</form>
	  <table height="100%" width="850" border="0" cellpadding="0" cellspacing="0" class="define-box" >
        <tr>
          <td class="dialog-titlebg" width="100%"><div class="dialog-title" id="topBtn" name="topBtn">
          	<c:if test="${recBatch.status!=1}">
          	  <kpi:secure name="转移待办" onClick="transferWorklistItem()" code="${typeCode }605" resourceId="${orgId }" type="button" className="button4" extend="${pro }"/>
              <input type="button" class="button4" value="显示复选框" onclick="ev_display_checkbox(this)" ${pro}/>
              <input type="button" class="button2" value="转办" onclick="turningItem(this)" id="turningItem" name="turningItem" style="display:none"/>
          	</c:if>
            <input type="button" class="button2" value="返回" onclick="ev_back();"/>
          </td>
        </tr>
        <tr>
          <td valign="top" class="address-text-bg">
          <div style="text-align:left; font-size:12px; padding:10px 0px 5px 0px;">
						<center>
							<table width=" 90%" border="0" cellspacing="0" align="center">
								<tr align="center">
									<td>
										详 细 处 理 信 息
									</td>
								</tr>
							</table>
							<table width="90%" border="0" cellspacing="0" align="center">
								<tr align="center">
									<td>
										批次:
										<bean:write name="batchName" />
									</td>
									<td>
										环节:
										<bean:write name="currentNode" />
									</td>
									<td>
										处理状态:
										<bean:write name="status" />
									</td>
								</tr>
							</table>
							<form name="form1" action="" enctype="text/plain">
								<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" style="overflow:hidden;">
									<tr align="center" height="20">
										<div id="freeze_title" style="position:absolute;left:10px;">
										<td nowrap="nowrap" rowspan="2" style="width:50px;">
											<INPUT type="hidden" name="currentCode" value="${param.flwNodeCode}" />
											<INPUT type="checkbox" id="selectAll" value="" onClick="javascript:checkAll(this.id, 'checkname');" />
											<br/>序号
										</td>
										<c:if test="${monitor.flow.commBusi.flgBatch==1}"><td style="width:200px;" nowrap="nowrap" rowspan="2">组织</td></c:if>
										<td style="width:100px;" nowrap="nowrap" rowspan="2">监控对象</td>
										</div>
										<td width="80%" colspan="${fn:length(nodeList)-1}>">处理人</td>
									</tr>
									<tr>
										<!-- 分流程环节列出处理人 -->
										<c:forEach var="o" items="${nodeList}" varStatus="idx">
										<c:if test="${o.flgRoot!=1}">
											<c:choose>
												<c:when test="${o.nodeCode==param.flwNodeCode}">
												<td bgcolor="#D9E1F9" class="title-header" width="${80/(fn:length(nodeList)-1)}%" id="titleCol${idx.index}">
													<span style="color: black">${o.nodeName}</span>
												</td>
												</c:when>
												<c:otherwise>
													<td class="title-header" width="${80/(fn:length(nodeList)-1)}%"  id="titleCol${idx.index}">${o.nodeName}</td>
												</c:otherwise>
											</c:choose>
											</c:if>
										</c:forEach>
									<!-- 列出BO对象 -->
									<c:forEach var="o" items="${listForStatus}" varStatus="idx">
										<tr bgcolor="#FFFFFF" align="center">
											<div  id="freeze_content" style="position:absolute;left:10px;">
											<td align="center" nowrap="nowrap">
												<input type="checkbox" name="checkname" value="${o.boId }" />${idx.count}
											</td>
											<c:set var="boOrgNames" value="${o.boId}_org"></c:set>
											<c:if test="${monitor.flow.commBusi.flgBatch==1}"><td>${listForStatusdelegateMap[boOrgNames]}&nbsp;</td></c:if>
											<td>${listForStatusdelegateMap[o.boId]}</td>
											</div>
											<c:set var="isEnd" value="${true}"></c:set>
											<!-- 列出环节下对应处理人 -->
											<c:forEach var="o1" items="${nodeList}" varStatus="idx1">
												<c:if test="${o1.flgRoot!=1}">
												<td id="contentCol${idx1.index}Row${idx.count}">
												<c:if test="${isEnd}">
												<!-- 获取指定环节下处理人worklistItemMap[o1.nodeCode+'_'+o.boId] -->
												<c:set var="handlerKey" value="${o1.nodeCode}_${o.boId}"></c:set>
												<c:set var="workListItems" value="${worklistItemMap[handlerKey]}"></c:set>
															<c:forEach var="o2" items="${workListItems}" varStatus="idx2">
															<!-- 分颜色显示处理人 -->
																<a title='部门:${o2.handlerOrgName}&#10;帐号:${o2.handlerLogonId}' 
																	onDblclick="try{window.clipboardData.setData('Text','${o2.handlerLogonId}')}catch(e){}">
																	<c:choose>
																		<c:when test="${o2.monitorStatus==1 }">
																		<!-- 处理人转办用的复选框 -->
																		<input type="checkbox" name="worklistItemId" value="${o2.id}" style='display:none'/>
																		<font color='#FF9900'>${o2.handlerUserName}</font>
																		</c:when>
																		<c:when test="${o2.monitorStatus==2 }">
																		<font color='green'>${o2.handlerUserName}</font>
																		</c:when>
																		<c:when test="${o2.monitorStatus==3 }">
																		<!-- 处理人转办用的复选框 -->
																		<input type="checkbox" name="worklistItemId" value="${o2.id}" style='display:none'/>
																		<font color='#FF0000'>${o2.handlerUserName}</font>
																		</c:when>
																		<c:when test="${o2.monitorStatus==4 }">
																		<font color='#666666'>${o2.handlerUserName}</font>
																		</c:when>
																		<c:otherwise></c:otherwise>
																	</c:choose>
																</a><c:if test="${fn:length(workListItems)>1 and idx2.count!=fn:length(workListItems)}">,</c:if>
															</c:forEach>
												
												<!-- 控制从进入的环节(监控上用户点击待办数对应的环节)之后的环节不再显示 -->
												<c:set var="isEnd" value="${not (o1.nodeCode==param.flwNodeCode)}"></c:set>	
												</c:if>		
												&nbsp;</td>		
												</c:if>
											</c:forEach>
										</tr>
									</c:forEach>
								</table>
							</form>
				<table width="200" border="0" align="left">
					<tr>
						<td colspan="4" nowrap="nowrap" bgcolor="#FFFFFF">处理人名称颜色为
							<font style="color: green">■</font>
						   <FONT style="color: green">表示已经处理,</FONT>
							<font style="color: #FF9900">■</font>
							<FONT style="color: #FF9900">表示未处理,</FONT>
							<font style="color: #FF0000">■</font>
							<FONT style="color: #FF0000">表示超时未处理，</FONT>
							<font style="color: #666666">■</font>
							<FONT style="color: #666666">表示超时已处理</FONT>
						</td>
					</tr>
			</table>								
				</center>
				</div>
		  </td>	
		</tr>
		</table>
	<script type="text/javascript">
		window.onload = function(){
		}
	</script>
	</body>
</html>
