<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>${basePageTitle}</title>
<style type="text/css">
.l-topmenu-welcome {
	position: absolute;
	height: 24px;
/* 	width:300px; */
	line-height: 300px;
	right: 5px;
	top: 2px;
	color: #070A0C;
	float:right;
}
</style>
</head>
<body>
	<!-- TOP!!! -->
	<div id="topmenu" class="l-topmenu">
		<div class="l-topmenu-logo">
			<div class="hd-logo">&nbsp;</div>

			<div class="l-topmenu-welcome">
				<div class="l-menu-item" style="width:340px;float:right">
					<span class="l-topmenu-username"> </span>
					<div style="float:right;right: 10px;position: absolute">
						欢迎您， ${currentUser.name} &nbsp;
					    [ <a class="password" href="#">修改密码</a> ] &nbsp; 
					    [ <a class="logout" href="#">注销</a> ]</div><br /> 
					<div style="float:right;right: 10px;position: absolute">
						&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
						&nbsp; &nbsp;&nbsp; 
				</div>
				<!-- <div class="l-notice">
					<div id="scrollDiv" class="l-notice-bg"></div>
					<div class="l-notice-more"><a class="notice_more" href="#">[更多]</a></div>
				</div> -->

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("input[name='language']")
					.click(
							function() {
								var language = $(this).val();
								$
										.ajax({  /* 說明：這裡修改語言成功後是回調的是error函數。 */
											type : "post",
											url : baseURL
													+ "/languageselect/languageselect/selectLanguge.do?language="
													+ language,
											success : function() {
												window.location.reload();//刷新当前页面.
												parent.location.reload();//刷新父亲对象（用于框架）
												opener.location.reload();//刷新父窗口对象（用于单开窗口）
												top.location.reload();//刷新最顶端对象（用于多开窗口）
											},
											error : function() {
												window.location.reload();//刷新当前页面.
												parent.location.reload();//刷新父亲对象（用于框架）
												opener.location.reload();//刷新父窗口对象（用于单开窗口）
												top.location.reload();//刷新最顶端对象（用于多开窗口）
											}
										});
							});
		});
		$(function() {
			//弹出修改密码弹出框
			$(".password")
					.click(
							function() {
								//弹出一个对话框，可重新输入新密码
								var userId = "1";
								window
										.showModalDialog(
												'${baseURL}/updatePassword.jsp',
												userId,
												"dialogHeight=300px;dialogWidth=450px;");
								return false;
							});
			//退出注销当前用户
			$(".logout").click(function() {
				if (confirm("您确定要注销当前用户吗?")) {
					top.location.href = "${baseURL}/logout.do1";
				}
				return false;
			});
			$(".notice_more")
					.click(
							function() {
								window
										.showModalDialog(
												'${baseURL}/comminfo/comminfolist/comminfoList.do?scopeStates=list&update=false',
												document,
												"dialogHeight=400px;dialogWidth=800px;");
							});
			//查看是否是销售人员如果是就显示中文英文添加订单的按钮
			$(".neworder")
					.click(
							function(e) {
								var tid = $(this).attr("name");
								$
										.openWindow({
											url : "${baseURL}/order/ordernew/edit.do?code=China&"
													+ Math.random()
										});
							});
			$(".neworder").find("img:first").mouseleave(
					function() {
						$(this).attr("src",
								baseURL + "/images/order/neworder_press.png");
					}).mouseover(function(e) {
				$(this).attr("src", baseURL + "/images/order/new_order.png");
			});

		});
		var noticeTimeout;
		var scrollTimeout;
		function autoScroll() {
			$("#scrollDiv").find("ul:first").animate({
				marginTop : "-20px"
			}, 500, function() {
				$(this).css({
					marginTop : "0px"
				}).find("li:first").appendTo(this);
			});
		}

		function refresh() {
			$.ajax({
				type : "post",
				url : "${baseURL}/comminfo/comminfoscope/scopeList.do?"
						+ Math.random(),
				dataType : "json",
				success : function(msg) {
					if (msg) {
						if (scrollTimeout)
							clearInterval(scrollTimeout);
						$("#scrollDiv").find("ul").remove();
						var html = "<ul>";
						for (var i = 0; i < msg.length; i++) {
							html += "<li><a href='#' onclick=loads('"
									+ msg[i].id + "') >" + msg[i].title + "("
									+ msg[i].createTime + ")" + "</a></li>";
						}
						html += "</ul>";
						$("#scrollDiv").append(html);
						scrollTimeout = setInterval("autoScroll()", 6000);
					}
				}
			});
		}
		//by czb --去掉公告
		//noticeTimeout = setInterval("refresh()", 1800000);
		//refresh();
		function loads(id) {
			window.showModalDialog(
					'${baseURL}/comminfo/comminfoedit/show.do?id=' + id,
					document, "dialogHeight=400px;dialogWidth=600px;");
		}
		
	</script>
</body>
</html>

