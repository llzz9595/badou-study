<%@ page contentType="text/html;charset=utf-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>自动发起任务列表</title>
<script type="text/javascript" >
</script>
</head>
<body onmousewheel="setScrollzheight();">
<form name="form1" method="post">
  <table border="0" cellspacing="0" cellpadding="0" class="list-top">
    <tr>
      <td><h2>自动发起任务列表</h2></td>
    </tr>
    <tr>
      <td id="tdBtn" class="list-caozuo">&nbsp;
      </td>
    </tr>
  </table>
  <table class="list-box" cellspacing="0" cellpadding="0" border="0" id="ctl03_GridViewUserList">
	<tr>
	  <td class="list-title" width="5%">序号</td>
	  <td class="list-title" width="30%">任务名称</td>
	  <td class="list-title" width="10%">发起批次</td>
	  <td class="list-title" width="15%">计划发起时间</td>
	  <td class="list-title" width="17%">实际开始时间</td>
	  <td class="list-title" width="17%">实际结束时间</td>
	  <td class="list-title" width="*">状态</td>
	</tr>
	<logic:iterate id="jobFlow" name="jobFlowList" indexId="index">
	<tr class="list-text${index%2==0?'1':'2' }">
	  <td>${index+1 }</td>
	  <td>${jobFlow.jobName }</td>
	  <td>${jobFlow.batchName }</td>
	  <td><bean:write name="jobFlow" property="flowStartTime" format="yyyy-MM-dd HH:mm"/></td>
	  <td><bean:write name="jobFlow" property="startTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	  <td><bean:write name="jobFlow" property="endTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	  <td>${jobFlow.statusName }</td>
	</tr>
	</logic:iterate>
  </table>
  <kpi:page-bar formId="form1" />
</form>

</body>
</html>
