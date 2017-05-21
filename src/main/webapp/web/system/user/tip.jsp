<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>员工组织内调动</title>
  	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
  	<script  type="text/javascript">
	<!--
		window.name = "userMoveWin";
		function ev_confirm(){
			if(CheckForm(form1) && confirm("你确定要调动用户?")){
				form1.target = "userMoveWin";
				form1.submit();
			}
		}
		
		function ev_edit(id){
			window.open("${ROOT}/listWorklistForRecBatch.do1?id="+id, "_blank", "width=850,height=600,left=110,top=80,resizable=1,status=no,scrollbars=1");
		}
	//-->
  	</script>
  </head>
  
<body class="LN_body">
<form name="form1" method="post" action="${ROOT}/moveUser.do1" id="form1">	
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="resflush_parent" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_confirm();return false;">确定</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工组织内调动</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    	<c:if test="${flgBatching}">
    	<tr>
        <td width="100%" colspan="2" class="LN_tableBoxText">
        <font color="red">提醒：调动员工存在已发起考核表，在调整员工组织后，请在发起批次中对调动的员工进行"单独删除"，
        调整相关信息后再"单独发起", 以确保考核正常(点击下边考核表名称进入考核批次监控页面)。</font>
        </td>
        </tr></c:if>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">需要调动员工</td>
        <td width="90%" class="LN_tableBoxText">
        	<c:forEach var="o" items="${userList}">
        		<input type="hidden" name="id" value="${o.id}"/>
        		${o.fullOrgName}-${o.name}</br>
        	</c:forEach>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">调动员工已发起考核信息
        </td>
        <td width="90%" class="LN_tableBoxText">
       		<c:forEach var="o" items="${userList}">
        		<c:forEach var="o1" items="${o.userAsses}">
        			<a href="#" class="LN_BlueLink" onclick="ev_edit('${o1.batchId}');return false;">${o1.boName}</a></br>
        		</c:forEach>
        	</c:forEach>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">调动目标组织</td>
        <td width="90%" class="LN_tableBoxText">
        	<input type="text" name="orgText" value="" check="notBlank" required="true" showName="目标组织" />
        	<a href="#" class="choose" onclick="getAddressList('0','1','3','orgText','orgInfo');return false;" title="目标组织">选择</a>
        	<input type="hidden" name="orgInfo" value=""/>
		</td>
      </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>