<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<%@ include file="/pub/head.inc"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<title>接口详情</title>
		<style type="text/css">

</style>
	</head>
	<body style="padding-bottom: 31px;">

		<!-- 明细与列表在同一个页面 -->
		<div id="detailCost" style="">

			<form id="formdetail" name="formdetail" method="post" class="l-form">

				<div class="l-group l-group-hasicon">
					<img src="${baseURL}/themes/default/icons/32X32/communication.gif" />
					<span>新增接口</span>
				</div>
				<table style="table-layout: fixed;width: 1000px;">
					<tr height="30">
					
					<td align="right" width="120">
							接口名称：
						</td>
						<td>
							<input type="text" inputwidth="220" ltype="text"
								name="SDdetail_name" id="SDdetail_name"
								value="${apiForm.name}"
								validate="{minlength:1,maxlength:50}" />
						</td>
					
						<td align="right" width="255">
							<span style="color: red">*</span>&nbsp;接口状态：
						</td>
						<td>
							<input type="text" inputwidth="220" name="SDdetail_type"
								id="SDdetail_type" validate="{required:true}"/>
						</td>
						<td align="right">
					</tr>

					<tr height="30">
						<td align="right" width="120" height="30">
							<span style="color: red">*</span>&nbsp;消息代码：
						</td>

						<td colspan="4">
							<input type="text" inputwidth="632" ltype="text"
								name="SDdetail_msgCode" id="SDdetail_news"
								value="${apiForm.msgCode}"
								validate="{required:true,minlength:1,maxlength:100}" />
						</td>
						<td width="30" align="left">

						</td>
					</tr>
					
					<tr height="30">
						<td align="right" width="120" height="30">
							<span style="color: red">*</span>&nbsp;接口路径：
						</td>

						<td colspan="4">
							<input type="text" inputwidth="632" ltype="text"
								name="SDdetail_url" id="SDdetail_url"
								value="${apiForm.url}"
								validate="{required:true,minlength:1,maxlength:100}" />
						</td>
						<td width="30" align="left">

						</td>
					</tr>
					
				</table>

				<input type="hidden" name="id" value="${apiForm.id}" />
				
					
			</form>
		</div>
		<script type="text/javascript">

		$("#SDdetail_type").ligerComboBox({data: ${apiType},selectBoxWidth:200});
		
		if(${apiForm != null && apiForm.id != null}){
			$("#SDdetail_type").ligerComboBox().selectValue("${apiForm.type}");
		};
		
		var formdetail = $("#formdetail");
		LG.setFormDefaultBtn(FF_Cancel, FF_Save);
		//表单底部按钮 
		//表单应用likui样式
		
		function FF_Save() {
			var win = parent || window;
			formdetail.attr("action","${baseURL}/openapi/apisave/save.do");
			LG.submitForm(formdetail, function(data) {
				if (data && data.hasOk) {
					alert('操作成功!');
					win.LG.closeAndReloadParent("iieatActionEdit", "${param.menuId}");
					win.LG.closeCurrentTab("iieatActionEdit");
				} else {
					alert("操作失败!失败信息如下:\n" + data.message + "\n如您对以上信息有疑问，请联系管理人员!");
				}
			});
		}
		
		function FF_Cancel() {
			var win = parent || window;
			win.LG.closeCurrentTab("iieatActionEdit");
		}
		
		jQuery.metadata.setType("attr", "validate");
		LG.validate(formdetail);
		formdetail.ligerForm();

</script>
	</body>
</html>
