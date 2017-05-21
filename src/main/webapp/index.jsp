<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<title>${basePageTitle}</title>
</head>
<frameset frameborder="0" border="0" framespacing="0" rows="78,*,28">
<frame src="${baseURL}/frame/index/top.do?framesetCode=headFrame&name=头部" name="headFrame" 
	id="headFrame" scrolling="NO" noresize  frameborder="0" marginwidth="0" marginheight="0" />
<frame src="${baseURL}/frame/index/content.do?framesetCode=contentFrame&name=内容" name="contentFrame" 
	id="contentFrame" scrolling="NO" noresize  frameborder="0" marginwidth="0" marginheight="0" />
<frame src="${baseURL}/frame/index/bottom.do?framesetCode=bottomFrame&name=底部" name="bottomFrame" 
	id="bottomFrame" scrolling="NO" noresize  frameborder="0" marginwidth="0" marginheight="0" />
</frameset>
<noframes>
<body>
</body></noframes>
</html>

