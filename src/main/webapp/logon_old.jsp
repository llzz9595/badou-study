<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${basePageTitle}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<style type="text/css">
<!--
html,body {
	margin: 0;
	padding: 0;
	font-size: 12px;
	font-family: 宋体, Helvetica, sans-serif;
	overflow: hidden;
	background: url(themes/default/images/lobg.jpg) repeat-x;
}

.login {
	height: 610px;
	left: 0;
	margin: 0 auto;
	position: relative;
	top: 0;
	width: 1003px;
}

.login-01_ {
	height: 153px;
	left: 0;
	position: absolute;
	top: 0;
	width: 251px;
}

.login-02_ {
	height: 153px;
	left: 251px;
	position: absolute;
	top: 0;
	width: 161px;
}

.login-03_ {
	height: 153px;
	left: 412px;
	position: absolute;
	top: 0;
	width: 474px;
}

.login-04_ {
	height: 153px;
	left: 886px;
	position: absolute;
	top: 0;
	width: 117px;
}

.login-05_ {
	height: 110px;
	left: 0;
	position: absolute;
	top: 153px;
	width: 251px;
}

.login-06_ {
	height: 110px;
	left: 251px;
	position: absolute;
	top: 153px;
	width: 161px;
}

.login-07_ {
	background: url(themes/default/images/login_07.jpg) no-repeat;
	height: 273px;
	left: 412px;
	position: absolute;
	top: 153px;
	width: 474px;
}

.login-08_ {
	height: 110px;
	left: 886px;
	position: absolute;
	top: 153px;
	width: 117px;
}

.login-09_ {
	height: 163px;
	left: 0;
	position: absolute;
	top: 263px;
	width: 58px;
}

.login-10_ {
	height: 163px;
	left: 58px;
	position: absolute;
	top: 263px;
	width: 354px;
}

.login-11_ {
	height: 163px;
	left: 886px;
	position: absolute;
	top: 263px;
	width: 117px;
}

.login-12_ {
	height: 184px;
	left: 0;
	position: absolute;
	top: 426px;
	width: 251px;
}

.login-13_ {
	height: 184px;
	left: 251px;
	position: absolute;
	top: 426px;
	width: 161px;
}

.login-14_ {
	height: 184px;
	left: 412px;
	position: absolute;
	top: 426px;
	width: 474px;
}

.login-15_ {
	height: 184px;
	left: 886px;
	position: absolute;
	top: 426px;
	width: 117px;
}

a {
	color: #0D588F;
}

a:hover {
	color: #C03;
}

.box {
	margin: 90px auto 10px auto;
	width: 100%;
}

table {
	width: 60%;
	margin: 0 auto;
}

td {
	height: 25px;
	line-height: 25px;
	padding-left: 3px;
}

.put {
	width: 150px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #133367;
	background: #fff;
	margin-right: 5px;
}

.text {
	text-align: right;
	padding-right: 5px;
	font-weight: bold;
	padding-left: 20px;
}

.user {
	background: url(themes/default/images/user.png) left center no-repeat;
}

.psd {
	background: url(themes/default/images/psd.png) left center no-repeat;
}

.butx {
	text-align: center;
}

.dl {
	background: url(themes/default/images/dl.png) no-repeat;
	height: 30px;
	width: 73px;
	border: none;
	margin: 0 3px;
	padding: 0;
}

.cz {
	background: url(themes/default/images/cz.png) no-repeat;
	height: 30px;
	width: 73px;
	border: none;
	margin: 0 3px;
	padding: 0;
}

