<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/pub/head.inc"%>
<html>
  <head>
  	<title>员工导入导出</title>
  	<script  type="text/javascript">
	$(function() {
		//关闭按钮
		$("#btnClose").click(function(){
			window.close();
		});
		//确定按钮
		$("#btnConfirm").click(function(){
			var opType = $("input:checked").val();
			if(opType == '1'){//导出员工
				form1.target = "targetFrame";
				form1.action = "${ROOT}/exportUser.do1?orgId=${org.id}";
				form1.submit();
			}else if(opType == '2'){//导出员工新增模板
				form1.target = "targetFrame";
				form1.action = "${ROOT}/exportAddUserTemplate.do1?orgId=${org.id}";
				form1.submit();
			}else if(opType == '3'){//导出员工修改模板
				form1.target = "targetFrame";
				form1.action = "${ROOT}/exportModifyUserTemplate.do1?orgId=${org.id}";
				form1.submit();
			}else if(opType == '4'){//新增浏览文件框是否为空
				if($("#excelAddFile").val()==''){
					alert("请选择需要导入的文件!");
					return false;
				}
				$.openWindow({url:"${ROOT}/web/system/user/user_export_import_temp.jsp",name:"importUserWin"});
				form1.target = "importUserWin";
				form1.action = "${ROOT}/importAddUserTip.do1?orgId=${org.id}";
				form1.submit();
			}else if(opType == '5'){
				if($("#excelModifyFile").val()==''){
					alert("请选择需要导入的文件!");
					return false;
				}
				$.openWindow({url:"${ROOT}/web/system/user/user_export_import_temp.jsp",name:"importUserWin"});
				form1.target = "importUserWin";
				form1.action = "${ROOT}/importModifyUserTip.do1?orgId=${org.id}";
				form1.submit();
			}
		});
		/*
		$("input[type='radio']").click(function(){
			var opType = $(this).val();
			if(opType == '1' || opType == '2' || opType == '3'){
				$("#explorerFile").hide();
			}else{
				$("#explorerFile").show();
			}
		});
		$("#explorerFile").hide();*/
	});
  	</script>
  </head>
  
<body class="LN_body">
<form name="form1" method="post" action="${ROOT}" id="form1" enctype="multipart/form-data" target="targetFrame">	
<input type="hidden" name="orgId" id="orgId" value="${org.id}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" id="btnClose" >关闭</a></div>
<div class="LN_popupsRouteSubmit"><a href="#" id="btnConfirm">确定</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工导入导出选项</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td class="LN_tableBoxText">
        		<input type="radio" name="opType" value="1" checked/>导出当前组织[${org.name}]下所有员工
		</td>
      </tr>
     <tr>
        <td  class="LN_tableBoxText">
        		<input type="radio" name="opType" value="2" />导出员工新增模板
		</td>
      </tr>
<tr>
        <td  class="LN_tableBoxText">
        		<input type="radio" name="opType" value="3" />导出员工修改模板
		</td>
      </tr>
<tr>
        <td class="LN_tableBoxText">
        		<input type="radio" name="opType" value="4" />新增员工导入
        		<input accept="application/msExcel" type="file" id="excelAddFile" name="excelAddFile" size="40"/>
		</td>
      </tr>
<tr>
        <td class="LN_tableBoxText">
        		<input type="radio" name="opType" value="5" />修改员工导入
        		<input accept="application/msExcel" type="file" id="excelModifyFile" name="excelModifyFile" size="40"/>
		</td>
      </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
<iframe name="targetFrame" id="targetFrame" src="javascript:false" width="0" height="0"></iframe>
</body>
</html>