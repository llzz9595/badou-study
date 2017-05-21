<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<title>菜单管理</title>
<script language="javascript" type="text/JavaScript">
<!--
function ev_save(flag){
	var resourceId = '${resource.id }';
	if(!CheckForm(form1))
		return;
	if(resourceId==""){
		form1.action = "${ROOT}/createResource.do1?flag=0";
		form1.submit();
	}else{
		form1.action = "${ROOT}/updateResource.do1?flag=0";
		form1.submit();
	}	
}

var count = 0;

function ev_deleteRow(rowIndex){
	var childList = document.getElementById("childList");
	childList.deleteRow(rowIndex);
	count--;
	document.getElementById("form1").count.value = count;
}


function ev_addRow(){
	var childList = document.getElementById("childList");
	var newRow = childList.insertRow(-1);
	newRow.id = "child_"+count;
	var newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"code" +count+ "\" value=\"\" showName=\"功能编号\" check=\"notBlank\" class=\"listinput\" required=\"true\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"name" +count+ "\" value=\"\" showName=\"功能名称\" check=\"notBlank\" class=\"listinput\" required=\"true\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"url" +count+ "\" value=\"\" size=\"40\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"button\" value=\"删除\" class=\"button2\" onclick=\"ev_deleteRow(" +count+ ");\" />";
	count++;
	document.getElementById("form1").count.value = count;
}

function ev_TargetWin(selectDOM){
	var v = selectDOM.value;
	var span = document.getElementById("targetWindow");
	if(v!='parent' && v!='top' && v!='new'){
		span.style.display = 'block';
	}else{
		span.style.display = 'none';
	}
}
		function ev_back(){
			var url = "${ROOT}/listResource.do1?parentResourceId=${parentResourceId }";
			pageBack2List();
		}
//-->
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>菜单编辑</h2></td></tr>
  <Tr><td class="list-caozuo">
    <a id="hlinkAddNew" href="#" onclick="ev_save();return false;">保存</a>&nbsp;&nbsp;|&nbsp;&nbsp;
  	
    <a id="hlinkAddNew" href="#" onclick="ev_back();return false;">返回</a>
	
    </td></Tr>
</table>
	<form id="form1" name="form1" method="post" action="">
	  <input type="hidden" name="logLevelId" value="1"/>
	  <input type="hidden" name="parentResourceId" value="${parentResourceId }"/>
	  <input type="hidden" name="id" value="${resource.id }"/>
	  <div>红星（<font color="red">*</font>）是必填</div>
      <table class="formtext" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td class="t" width="30%"><font color="red">*</font>功能编号：</td>
          <td width="70%"><input name="code" value="${resource.code }" showName="功能编号" check="notBlank;isString('#',15)" class="listinput" required="true" maxlength="15"/></td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>功能名称：</td>
          <td><input name="name" value="${resource.name }" showName="功能名称" check="notBlank" class="listinput" required="true" maxlength="100"/></td>
        </tr>
        <tr>
          <td class="t">大图标：</td>
          <td><input name="bigIconPath" value="${resource.bigIconPath }" size="50" maxlength="100"/></td>
        </tr>
        <tr>
          <td class="t">小图标：</td>
          <td><input name="smallIconPath" value="${resource.smallIconPath }" size="50" maxlength="100"/></td>
        </tr>
        <tr>
          <td class="t">排序号：</td>
          <td><input name="priority" value="${resource.priority}"  /></td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>目标窗体：</td>
          <td>
          	<select name="openTargetWindow" onchange="ev_TargetWin(this);">
          		<option value="parent" ${resource.openTargetWindow=='parent' ? 'selected' : ''}>父窗体</option>
          		<option value="top" ${resource.openTargetWindow=='top' ? 'selected' : ''}>顶级窗体</option>
          		<option value="new" ${resource.openTargetWindow=='new' ? 'selected' : ''}>新窗体</option>
          		<option value="" ${fn:contains('parent,top,new',resource.openTargetWindow) ? '' : 'selected'}>自定义</option>
          	</select>
          	<span id="targetWindow" style="display:${fn:contains('parent,top,new',resource.openTargetWindow) ? 'none' : 'block'};">
          	<input type="text" size="15" name="openTargetWindowName" value="${resource.openTargetWindow}"/></span>
          </td>
        </tr>
        <tr>
          <td class="t">URL：</td>
          <td><textarea name="url" cols="50" rows="6" showName="URL" check="isString('#',250)"  required="nullable">${resource.url }</textarea></td>
        </tr>
	 </table>
	</form>
</body>
</html:html>
