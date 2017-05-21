<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<%@ include file="/web/pub/head.inc"%> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<title>部门信息</title>
	<script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>
	<script type="text/javascript" src="${ROOT}/web/system/dlg/dateselector.js"></script>
	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/saveOrg.do1";
			if(CheckForm(form)){
				//pageShield();
				form.submit();
			}	
		}
		
		
		/**
		*返回列表
		*/
		function ev_back(){
			var url = "${ROOT}/listOrg.do1?id=${org.org.id }";
			window.location.href = url;
		}
		
		function checkSelect(p){
			if(p.value=""||String(p.value)<=0){
				alert("请选择组织类型");
				return false;
			}
			return true;
		}
		
		function ev_editOrgDuty() {
			var form = $_E("form");
			form.action = "${ROOT}/editOrgDuty.do1";
			form.submit();
		}
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<form id="form" name="form" method="post" action="">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>组织信息</h2></td></tr>
  <Tr><td class="list-caozuo">
  	<a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
  	<a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
	<%--<a  href="javascript:ev_history('${org.id  }');">历史版本信息</a>
    --%><%--|
    <a id="hlinkAddNew" href="javascript:ev_save();">保存后关闭</a>
  --%></td></Tr>
</table>
    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td align="right" class="t"><font color="red">*</font>名称</td>
        <td>
        <input name="id" id="id" type="hidden" value="${org.id }"/>
        <input name="name" type="text" class="editline" value="${org.name }"  check="notBlank;isString('#',50)" required="true" showName="名称"/>
        </td>
        <td align="right" class="t"><font color="red">*</font>排序码</td>
        <td><input name="priority" type="text" class="editline" value="${org.priority }"  check="notBlank;isInt();" required="true" showName="排序码"/></td>
        </tr>
	  
      <tr>
	        <td class="t" align="right"><font color="red">*</font>上级部门</td>
        <td>
        	<input type="hidden" name="parentInfo" value="${parentInfo }"  />
			<input name="parentName" type="text"  class="editline" readonly="readonly" value="${org.org.name }"/>&nbsp;
			</td>
	        <td class="t" align="right"><font color="red">*</font>组织编号</td>
	        <td><input name="code" type="text"  class="editline"  value="${org.code }" check="notBlank;isString('#',32);" required="true" showName="组织编号"/></td>
       </tr>
		
      <tr>
      	<td class="t">部门负责人</td>
      	<td >
      		<input type="hidden" name="satrapInfo" id="satrapInfo" value="${satrapInfo }"/>
			<input name="satrapName" id="satrapName" type="text" class="editline" readonly="readonly" value="${org.satrapName }"/>&nbsp;
			<a href="#" onclick="getAddressList('20','1','0','satrapName','satrapInfo');" class="choose">选择</a>
     	</td>
     	<td class="t">部门类型</td>
      	<td>
      		<kpi:dictionary-select  name='uniformIntType' type='ORG_UNIFORM_TYPE'  selected="${org.uniformIntType}"/>
     	</td>
      </tr>
       <tr>
     	<td class="t">传真</td>
      	<td  colspan="3">
			<input name="fax" type="text"  class="editline" size="50"  value="${org.fax}"/></td>
      	</td>
      </tr>
 	 <tr>
      	  <td class="t">电话</td>
      	<td colspan="3">
			<input name="telphone" type="text"  class="editline" size="50" value="${org.telphone}"/></td>
      	</td>
      </tr>
      <tr>
        <td class="t">地址</td>
      	<td  colspan="3">
			<input name="address" type="text"  class="editline" size="80" value="${org.address}"/></td>
      	</td>
      </tr>
      <tr>
        <td class="t" align="right">备注</td>
        <td width="*" colspan="3"><textarea name="remark" rows="4" cols="60"  check="isString('#',500);" required="true" showName="备注">${org.remark }</textarea></td>
      </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>
