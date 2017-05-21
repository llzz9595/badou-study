<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<jsp:directive.page import="com.shengdai.kpi.util.DateUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript" src="${ROOT}/js/dialog.js"></script>  
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<title>待办维护管理</title>
<script type="text/javascript" >
	function ev_query(){
		var fm = $_E("form1");
		if(CheckForm(fm) && checkTime("startTime","endTime")){
			fm.submit();
		}
	}
	
	function ev_delete(){
		if(SelectUtil.checkedCount('selectedRow')>0){
			$_E("form1").action = "${ROOT}/removeWorklistJobsInMaintain.do1";
			$_E("form1").submit();
		}else{
			alert("请先选择要删除的 项！");
		}
	}
	function ev_Submit(){
		if(SelectUtil.checkedCount('selectedRow')>0){
			if(confirm("你确定要重新提交待办?")){
				var fm = $_E("form1");
				fm.action = "${ROOT}/submitWorklistItemJobSubmitByBatch.do1";
				fm.submit();
			}
		}else{
			alert("请先选择要提交的项！");
		}
	}
</script>
</head>
<body  class="LN_body">
<form name="form1" method="post" action="${ROOT}/queryWorklistJobsInMaintain.do1">
<div class="LN_popupsBox">
<div class="LN_Append">
<div class="LN_popupsDelete60">
<a href="#" onclick="ev_delete();return false;">移除</a>
</div>
<div class="LN_popupsRouteSubmit" style="width:60px"><a href="#" Onclick="ev_Submit();return false;" >
重新提交</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">
待办异步提交维护
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg" onclick="Util.toggle('divQuery');">  
	待办 异步提交任务查询</td>
  </tr>
  <tr id="divQuery" style="display:''">
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
           <tr>
		 <td width="15%" class="LN_tableBoxtitle">状态</td>
		 <td width="35%" class="LN_tableBoxText" colspan="3">
		 	<input type="radio" value="-2" name="status" ${status==-2 or status==null?'checked':''}/>失败
		 	<input type="radio" value="3" name="status" ${status==3?'checked':''}/>已完成
		 </td>
      </tr>
      <tr>
      <td width="15%" class="LN_tableBoxtitle">处理人</td>
        <td width="35%" class="LN_tableBoxText" >
        <textarea rows="3" cols="30" name="handlerName">${handlerName}</textarea>
       	<input type="hidden" name="handlerText" value="${handlerText}" readonly="true" />
       	<a href="#" class="choose" onclick="getAddressList('20','n','3','handlerName','handlerText');return false;" title="选择员工">选择</a>
		</td>
		 <td width="15%" class="LN_tableBoxtitle"> 创建时间<span class="LN_colorRed">*</span></td>
        <td width="35%" class="LN_tableBoxText" >
       开始:<input type="text" name="startTime" value="${startTime}" check="required" required="true" showName="开始时间"  size="30" onfocus="calendar(true)" /><br/>
       结束:<input type="text" name="endTime" value="${endTime}" check="required" required="true" showName="结束时间" size="30" onfocus="calendar(true)" />
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
	待办异步提交任务列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="5%" class="LN_tableBoxtitle2"><input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'selectedRow');"/></td>
            <td width="35%" class="LN_tableBoxtitle2">任务描述</td>
            <td width="12%" class="LN_tableBoxtitle2">提交路由</td>
            <td width="12%" class="LN_tableBoxtitle2">创建时间</td>
            <td width="8%" class="LN_tableBoxtitle2">处理人</td>
            <td width="8%" class="LN_tableBoxtitle2">状态</td>
            <td width="20%" class="LN_tableBoxtitle2">记录日志</td>
            </tr>
            <c:forEach var="o" items="${list}" varStatus="idx">
	            <tr>
	             <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="id" value="${o.id }"/>
	              <input type="checkbox" value="${o.id}" name="selectedRow" />
	            </td>
	            <td class="LN_tableBoxText2">
	            ${o.jobName }
	            &nbsp;</td>
	            <td class="LN_tableBoxText2">${o.routeName}&nbsp;</td>
	            <td class="LN_tableBoxText2"><bean:write name="o" property="createTime" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
	            <td class="LN_tableBoxText2" title="${o.agentName}">${o.agentName}&nbsp;</td>
		        <td class="LN_tableBoxText2" >${o.statusDesc}&nbsp;</td>
		        <td class="LN_tableBoxText2" title="${o.remark}">
		        <a href="#" class="LN_BlueLink" onclick="alert('${o.remark}');return false;">${fn:length(o.remark)>30?fn:substring(o.remark,0,30):o.remark}</a>&nbsp;</td>
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
