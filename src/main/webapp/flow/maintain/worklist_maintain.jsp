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
	function ev_query(){
		if(checkTime("startTime","endTime")){
			var fm = $_E("form1");
			fm.submit();
		}
	}
	
	function ev_delete(){
		if(SelectUtil.checkedCount('selectedRow')>0){
			$_E("form1").action = "${ROOT}/deleteWorklistItems.do1";
			$_E("form1").submit();
		}else{
			alert("请先选择要删除的 待办项！");
		}
	}
	
	function ev_status(status){
		if(SelectUtil.checkedCount('selectedRow')>0){
			$_E("form1").action = "${ROOT}/updateWorklistItemsStatus.do1?status="+status;
			$_E("form1").submit();
		}else{
			alert("请先选择要操作 待办项！");
		}
	}
	function ev_showJob(id){
		openWin("${ROOT}/showWorklistItemJobSubmit.do1?id="+id, {showCenter:true,width:800,height:500});
	}
	/**
	  * 新增子待办
	  **/
	function ev_addWlItem(){
		var selectFirstDom = SelectUtil.getFirstChecked("selectedRow");
		if(selectFirstDom){
			var id = selectFirstDom.value;
			var url = "${ROOT}/editWorklistsItemInMaintain.do1?id="+id;
			var retV = window.showModalDialog(url,window,"dialogWidth:600px;dialogHeight:500px;status=no;");
		}else{
			alert('新增待办需要先勾选一条待办作为基准进行新增，请勾选后，再试一次。');
		}
	}
</script>
</head>
<body  class="LN_body">
<form name="form1" method="post" action="${ROOT}/queryWorklistsInMaintain.do1">
<div class="LN_popupsBox">
<div class="LN_Append">
<div class="LN_popupstransmit100">
<c:choose>
	<c:when test="${status==1}">
		<a href="#" onclick="ev_status(2);return false;">转成已办</a>
	</c:when>
	<c:when test="${status==2}">
		<a href="#" onclick="ev_status(1);return false;">转成待办</a>
	</c:when>
	<c:when test="${status==11}">
		<a href="#" onclick="ev_status(12);return false;">转成已阅</a>
	</c:when>
	<c:when test="${status==12}">
		<a href="#" onclick="ev_status(11);return false;">转成待阅</a>
	</c:when>
	<c:otherwise><a href="#" onclick="ev_status(2);return false;">转成已办</a></c:otherwise>
</c:choose>
</div>
<div class="LN_popupsDelete60">
<a href="#" onclick="ev_delete();return false;">删除</a> 
</div>
<div class="LN_popupsAdd60" style="width:80px;"><a href="#" onclick="ev_addWlItem();return false;">新增待办</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">
待办维护管理
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
        	<select name="busi">
        		<option value="">全部</option>
        		<c:forEach var="o" items="${busiList}">
        			<option value="${o.id}" ${o.id==busiId?'selected':''}>${o.busiName}</option>
        		</c:forEach>
        	</select>
		</td>
		<td width="15%" class="LN_tableBoxtitle">待办状态</td>
		 <td width="35%" class="LN_tableBoxText">
		 	<input type="radio" value="1" name="status" ${status==1 or status==null?'checked':''}/>待办
		 	<input type="radio" value="2" name="status" ${status==2?'checked':''}/>已办
		 	<input type="radio" value="11" name="status" ${status==11?'checked':''}/>待阅
		 	<input type="radio" value="12" name="status" ${status==12?'checked':''}/>已阅
		 	<input type="radio" value="12" name="status" ${status==0?'checked':''}/>等待提交
		 </td>
      </tr>
      <tr>
      <td width="15%" class="LN_tableBoxtitle">处理人</td>
        <td width="35%" class="LN_tableBoxText" >
        <textarea rows="3" cols="30" name="handlerName">${handlerName}</textarea>
       	<input type="hidden" name="handlerText" value="${handlerText}" readonly="true" />
       	<a href="#" class="choose" onclick="getAddressList('20','n','0','handlerName','handlerText');return false;" title="选择员工">选择</a>
		</td>
		 <td width="15%" class="LN_tableBoxtitle">到达时间</td>
        <td width="35%" class="LN_tableBoxText" >
       开始:<input type="text" name="startTime" value="${startTime}"  size="30" onfocus="calendar(true)" /><br/>
       结束:<input type="text" name="endTime" value="${endTime}" size="30" onfocus="calendar(true)" />
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
              <td width="5%" class="LN_tableBoxtitle2"><input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'selectedRow');"/></td>
            <td width="8%" class="LN_tableBoxtitle2">业务类型</td>
            <td width="35%" class="LN_tableBoxtitle2">任务描述</td>
            <td width="12%" class="LN_tableBoxtitle2">当前环节</td>
            <td width="12%" class="LN_tableBoxtitle2">到达时间</td>
            <c:choose>
            	<c:when test="${status==1}">
	            	<td width="10%" class="LN_tableBoxtitle2">处理人</td>
	            	<td width="10%" class="LN_tableBoxtitle2">操作</td>
            	</c:when>
            	<c:when test="${status==2}">
            		<td width="12%" class="LN_tableBoxtitle2">处理时间</td>
            	</c:when>
            	<c:when test="${status==11}">
	            	<td width="10%" class="LN_tableBoxtitle2">待阅人</td>
            	</c:when>
            	<c:when test="${status==12}">
            		<td width="10%" class="LN_tableBoxtitle2">处理时间</td>
            	</c:when>
            </c:choose>
            
            </tr>
            <c:forEach var="o" items="${list}" varStatus="idx">
	            <tr>
	             <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="id" value="${o.id }"/>
	              <input type="checkbox" value="${o.id}" name="selectedRow" />
	            </td>
	            <td class="LN_tableBoxText2">${o.busiTypeZH}</td>
	            <td class="LN_tableBoxText2">
	            ${o.worklistItemTitle}
	            &nbsp;</td>
	            <td class="LN_tableBoxText2">${o.nodeName}&nbsp;</td>
	            <td class="LN_tableBoxText2"><bean:write name="o" property="genDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
	            <c:choose>
            	<c:when test="${status==1}">
	            	<td class="LN_tableBoxText2" title="${o.handlerOrgName}">${o.handlerName}&nbsp;</td>
		            <td class="LN_tableBoxText2">
		            <input name="Submit9" type="button" class="LN_big_button3" value="提交查看" onclick="ev_showJob('${o.id}')"/>
		            </td>
            	</c:when>
            	<c:when test="${status==2}">
            		<td class="LN_tableBoxText2"><bean:write name="o" property="compDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
            	</c:when>
            	<c:when test="${status==11}">
	            	<td class="LN_tableBoxText2" title="${o.handlerOrgName}">${o.handlerName}&nbsp;</td>
            	</c:when>
            	<c:when test="${status==12}">
            		<td class="LN_tableBoxText2"><bean:write name="o" property="compDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
            	</c:when>
           		 </c:choose>
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
<kpi:UIResponse/>
</body>
</html>
