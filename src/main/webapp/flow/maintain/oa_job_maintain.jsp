<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<jsp:directive.page import="com.shengdai.kpi.util.DateUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${ROOT}/js/kpiCalendar.js"></script> 
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<title>统一待办维护管理</title>
<script type="text/javascript" >
	function ev_query(){
		if(CheckForm(form1) && checkTime("startTime","endTime")){
			pageShield();
			form1.submit();
		}
	}
	
	function ev_delete(){
		if(SelectUtil.checkedCount('msgId')>0){
			if(confirm("将要归档选中的任务！你确定吗？")){
				$_E("form1").action = "${ROOT}/deleteOAJob.do1";
				$_E("form1").submit();
			}
		}else{
			alert("请先选择要归档的 待办项！");
		}
	}
	function ev_syncItem(){
		if(SelectUtil.checkedCount('msgId')>0){
			if(confirm("将执行选中的任务！你确定吗？")){
					pageShield();
					$_E("form1").action = "${ROOT}/syncOAJob.do1";
					$_E("form1").submit();
			}
		}
		else{
			alert("请先选中要执行的任务！");
		}
	}
	/**
	  * 同步初始化
	  **/
	function ev_syncInitAll(){
		if(confirm("该功能是将当前KPI系统上所有待办同步新增到OA待办中心(因KPI没有已办树，暂不同步已办)!你确定吗?")){
			if(confirm("此操作要先将OA中的待办、已办删除，否则可能会出现重复待办!你确定吗?")){
				pageShield();
				$_E("form1").action = "${ROOT}/syncInitItemToOA.do1";
				$_E("form1").submit();
			}
		}
	}
</script>
</head>
<body  class="LN_body">
<form name="form1" method="post" action="${ROOT}/queryOAJob.do1?">
<div class="LN_popupsBox">
<div class="LN_Append">
<div align="right">

<a href="#" onclick="ev_syncItem();return false;">同步</a>&nbsp;|
<a href="#" onclick="ev_delete();return false;">归档</a>&nbsp;|
<a href="#" onclick="ev_syncInitAll();return false;" 
title="该功能是将当前KPI系统上所有待办同步新增到OA待办中心(因KPI没有已办树，暂不同步已办)">
<font color="red">统一待办初始化</font></a>&nbsp;|
</div>

</div>
<div class="LN_formBox">
<div class="LN_formTitle">
统一待办维护管理
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg" onclick="Util.toggle('divQuery');">  
	待办查询</td>
  </tr>
  <tr id="divQuery" style="display:''">
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
           <tr>
        <td width="15%" class="LN_tableBoxtitle">业务类型</td>
        <td width="35%" class="LN_tableBoxText">
        	 <input type="radio" value="2" name="type" checked="checked"}/>统一待办任务
        	 <input type="radio" value="1" name="type"/>邮件任务
        	 <input type="radio" value="0" name="type"}/>短信任务
		</td>
		<td width="15%" class="LN_tableBoxtitle">同步状态</td>
		 <td width="35%" class="LN_tableBoxText">
		 	<input type="radio" value="-2" name="status" ${status==-2 or status==null?'checked':''}/>失败
		 	<input type="radio" value="0" name="status" ${status==0?'checked':''}/>等待
		 	<input type="radio" value="1" name="status" ${status==1?'checked':''}/>加载
		 	<input type="radio" value="2" name="status" ${status==2?'checked':''}/>执行
		 	<input type="radio" value="3" name="status" ${status==3?'checked':''}/>成功
		 </td>
      </tr>
      <tr>
      <td width="15%" class="LN_tableBoxtitle">处理人</td>
        <td width="35%" class="LN_tableBoxText" >
        <textarea rows="3" cols="30" name="handlerName">${handlerName}</textarea>
       	<input type="hidden" name="handlerText" value="${handlerText}" readonly="true" />
       	<a href="#" class="choose" onclick="getAddressList('20','n','3','handlerName','handlerText');return false;" title="选择员工">选择</a>
		</td>
		 <td width="15%" class="LN_tableBoxtitle">创建时间</td>
        <td width="35%" class="LN_tableBoxText" >
       开始:<input type="text" name="startTime" value="${startTime}" check="notBlank;" 
       required="true"  size="30" onfocus="calendar(true)" showName="开始时间"/><br/>
       结束:<input type="text" name="endTime" value="${endTime}" size="30" check="notBlank;" 
       required="true" onfocus="calendar(true)" showName="结束时间"/>
		</td>
      </tr>
            <tr>
		      <td width="100%" class="LN_tableBoxText" colspan="4" align="center">
				<center><input name="btnQuery" type="button" class="LN_big_button3" value="查询" onclick="ev_query();"/></center>
				</td>
		      </tr>
          </table>
      </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">  
	待办列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="5%" class="LN_tableBoxtitle2"><input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'msgId');"/>
            	序号</td>
            <td width="20%" class="LN_tableBoxtitle2">待办标题</td>
            <td width="16%" class="LN_tableBoxtitle2">待办处理人</td>
            <td width="5%" class="LN_tableBoxtitle2">待办状态</td>
            <td width="5%" class="LN_tableBoxtitle2">同步次数</td>
            <td width="9%" class="LN_tableBoxtitle2">创建时间</td>
            <td width="9%" class="LN_tableBoxtitle2">最后执行时间</td>
            <td width="22%" class="LN_tableBoxtitle2">失败日志</td>
            
            </tr>
            <c:forEach var="o" items="${list}" varStatus="idx">
	            <tr>
	             <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="id" value="${o.id }"/>
	              <input type="checkbox" value="${o.id}" name="msgId" />
	            </td>
	            <td class="LN_tableBoxText2">${o.resourceName}</td>
	            <td class="LN_tableBoxText2">${o.to }</td>
	            <td class="LN_tableBoxText2">${o.resourceStatus }</td>
	            <td class="LN_tableBoxText2">${o.sendCount}</td>
	            <td class="LN_tableBoxText2"><bean:write name="o" property="creatDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>       
	            <td class="LN_tableBoxText2"><bean:write name="o" property="lastSendTime" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>       
	            <td class="LN_tableBoxText2" title="${o.failLog }">${fn:length(o.failLog)>50?fn:substring(o.failLog,0,50):o.failLog}</td>
            	</tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>

<kpi:page-bar formId="form1"/>
</form>
<script>
	window.onload = function(){ setPHeight3();}
</script>
</body>
</html>
