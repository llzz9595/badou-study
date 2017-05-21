<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<jsp:directive.page import="com.shengdai.kpi.util.DateUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${ROOT}/js/kpiCalendar.js"></script> 
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<title>待办维护管理</title>
<script type="text/javascript" >
	function ev_Submit(){
		var selectRow = SelectUtil.getFirstChecked("selectedRow");
		if(selectRow && selectRow.value!="" ){
			if(selectRow.jobstatus==1){
				alert("待办正在提交中....不可重复进行提交!");return false;
			}
			if(confirm("你确定要提交待办?")){
				var fm = $_E("form1");
				fm.submit();
			}
		}else{
			alert("没有选择提交任务!");
		}
	}
</script>
</head>
<body  class="LN_body">
<form name="form1" method="post" action="${ROOT}/submitWorklistItemJobSubmit.do1">
<div class="LN_popupsBox">
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();return false;">关闭</a></div>
<div class="LN_popupsRouteSubmit" ><a href="#" id=""  Onclick="ev_Submit();return false;" >
提交</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">
待办提交查看
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">  
	待办异步提交列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="15%" class="LN_tableBoxtitle2">提交路由</td>
            <td width="10%" class="LN_tableBoxtitle2">创建时间</td>
            <td width="12%" class="LN_tableBoxtitle2">任务开始时间</td>
            <td width="12%" class="LN_tableBoxtitle2">任务结束时间</td>
            <td width="12%" class="LN_tableBoxtitle2">任务状态</td>
            <td width="40%" class="LN_tableBoxtitle2">备注</td>
            </tr>
            <c:forEach var="o" items="${list}" varStatus="idx">
	            <tr>
	             <td  class="LN_tableBoxText2"> 
	              <input type="radio" value="${o.id}" jobstatus="${o.status}" name="selectedRow" ${idx.count==1?'checked':''}/>
	              ${o.routeName}
	            </td>
	            <td class="LN_tableBoxText2">${o.createTime}</td>
	            <td class="LN_tableBoxText2">${o.startTime }&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.endTime}&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.statusDesc}&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.remark}&nbsp;</td>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>
</form>

</body>
</html>
