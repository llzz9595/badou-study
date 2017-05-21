<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>员工列表</title>
    <script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
    <script src="${ROOT}/js/dialog.js"></script>
	<script type="text/javascript">
	<!--
		var effectDate='';
		var dg;
		/**
		*新增用户
		*/
		function ev_add(orgId){
			var url = "${ROOT}/createUser.do1?orgId="+orgId
			//openFullScreenWin(url);
			pageShowForm(url);
		}
		
		/**
		*编辑用户信息
		*/
		function ev_edit(id){
			var url = "${ROOT}/editUser.do1?id="+id;
			pageShowForm(url);
		}
		
		/**
		*删除用户信息
		*/
		function ev_delete(){
			var ids="";
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个员工!");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
					ids = ids+cbs[i].value+ "@";
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个员工！");
				return;
			}
			
				//effectDate = window.showModalDialog("${ROOT}/tip.do1?ids="+ids+"&operateType=2&beforeOrgID=${orgId}","","dialogHeight:450px;dialogWidth:750px;status:no;help:no;");
				//if(effectDate == undefined){
				//	alert("请选择冻结生效时间");
				//	return;
				//}
			ev_showDg();
		}
		function ev_showDg(){
				click_oktitle : '【系统提示信息】';
			
			    title = '<span class=MenuWhite>'+"冻结意见"+'</span>';
			    dg=new dialog("optioin");
			    dg.init();
			    dg.set('src', 6);	// smile
			    dg.set('title', "冻结意见");	
				dg.set('msgid', document.getElementById("remark").value);
				dg.paras = "remark";
				
				document.getElementById("dialogBox").style.left = '100';
				document.getElementById("dialogBox").style.top = '100';	
			    dg.event(document.getElementById("remark").value, 'ev_submit()', '1', '');
		}
		function ev_submit(){
			if(dg.msg==''||dg.msg.trim().length<=0){
				alert("冻结意见必须填写");
				ev_showDg();
				return;
			}
			document.getElementById("remark").value = dg.msg;
			form.action = "${ROOT}/delUser.do1?orgId=${orgId }";
			//form.action = "${ROOT}/delUser.do1?orgId=${orgId }&effectDate="+effectDate
			form.submit();
		}
		
		/**
		*打开查询表单
		*/
		function ev_openForm(param){
			var queryForm = document.getElementById("queryform");
			if(param == "close"){
				queryForm.style.display = "none";
			}else{
				if(queryForm.style.display == ""){
					queryForm.style.display = "none";
				}else{
					queryForm.style.display = "";
				}
			}
		}
		
		function ev_doQuery(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/queryUser.do1?orgId=${orgId }";
			form.submit();
		}
		
		function ev_export(){
			var exportType = window.showModalDialog("${ROOT}/exportImportUser.do1?orgId=${org.id}",
										window,"dialogHeight:500px;dialogWidth:450px; status:no; help:no; scroll:yes");
		}
		
		/**
		*员工调动
		*/
		function ev_moveUser(){
			if(SelectUtil.checkedCount('id')>0){
				var ids = SelectUtil.checkedValues("id");
				//转到调动说明页面
				var retV = window.showModalDialog("${ROOT}/moveUsersTargetOrgTip.do1?ids="+ids,window,"dialogHeight:500px;dialogWidth:600px;status:no; help:no; scroll:no");
				if(retV=='ok'){
					window.location = window.location;
				}
			}else{
				alert("请至少选择一个员工！");
			}
		}
		
		/**
		*跳转到调动申请页面
		*/
		function ev_moveRequisition(){
			var url = "${ROOT}/web/system/org/user_move_req_from.jsp?orgID=${orgId}";
			pageShowForm(url);
		}
		
		/**
		*跳转到调入申请页面
		*/
		function ev_listRequisition(){
			var url = "${ROOT}/listMoveRequisition.do1?orgID=${orgId}";
			pageShowForm(url);
		}
		
		/**
		*跳转到冻结用户列表
		*/
		function ev_invadilUser(){
			window.parent.location.href="${ROOT}/listInvadilUsers.do1";
		}
		
		
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>员工管理</h2></td></tr>
   <tr>
      <td class="list-caozuo">
	<a href="javascript:ev_openForm('open');">查询</a>&nbsp;|&nbsp;
	<a href="javascript:ev_add('${org.id}');">新增</a>&nbsp;|&nbsp;
   	<a href="javascript:ev_delete();">冻结</a>&nbsp;|&nbsp;
   	<a href="javascript:ev_invadilUser();">冻结员工管理</a>|
   	<%--<a href="javascript:ev_export();">导入导出</a>&nbsp;|&nbsp; 
   	<a href="javascript:ev_moveUser();">员工调动</a> --%>
  	</td>
	</tr>
</table>
<form name="form" method="post" id="form">
<input type="hidden" name="remark" id="remark"/>
<input type="hidden" name="orgInfo" id="orgInfo"/>
<input type="hidden" name="orgText" id="orgText"/>
<div id="queryform" style="display:none;">
    <table class="listquery" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td  width="30%"  class="t">登录帐号</td>
        <td ><input name="logonId" type="text"  size="30" value="${logonId }"/></td>
      </tr>
      
      <tr>
        <td width="30%" class="t">员工编号</td>
        <td ><input name="mss" type="text"  size="30" value="${mss }"/></td>
      </tr>
      
      <tr>
        <td  width="30%" class="t">姓名</td>
        <td ><input name="name" type="text"  size="30" value="${name }"/></td>
      </tr>
      </table>
 <div align="center">     
          <input name="btnQuery" type="submit" value="查询" class="button2" onclick="ev_doQuery()"/>
          <input name="btnQuery" type="button"  value="关闭" class="button2" onclick="ev_openForm('close')"/>
		
 </div>
 </div>
 
 
 
 
 <div align="left">
       [<font color="#CC3300" >${org.fullName}</font>]下的用户列表。
</div> 
 
 
	  <table class="" width="100%" cellspacing="0" border="0" cellpadding="0">
		<tr>
		 <td width="8%" class="list-title">
            <input id="selectAll" type="checkbox"  onclick="javascript:checkAll(this.id,'id');"/>序号
         </td>
          <td align="center" width="8%" class="list-title">登陆名</td>
          <td align="center" width="8%" class="list-title">姓名</td>
          <td align="center" width="30%" class="list-title">部门</td>
          <td align="center" width="10%" class="list-title">联系方式</td>
          <td align="center" width="10%" class="list-title">EMAIL</td>
          <td align="center" width="10%" class="list-title">QQ</td>
		</tr>
		<c:forEach var="user" items="${userList}" varStatus="idx" >
			<tr class="list-color${idx.index%2 == 0 ? '1' : '2'}">
			  <td class="list-text1">
			  	<input id="id" name="id" onclick="" type="checkbox" value='${user.id}'/>${idx.count}
			  </td>
			  <td class="list-text1" align="left"><a href="javascript:ev_edit('${user.id}');" >${user.logonId}</a></td>
			  <td class="list-text1" align="left">${user.name}</td>
			  <td class="list-text1" align="left">${user.org.fullName}</td>
			  <td class="list-text1" align="left">${user.tel}</td>
			  <td class="list-text1" align="left">${user.email}</td>
			  <td class="list-text1" align="left">${user.qq}</td>
			</tr>
        </c:forEach>
	</table>
<kpi:page-bar formId="form" />
</form>

</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function (){setPHeight3();}
	
//-->
</script>