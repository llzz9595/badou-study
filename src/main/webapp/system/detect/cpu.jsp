<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务器CPU监控</title>
<sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body style="font-size:12px;">
	<center><div style="height:200px;">图片(未开放)</div></center>
	<div>
		<table>
			<tr>
				<td width="20%">CPU个数</td>
				<td width="20%"><s:number maximumFractionDigits="0" minimumFractionDigits="0" name="cpuCount"/></td>
				<td width="*"></td>
			</tr>
			<tr>
				<td>总的用户使用率</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="userUsed" type="percent"/></td>
				<td></td>
			</tr>
			<tr>
				<td>总的系统使用率</td>
				<td>
				<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="sysUsed" type="percent"/></td>
				<td></td>
			</tr>
			<tr>
				<td>总的使用率</td>
				<td>
				<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="combinedUsed" type="percent"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>总的等待率</td>
				<td>
				<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="waitUsed" type="percent"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>总的空闲率</td>
				<td>
				<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="idleUsed" type="percent"/>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
	<hr width="100%"/>
	<div>
		<s:iterator id="o" value="cpus">
		<div style="width:40%;float:left;">波形图(<s:property value="#o.cpuId" />)</div>
				<div style="width:50%;">
				用户使用率:<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="#o.userUsed" type="percent"/><br/>
				系统使用率:<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="#o.sysUsed" type="percent"/><br/>
				使用率:<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="#o.combinedUsed" type="percent"/><br/>
				等待率:<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="#o.waitUsed" type="percent"/><br/>
				空闲率:<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="#o.idleUsed" type="percent"/><br/>
				 </div>
		<hr width="70%"/>
		</s:iterator>
	</div>
</body>
</html>