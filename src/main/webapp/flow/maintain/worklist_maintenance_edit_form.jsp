<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>待办编辑</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "assessmentIndicatorEditWin";
	function ev_submit(){
		if(CheckForm(form1)){
			showProcessor();
			form1.target="assessmentIndicatorEditWin";
			form1.submit();
		}
	}
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT}/updateWorklistsItemInMaintain.do1" target="assessmentIndicatorEditWin" id="form1">
 <input type="hidden" name="srcWlItemid" id="srcWlItemid" value="${item.id}"/>	
 <input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();return false;">关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="ev_submit();return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">新增待办</div>
<div class="LN_colorRed">红*为必填项</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
    	<tr>
    	 <td width="30%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>待办标题</td>
    	  <td width="70%" class="LN_tableBoxText">
  			<input type="text" name="name" id="name" class="LN_Input300"  value="${item.worklistItemTitle}" check="notBlank;isString('#',200);" required="true"/>
    	  </td>
    	</tr>
    	<tr>
    	 <td width="30%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>环节(${item.nodeName})</td>
    	  <td width="70%" class="LN_tableBoxText">
  				<select name="nodeId">
	      			<c:forEach var="o" items="${nodes}">
	      				<option value="${o.id}" ${o.id==item.nodeCode ? 'selected' : '' }>${o.nodeName}</option>
	      			</c:forEach>
      			</select>
    	  </td>
    	</tr>
  		<tr>
    	 <td width="30%" class="LN_tableBoxtitle">业务对象</td>
    	  <td width="70%" class="LN_tableBoxText">${item.boName}</td>
    	</tr>
		<tr>
    	 <td width="30%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>处理人(${item.handlerName})</td>
    	  <td width="70%" class="LN_tableBoxText">
    	  	<input type="hidden" name="handleValue" id="handleValue"  value=""/>
	        <input type="text" name="handleName" id="handleName" class="LN_Input300" readOnly="true" value="" showName="明细处理人"
	         check="notBlank;" required="true"/>
	        <a href="#" class="choose" onclick="getAddressList('20','n','0','handleName','handleValue');return false;" title="选择处理人">选择</a>
    	  </td>
    	</tr>
    </table>
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>