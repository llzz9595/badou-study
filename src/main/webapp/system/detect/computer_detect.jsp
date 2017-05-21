<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务器监控</title>
<sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body style="font-size:12px;">
	<s:url id="jvmUrl" action="jvm" method="show" />
	<s:url id="cpuUrl" action="cpu" method="show" />
	<s:url id="memUrl" action="mem" method="show" />
	<sj:tabbedpanel id="tab_detect" selectedTab="0" >
		<sj:tab id="jvmDetect" href="%{jvmUrl}" label="JVM监控"></sj:tab>
		<sj:tab id="cpuDetect" href="%{cpuUrl}" label="CPU监控"></sj:tab>
		<sj:tab id="memDetect" href="%{memUrl}" label="MEM监控"></sj:tab>
	</sj:tabbedpanel>
</body>
</html>