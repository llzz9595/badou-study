<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中国电信辽宁分公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/pub/head.inc"%>
<script>
window.name = "flowPasteEffect";
function ev_confirm() {
	var fm = document.form1;
	if(CheckForm(fm)){
		fm.action = "${ROOT}/pasteToEffectFlow.do1";
		fm.target = "flowPasteEffect";
		fm.submit();
	}
}
</script>
</head>
	<body>
      <form id="form1" name="form1" method="post" action="" onsubmit="">		
      <input type="hidden" name="flowIds" value="${flowIds}"/>
		<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  			<tr><td><h2>流程引用选择</h2></td></tr>
   			<tr>
      			<td class="list-caozuo">
      				<a href="#" onclick="ev_confirm();return false;">确定</a>&nbsp;&nbsp;|&nbsp;&nbsp;
      				<a href="#" onclick="window.close();return false;">关闭</a>&nbsp;&nbsp;
      			</td>
      		</tr>
      	</table>
 		<table cellspacing="0" cellpadding="0" border="0" class="list-top">
       <tr>
       	<td align="left">目标业务类型
       	</td>
       	<td align="left">
       	<select name="busiId" >
		  <logic:iterate id="busi" name="busis" indexId="index">
			  <option value="${busi.id}">${busi.busiName}</option>
		  </logic:iterate>
		</select>   
       	</td>
       	</tr>
       	<tr>
       	<td align="left">目标组织</td>
        <td align="left">
       	<input type="text" name="orgName" value="" size="30" readonly="readonly" check="notBlank;" required="true" showName="目标组织"/>
       	<input type="hidden" name="orgText" value=""/>
       	<a href="#" class="choose" onclick="getAddressList('0','n','0','orgName','orgText');return false;" title="选择组织">选择</a></td>
       	</tr>
      </table>
    </form>
	</body>
</html>
