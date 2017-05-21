<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.shengdai.kpi.system.CommonLoginUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<base target="_self" />
		<%@ include file="/pub/head.inc"%>

		<script type="text/javascript" src="${baseURL}/js/util.js">
</script>
		<title>修改密码-${basePageTitle}</title>
		<style>
			body{
				 padding-top:20px;
				/* background-color:#99ccff;*/
				 padding-bottom:0;
			}
			#psdChange{
				
			}
			#title{
				font-size: 25px;
			 	padding:10px;
			 	width:200px;
			 	margin-left:25%;
			}
		</style>
		
	</head>
	<body>
	<center>
		<div id="title">修改密码</div>
		<div class="navline" style="margin-bottom:20px; margin-top:4px;"></div>
		<form name="form1" method="post" id="form1" target="" action="${baseURL}/updatePassword.do1">
			<table id="psdChange" cellpadding="0" cellspacing="0" class="l-table-edit">
			
				<tr>
					<td align="right" class="l-table-edit-td" valign="top" width="100">
						<span class="star">*</span>原始密码
					</td>
					<td align="left" class="l-table-edit-td">
						<input name="password" type="password" id="password" ltype="text"
							validate="{required:true,minlength:3,maxlength:50}" />
					</td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="right" class="l-table-edit-td">
						<span class="star">*</span>新密码
					</td>
					<td align="left" class="l-table-edit-td">
						<input name="passwordNew" type="password" id="passwordNew"
							ltype="text" validate="{required:true,minlength:6}" />
					</td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="right" class="l-table-edit-td">
						<span class="star">*</span>确认新密码
					</td>
					<td align="left" class="l-table-edit-td">
						<input name="passwordOk" type="password" id="passwordOk" ltype="text"
							validate="{required:true,minlength:6}" />
					</td>
					<td align="left"></td>
				</tr>


			</table>
		</form>
</center>
<!--<fieldset id="login1">
		<legend>用户登录</legend>
		<form action="" method="post" class="form">
		<label for="name">姓名
			<input name="name" type="text" id="name" title="name"/>
		</label>
		<label for="password">密码
			<input name="password" type="text" id="password" />
		</label>
		</form>
	</fieldset>
--><script type="text/javascript">

//表单底部按钮 
LG.setFormDefaultBtn(FF_Cancel, FF_Save);

$("#form1").ligerForm();
LG.validate($("#form1"));
//保存
function FF_Save() {

	var password = $("#password").val();
	var passwordNew = $("#passwordNew").val();
	var passwordOk = $("#passwordOk").val();

	var str = "?password=" + password + "&passwordNew=" + passwordNew
			+ "&passwordOk=" + passwordOk;
	var url = "${baseURL}/updatePassword.do1" + str;
//	alert("${baseURL}");
	$.ajax( {
		type : "GET",
		url : url,
		dataType : "text",
		beforeSend : function() {
			LG.loading = true;
			LG.showLoading('正在处理中...请稍候');
		},
		complete : function() {
			LG.loading = false;
			LG.hideLoading();
		},
		success : function(msg) {
			if (msg == "修改成功！") {
				alert(msg);
				window.close();
			} else {
				alert(msg);
			}
		}
	});

}

function formdetail() {

}
//取消按钮，即关闭窗体
function FF_Cancel() {
	window.close();
}
</script>

	</body>
</html>