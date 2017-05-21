<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>单独发起流程列表</title>
	<%@ include file="/web/pub/head.inc"%>
	<%@ include file="/flow/secure.inc" %>
</head>
<script language="JavaScript" type="text/javascript">
window.name = "flowSingleWin";
function startSingelFlow(btn){
	if(SelectUtil.checkedCount("delegate")>0){
		showProcessor();
		form1.submit();
	}else{
		alert("请先选择要发起的考核对象！");
	}
}

function ev_add(){
	var orgtype = "${busi.id=='BMKH'?'0':'20'}";
	getAddressList(orgtype,'n','3','orgNames','orgInfos');
	var orgs = document.getElementById("orgInfos").value;
	if(orgs.trim()=="") return;
	showProcessor();
	form1.action = "${ROOT}/startFlowSingleAddOrgVo.do1";
	form1.submit();
}

function ev_back(){
	window.location = "${ROOT}/listWorklistForRecBatch.do1?monitorId=${monitor.id}&id=${recBatch.id}&orgId=${param.orgId}&busiId=${busi.id}";
}
</script>
	<body>
	<html:base target="_self"/> 
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
          	<kpi:secure name="发 起" onClick="startSingelFlow(this)" code="${typeCode }607" resourceId="${orgId }" type="button" className="button4"/>
          	<kpi:secure name="添 加" onClick="ev_add()" code="${typeCode }608" resourceId="${orgId }" type="button" className="button4"/>
          	<kpi:secure name="返 回" onClick="ev_back()" code="${typeCode }609" resourceId="${orgId }" type="button" className="button4"/>
          </div></td>
        </tr>
        <tr>
          <td height="560" valign="top" class="address-text-bg"><div class="address-depict1">	
	
		<form id="form1" name="form1" method="post" action="${ROOT}/startFlowSingleByOrgVo.do1" target="flowSingleWin">
		<input type="hidden" id="orgNames" name="orgNames" value=""/>
		<input type="hidden" id="orgInfos" name="orgInfos" value=""/>
		<input type="hidden" name="monitorId" value="${monitor.id}"/>
		<input type="hidden" name="batchId" value="${recBatch.id}"/>
		<input type="hidden" name="fid" value="${monitor.flow.id}"/>
		<input type="hidden" name="busiId" value="${busi.id}"/>
		<input type="hidden" name="orgId" value="${param.orgId}"/>
		<center class="title">${recBatch.batchName}</center>
		<br/>
		未发起的考核对象列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号<input type="checkbox" id="selectedHandler"  onclick="SelectUtil.checkAll(this,'delegate');"/></td>
				<td class="list-title" width="30%">考核对象名称</td>
				<td class="list-title" width="32%">未发起原因</td>
			</tr>
		<c:set var="idxCount" value="0"/>
		<c:forEach var="l" items="${batchLogs}" varStatus="idx2">
		<c:if test="${l.flgStatus==0}">
		<c:set var="idxCount" value="${idxCount+1}"/>
			<tr class="list-color${idx2.index%2==0?'1':'2'}">
				<td class="list-text1">${idxCount}<input type="checkbox" value="${l.addressInfo}" name="delegate" /></td>
				<td class="list-text1">${l.orgVo.name }</td>
				<td class="list-text1"><a title="${l.logContent }">${l.logContent }</a>&nbsp;</td>
			</tr>
		</c:if>
		</c:forEach>
		</table>
		</form>	
          </div></td>
        </tr>
      </table>
	</body>
</html>
