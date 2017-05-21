<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务器监控</title>
<sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body style="font-size:12px;">
	<center><div style="height:200px;">图片(未开放)</div></center>
	<div>
		<table>
			<tr>
				<td width="20%">内存总量</td>
				<td width="20%"><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="totalMem"/></td>
				<td width="*">Java虚拟机中的内存总量(java虚拟机现在已经从操作系统那里挖过来的内存大小)</td>
			</tr>
			<tr>
				<td>最大内存量</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="maxMem"/></td>
				<td>Java虚拟机使用的最大内存量(java虚拟机[进程]能够从操作系统那里挖到的最大的内存)</td>
			</tr>
			<tr>
				<td>已使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="UsedMem"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percUsed" type="percent"/>)</td>
				<td>已使用内存占内存总量百分比</td>
			</tr>
			<tr>
				<td>未使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="freeMem"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percFree" type="percent"/>)
				</td>
				<td>未已使用内存占内存总量百分比</td>
			</tr>
		</table>
	</div>
</body>
</html>