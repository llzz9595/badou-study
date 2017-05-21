<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<jsp:directive.page import="com.shengdai.kpi.util.DateUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>待办列表</title>
<script type="text/javascript" >
    var n = 0;
 	function ev_select()
 	{
 		var checkboxes=document.getElementsByName("id");
 		for(i=0;i<checkboxes.length;i++)
 		{
 			if(n%2==0)
 			{
 			    checkboxes[i].checked=true;
 			}else
 			{
 			    checkboxes[i].checked=false;
 			}
 		}
 		n++;
 	}
function toOpenMsg(batchId,flowCode,nodeCode,busiId){
	var url = "${ROOT}/findWorklistInfoAjax.do1?batchId="+
		batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&busiId="+busiId;
    LoadAjaxContent(url,openMsg); 
}
function openMsg(){
	var back = this.request.responseText;
	var url;
	var flgFullScreen = back.split(";")[0];
	var paras = back.split(";")[1]; 
	if(back.split(";")[2]!=undefined&&back.split(";")[2]!="")
		url = "${ROOT}"+back.split(";")[2]+"?"+paras;
	else
		url = "${ROOT}/openUndoWorklist.do1?" + paras ;
	if(flgFullScreen=="1"){
		var fwidth=screen.width; //屏幕的宽
    	var fheight=screen.height; //屏幕的高
    	url +=  "&flgFullScreen="+1+"&close_window="+1;
		new_window = window.open(url,'msgWin','left=0,top=0,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
	} else {
		url +=  "&flgFullScreen="+0;
		location.href = url;
	}
}
function toOpenMsgNotBatch(worklistItemId,flgFullScreen,busiId){
	var url = "${ROOT}/openUndoWorklistNotBatch.do1?worklistItemId="+worklistItemId+"&busiId="+busiId;
		
   if(flgFullScreen=="1"){
		var fwidth=screen.width-10; //屏幕的宽
    	var fheight=screen.height-50; //屏幕的高
    	//alert("fheight:"+fheight+"--screen.height:"+screen.height);
    	url +=  "&flgFullScreen="+1+"&close_window="+1;
		new_window = window.open(url,'msgWin','left=2,top=2,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
	} else {
		url +=  "&flgFullScreen="+0;
		location.href = url;
	}
}
window.onload=function (){
	setPHeight();
}

function showLimitDateMsg(){
	alert("                        【不用处理】 \n 此待办因为到达处理时限，系统已自动回收，将在晚上9：00或早上6：00消失。");
}

function changeStatus(){
	//form1.action="";
	form1.action = "${ROOT}/listUndoWorklistByCategory.do1";
	form1.submit();
}

</script>
</head>
<body onmousewheel="setScrollzheight();">
<form name="form1" method="post">
  <table border="0" cellspacing="0" cellpadding="0" class="list-top">
    <tr>
      <td><h2>待办列表</h2></td>
    </tr>
    <tr>
      <td id="tdBtn" class="list-caozuo">&nbsp;
      </td>
    </tr>
  </table>
   <table class="listquery" cellpadding="0" cellspacing="1">
	<tr>
	  <td width="12%" class="t">待办类型</td>
	  <td>
		<select name="categoryId" onchange="changeStatus()">
		  <option value="">所有</option>
		  <logic:iterate id="category" name="categoryList" indexId="index">
			  <option value="${category.id}" ${param.categoryId == category.id?"selected":""  }>${category.name}</option>
		  </logic:iterate>
		</select>       
	  </td>
	</tr>
  </table>	
  <table class="list-box" cellspacing="0" cellpadding="0" border="0" id="ctl03_GridViewUserList">
	<tr>
	  <td class="list-title" width="18%">业务类型</td>
      <td class="list-title" width="*">任务描述</td>
      <td class="list-title" width="15%">被考核对象</td>
	  <td class="list-title" width="10%"><kpi:assDisplay fieldName="分数" assId="" handlType="${handleWay }" handler=""/></td>
	  <td class="list-title" width="10%"><kpi:assDisplay fieldName="等级" assId="" handler="" handlType="${handleWay }"/></td>
	</tr>

	<logic:iterate id="worklistItem" name="list" indexId="index">
	<tr class="list-color${index%2==0?'1':'2' }">
	  <td align="center" class="list-text1"><bean:write name="worklistItem" property="busiTypeZH" /></td>
	  <td class="list-text1">
	  	<c:if test="${worklistItem.busiType!='WJDC' && worklistItem.busiType!='JXMT' }">
	  		<c:choose>
	  			<c:when test="${worklistItem.limitDateCompareToCur_Date}">
	  				<a href="javascript:toOpenMsg('<bean:write name="worklistItem" property="batch" />','<bean:write name="worklistItem" property="flowCode" />','<bean:write name="worklistItem" property="nodeCode" />','${worklistItem.busiType }');"><bean:write name="worklistItem" property="worklistItemTitle" /></a>	  	
	  			</c:when>
	  				
	  			<c:otherwise>
	  				<a href="javascript:showLimitDateMsg();"><font color="red">[超时]</font><bean:write name="worklistItem" property="worklistItemTitle" /></a>	  	
	  			</c:otherwise>
	  		</c:choose>
	  	</c:if>
	  	
	  	<c:if test="${worklistItem.busiType=='WJDC' || worklistItem.busiType=='JXMT' }">
	  		<c:choose>
	  			<c:when test="${worklistItem.limitDateCompareToCur_Date}">
	  				<a href="javascript:toOpenMsgNotBatch('${worklistItem.id }','${worklistItem.flwNode.flgFullScreen }','${worklistItem.busiType }');"><bean:write name="worklistItem" property="worklistItemTitle" /></a>
	  			</c:when>
	  			
	  			<c:otherwise>
	  				<a href="javascript:showLimitDateMsg();"><font color="red">[超时]</font><bean:write name="worklistItem" property="worklistItemTitle" /></a>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:if>
	  </td>
	  <td class="list-text1">&nbsp;
	  
	  
	  <c:if test="${worklistItem.busiType!='WJDC' && worklistItem.busiType!='JXMT' }">
	  		<c:choose>
	  			<c:when test="${worklistItem.limitDateCompareToCur_Date}">
	  				<a href="javascript:toOpenMsg('<bean:write name="worklistItem" property="batch" />','<bean:write name="worklistItem" property="flowCode" />','<bean:write name="worklistItem" property="nodeCode" />','${worklistItem.busiType }');">
	  					<c:forEach items="${delegateM[worklistItem.id] }" var="delegate">
						${delegate }&nbsp;
					  	</c:forEach>
					  	<c:if test="${fn:length(delegateM[worklistItem.id])==2 }">
					  	...
					  	</c:if>
					</a>	  	
	  			</c:when>
	  				
	  			<c:otherwise>
	  				<a href="javascript:showLimitDateMsg();">
	  					<c:forEach items="${delegateM[worklistItem.id] }" var="delegate">
						${delegate }&nbsp;
					  	</c:forEach>
					  	<c:if test="${fn:length(delegateM[worklistItem.id])==2 }">
					  	...
					  	</c:if>
	  				</a>	  	
	  			</c:otherwise>
	  		</c:choose>
	  	</c:if>
	  	
	  	<c:if test="${worklistItem.busiType=='WJDC' || worklistItem.busiType=='JXMT' }">
	  		<c:choose>
	  			<c:when test="${worklistItem.limitDateCompareToCur_Date}">
	  				<a href="javascript:toOpenMsgNotBatch('${worklistItem.id }','${worklistItem.flwNode.flgFullScreen }','${worklistItem.busiType }');">
	  					<c:forEach items="${delegateM[worklistItem.id] }" var="delegate">
						${delegate }
					  	</c:forEach>
					  	<c:if test="${fn:length(delegateM[worklistItem.id])==2 }">
					  	...
					  	</c:if>
					</a>
	  			</c:when>
	  			
	  			<c:otherwise>
	  				<a href="javascript:showLimitDateMsg();">
	  					<c:forEach items="${delegateM[worklistItem.id] }" var="delegate">
						${delegate }&nbsp;
					  	</c:forEach>
					  	<c:if test="${fn:length(delegateM[worklistItem.id])==2 }">
					  	...
					  	</c:if>
	  				</a>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:if>
	  </td>
	  
	  <td class="list-text1">
	  	<c:forEach var="boId" items="${boIdM[worklistItem.id] }">
	  		<kpi:assDisplay assId="${boId }" fieldName="finalScore" handler="${handler }" handlType="${handleWayM[worklistItem.id] }"/>&nbsp;
	  	</c:forEach>
	  	<c:if test="${fn:length(boIdM[worklistItem.id])==2 }">
		  ...
		 </c:if>
	  </td>
	  
	  <td class="list-text1">
	  	<c:forEach var="boId" items="${boIdM[worklistItem.id] }">
	  		<kpi:assDisplay assId="${boId }" fieldName="finalGrade"  handler="${handler }" handlType="${handleWayM[worklistItem.id] }"/>&nbsp;
	  	</c:forEach>
	  	<c:if test="${fn:length(boIdM[worklistItem.id])==2 }">
		  	...
		 </c:if>
	  </td>
	  
	 <%--
	  <td><INPUT type="hidden" name="turningHandlerName" value=""/>
    	  <INPUT type="hidden" name="turningUserId" value=""/>
		  <bean:write name="worklistItem" property="limitDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
	--%></tr>
	</logic:iterate>
  </table>
  <kpi:page-bar formId="form1" />
</form>

</body>
</html>