.l_w {
	bottom: 100px;
	color: red;
	font-size: 12px;
	font-weight: bold;
	position: absolute;
	right: 4px;
}
-->
</style>
<script type="text/javascript">
/*登录验证*/
function checkdata(){
	var name = document.getElementById('username').value;
	var pass = document.getElementById('password').value;
	if(name.trim()==""){
		alert("请输入用户名！");
		return;
	}
	if(pass.trim()==""){
		alert("请输入密码！");
		return;
	}
	 
	if(name!=""&&pass!=""){
		var Regx = /^[A-Za-z0-9]*$/;
           if (Regx.test(name)) {
               var formObj = document.getElementById("loginFormId");
				formObj.submit();
           }else{
          	//	alert("用户名只能包含[A-Z],[a-z],[0-9]中的字符");
           	  var formObj = document.getElementById("loginFormId");
				formObj.submit();
           }
	}
	
	
}
String.prototype.trim = function()
{
   return this.replace(/(^\s+)|\s+$/g,"");
 }
 
 
 	function keyBorder(event){

			 //alert(event == window.event); 
			if( event.keyCode == 13 ){ // 13表示回车键
				document.getElementById('go').click();					
			}
		}
		
	function openDia(){
		var heightconst=400;
		var widthconst=600;
		var leftconst=(screen.availWidth-widthconst)/2;
		var topconst=(screen.availHeight-heightconst)/2;
		wZoom="dialogLeft:"+leftconst+"px;dialogTop:"+topconst+"px;dialogHeight:"+heightconst+"px;dialogWidth:"+widthconst+"px; center: no; help: no;status:no";
		window.showModalDialog("/pms/kpUser/getPassword.do",window.document,wZoom);
		
	}

</script>
</head>
<body>
<div class="login">
<div class="login-01_"><img id="login_01"
	src="themes/default/images/login_01.jpg" width="251" height="153" alt="" /></div>
<div class="login-02_"><img id="login_02"
	src="themes/default/images/login_02.jpg" width="161" height="153" alt="" /></div>
<div class="login-03_"><img id="login_03"
	src="themes/default/images/login_03.jpg" width="474" height="153" alt="" /></div>
<div class="login-04_"><img id="login_04"
	src="themes/default/images/login_04.jpg" width="117" height="153" alt="" /></div>
<div class="login-05_"><img id="login_05"
	src="themes/default/images/login_05.jpg" width="251" height="110" alt="" /></div>
<div class="login-06_"><img id="login_06"
	src="themes/default/images/login_06.jpg" width="161" height="110" alt="" /></div>
<div class="login-07_">
<div class="box">
<form id="loginFormId" action="<%=contextPath %>/login.do1" method="post">
<table>
	<tr>
		<td class="text user">用户名</td>
		<td><input type="text" class="put" id="username" name="username"
			onkeypress="keyBorder(event);" /></td>
	</tr>
	<tr>
		<td class="text psd">密&nbsp;&nbsp;码</td>
		<td nowrap="nowrap"><input type="password" class="put"
			id="password" name="password" onclick="sumbit()"
			onkeypress="keyBorder(event);" /><a href="#" onclick="openDia()">忘记密码</a></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		<div id="logininfo" class="l_w" style="display: none">登录名称或密码错误，请重新输入。</div>
		</td>
		<td>
		<div id="logininfo1" class="l_w" style="display: none">对不起，你没有相应的权限。</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="butx"><input id="go" type="button"
			class="dl" value="" onclick="checkdata();"
			onkeypress="keyBorder(event);" /> <input type="reset" class="cz"
			value="" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td></td>
	</tr>
</table>
</form>
</div>



</div>
<div class="login-08_"><img id="login_08"
	src="themes/default/images/login_08.jpg" width="117" height="110" alt="" /></div>
<div class="login-09_"><img id="login_09"
	src="themes/default/images/login_09.jpg" width="58" height="163" alt="" /></div>
<div class="login-10_"><img id="login_10"
	src="themes/default/images/login_10.jpg" width="354" height="163" alt="" /></div>
<div class="login-11_"><img id="login_11"
	src="themes/default/images/login_11.jpg" width="117" height="163" alt="" /></div>
<div class="login-12_"><img id="login_12"
	src="themes/default/images/login_12.jpg" width="251" height="184" alt="" /></div>
<div class="login-13_"><img id="login_13"
	src="themes/default/images/login_13.jpg" width="161" height="184" alt="" /></div>
<div class="login-14_"><img id="login_14"
	src="themes/default/images/login_14.jpg" width="474" height="184" alt="" /></div>
<div class="login-15_"><img id="login_15"
	src="themes/default/images/login_15.jpg" width="117" height="184" alt="" /></div>
</div>
</body>
<script type="text/javascript">
var errorFlag = 'null';
if (errorFlag == 'error') {
	logininfo.style.display = "";
}
var errorFlag = 'null';
if (errorFlag == 'text') {
	logininfo1.style.display = "";
}
</script>
</html>