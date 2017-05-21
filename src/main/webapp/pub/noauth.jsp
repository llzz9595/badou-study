<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<% 
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<!-- exception.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>程序运行错误</title>
</head>
<body>

	<table>
   		<tr>
   			<td>没有权限.谢谢!</td>
   		</tr>
   		<tr>
   			<td>管理员QQ:	</td>
   		</tr>
   		<tr>
   			<td>管理员主页:</td>
   		</tr>
   		<tr>
   			<td>管理员邮箱:</td>
   		</tr>
   		<tr>
   			<td>
   				<div style="display:none;">
			  		异常对象本身: 
			  		<s:property value="exception.message"/>
			  		输出异常堆栈信息:
			       	<s:property value="exceptionStack"/>
			    </div>
   			</td>
   		</tr>
   	</table>
	
</body>
</html>
