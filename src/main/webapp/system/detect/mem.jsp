<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MEM监控</title>
<sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body style="font-size:12px;">
	<center><div style="height:200px;">图片(未开放)</div></center>
	<div>
		<table>
			<tr>
				<td width="20%">内存总量(M)</td>
				<td width="20%"><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="total"/></td>
				<td width="*"></td>
			</tr>
			<tr>
				<td>已使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="used"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percUsed" type="percent"/>)</td>
				<td></td>
			</tr>
			<tr>
				<td>未使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="free"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percFree" type="percent"/>)
				</td>
				<td></td>
			</tr>
			<tr>
				<td>实际已使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="actualUsed"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percActualUsed" type="percent"/>)</td>
				<td></td>
			</tr>
			<tr>
				<td>实际未使用内存大小(M)</td>
				<td><s:number maximumFractionDigits="2" minimumFractionDigits="2" name="actualFree"/>
				(<s:number maximumFractionDigits="2" minimumFractionDigits="2" name="percActualFree" type="percent"/>)
				</td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>