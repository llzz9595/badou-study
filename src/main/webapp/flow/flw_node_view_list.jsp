<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>������ʾ��ʽ</title>
	</head>
<script type="text/javascript">
var obj = window.dialogArguments;
var defaultView = obj.defaultView;
function initChecked(){
if(defaultView==undefined) return;
var allcheck=document.getElementsByName("tempCheck");
  for(i=0;i<allcheck.length;i++){
  var tempValue = allcheck[i].value;
  if(defaultView==tempValue.split(":")[1]) allcheck[i].checked = true;
  }
}

function selectTemplet(){
var allcheck=document.getElementsByName("tempCheck");
var selectedV="";
  for(i=0;i<allcheck.length;i++){
	  if(allcheck[i].checked==true){
		  if(selectedV==""){
		    selectedV=allcheck[i].value;
		  }else {
			selectedV = selectedV+";"+allcheck[i].value;
		  }
	  }
  }
  window.returnValue = selectedV;
  window.close();
  }
window.onload=function(){
	initChecked();
}
</script>
<html:base target="_self"/>
	<body class="list_body">
	<br><div align="center"><font size="+1">������ʾ��ʽ</font></div><br>
		<form id="form1" name="form1" method="post" action="">
			<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
				<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
						<td width="50%" align="left" height="22">
							����							
						</td>
						<td width="50%" align="left" height="22">
							˵��
						</td>
					</tr>
				<logic:notEmpty name="viewList">
				<logic:iterate id="vd" name="viewList" indexId="index">
				<label for="radio_${index }">
					<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
						<%--<td width="50%" align="left" height="22">
							<input type="radio" name="tempCheck" id="radio_${index }" value="<bean:write name="vd" property="name"/>:<bean:write name="vd" property="viewUrl"/>:<bean:write name="vd" property="spreadUrl"/>:<bean:write name="vd" property="doneUrl"/>" />
							&nbsp;<a title="<bean:write name="vd" property="viewUrl" />"><label for="radio_${index }"><bean:write name="vd" property="name" /></label></a></td>
						--%>
						<td width="50%" align="left" height="22">
							<input type="radio" name="tempCheck" id="radio_${index }" value="<bean:write name="vd" property="name"/>:<bean:write name="vd" property="id"/>" />
							&nbsp;<a title="<bean:write name="vd" property="viewUrl" />"><label for="radio_${index }"><bean:write name="vd" property="name" /></label></a>
						</td>
						<td width="50%" align="left" height="22">
							${vd.remark }&nbsp;
						</td>
					</tr>
				</label>
				</logic:iterate>

				</logic:notEmpty>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="Submit" value="�ύ" onclick="selectTemplet()" class="button"/>
						<input type="button" name="Submit2" value="�ر�" onclick="window.close();" class="button"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
