<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>八斗技术框架后台管理</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="description" content="User login page" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<script  type="text/javascript" src="themes/plugin/ligerUI/lib/jquery/jquery-1.8.3.min.js"></script>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="ace/css/bootstrap.min.css" />
<link rel="stylesheet" href="ace/css/font-awesome.min.css" />

<!-- text fonts -->
<link rel="stylesheet" href="ace/css/css?family=Open+Sans:400,300" />

<!-- ace styles -->
<link rel="stylesheet" href="ace/css/ace.min.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="ace/css/ace-part2.min.css" />
		<![endif]-->
<link rel="stylesheet" href="ace/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="ace/css/ace-ie.min.css" />
		<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="ace/js/html5shiv.js"></script>
		<script src="ace/js/respond.min.js"></script>
		<![endif]-->
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="ace-icon fa fa-leaf green"></i> <span class="red">Tourist Helper</span>
								<span class="white" id="id-text2">App</span>
							</h1>
							<h4 class="blue" id="id-company-text">&copy; </h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h3 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i>
											<%-- <s:text name="login.learningManagementSystem"></s:text> --%>
											八斗技术框架后台管理
										</h3>

										<div class="space-6"></div>

										<form id="loginFormId" action="<%=contextPath%>/login.do1"
											method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="用户名"
														id="username" name="username"
														onkeypress="keyBorder(event);" /> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control"
														placeholder="密码" id="password" name="password"
														onclick="sumbit()" onkeypress="keyBorder(event);" /> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"><!--  <input type="checkbox"
														class="ace" />  --><span class="lbl"><div class="controls">
												<!-- <select id="select_language">
													<option value="english">english</option>
													<option value="china">china</option>
												</select> -->
											</div><!-- Remember Me --></span>
													</label>

													<button type="button" id="go"
														class="width-35 pull-right btn btn-sm btn-primary"
														value="" onclick="checkdata();"
														onkeypress="keyBorder(event);">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<!-- <a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> I forgot my password
											</a> -->
										</div>
										<div class="control-group">
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>Enter your email and to receive instructions</p>

										<form id="sendEmail"
										action="<%=contextPath%>/login/studentfindpassword/findPassword.do">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" name="email" id="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<input type="submit"
														class="width-35 pull-right btn btn-sm btn-danger"
														value="Send Me!"/>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> Back to login <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> New User
											Registration
										</h4>

										<div class="space-6"></div>
										<p>Enter your details to begin:</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="Username" />
														<i class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control"
														placeholder="Password" /> <i class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control"
														placeholder="Repeat password" /> <i
														class="ace-icon fa fa-retweet"></i>
												</span>
												</label> <label class="block"> <input type="checkbox"
													class="ace" /> <span class="lbl"> I accept the <a
														href="#">User Agreement</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">Reset</span>
													</button>

													<button type="button"
														class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">Register</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> Back to login
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->

						<div class="navbar-fixed-top align-right">
							<br /> &nbsp; <a id="btn-login-light" href="#">Light</a> &nbsp;
							<span class="blue">/</span> &nbsp; <a id="btn-login-blur"
								href="#">Blur</a> &nbsp; <span class="blue">/</span> &nbsp; <a
								id="btn-login-dark" href="#">Dark</a> &nbsp; &nbsp; &nbsp;
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="ace/js/jquery.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="ace/iejs/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
			window.jQuery || document.write("<script src='ace/js/jquery.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='ace/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='ace/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
jQuery(function($) {
	$("#select_language").change(function(){
		var checkValue=$("#select_language").val();
		if(checkValue != "select language"){
			$
			.ajax({  /* 說明：這裡修改語言成功後是回調的是error函數。 */
				type : "post",
				url : "<%=contextPath %>"
						+ "/languageselect/languageselect/selectLanguge.do?language="
						+ checkValue,
				success : function() {
					window.location.reload();//刷新当前页面.
				},
				error : function() {
					window.location.reload();//刷新当前页面.
				}
			});
		}
			
	});
});
	jQuery(function($) {
	 $(document).on('click', '.toolbar a[data-target]', function(e) {
		e.preventDefault();
		var target = $(this).data('target');
		$('.widget-box.visible').removeClass('visible');//hide others
		$(target).addClass('visible');//show target
	 });
	});
	
	
	
	jQuery(function($) {
	 $('#btn-login-dark').on('click', function(e) {
		$('body').attr('class', 'login-layout');
		$('#id-text2').attr('class', 'white');
		$('#id-company-text').attr('class', 'blue');
		
		e.preventDefault();
	 });
	 $('#btn-login-light').on('click', function(e) {
		$('body').attr('class', 'login-layout light-login');
		$('#id-text2').attr('class', 'grey');
		$('#id-company-text').attr('class', 'blue');
		
		e.preventDefault();
	 });
	 $('#btn-login-blur').on('click', function(e) {
		$('body').attr('class', 'login-layout blur-login');
		$('#id-text2').attr('class', 'white');
		$('#id-company-text').attr('class', 'light-blue');
		
		e.preventDefault();
	 });
	 
	});
</script>
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

<script type="text/javascript">
	/*登录验证*/
	function checkdata() {
		var name = document.getElementById('username').value;
		var pass = document.getElementById('password').value;
		if (name.trim() == "") {
			alert("请输入用户名！");
			return;
		}
		if (pass.trim() == "") {
			alert("请输入密码！");
			return;
		}

		if (name != "" && pass != "") {
			var Regx = /^[A-Za-z0-9]*$/;
			if (Regx.test(name)) {
				var formObj = document.getElementById("loginFormId");
				formObj.submit();
			} else {
				//	alert("用户名只能包含[A-Z],[a-z],[0-9]中的字符");
				var formObj = document.getElementById("loginFormId");
				formObj.submit();
			}
		}

	}
	String.prototype.trim = function() {
		return this.replace(/(^\s+)|\s+$/g, "");
	}

	function keyBorder(event) {

		//alert(event == window.event); 
		if (event.keyCode == 13) { // 13表示回车键
			document.getElementById('go').click();
		}
	}

	function openDia() {
		var heightconst = 400;
		var widthconst = 600;
		var leftconst = (screen.availWidth - widthconst) / 2;
		var topconst = (screen.availHeight - heightconst) / 2;
		wZoom = "dialogLeft:" + leftconst + "px;dialogTop:" + topconst
				+ "px;dialogHeight:" + heightconst + "px;dialogWidth:"
				+ widthconst + "px; center: no; help: no;status:no";
		window.showModalDialog("/pms/kpUser/getPassword.do", window.document,
				wZoom);

	}
</script>
</html>