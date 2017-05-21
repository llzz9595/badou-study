<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<%@ include file="/pub/head.inc"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<title>APK版本管理</title>
		<style type="text/css">
.l-button1 {
	background: url("../images/controls/button-bg.gif") repeat-x scroll
		center center #E0EDFF;
	border: 1px solid #A3C0E8;
	color: #2C4D79;
	cursor: pointer;
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	text-align: center;
	text-decoration: none;
	width: 50px;
	margin-left: 10px;
}

.l-button1-over,.l-button1:hover {
	background: url("../images/controls/button-bg-over.gif") repeat-x scroll
		center center #FFBE76;
	border-color: #D6A886;
}
</style>
	</head>
	<body style="padding-bottom: 31px;">

		<!-- 明细与列表在同一个页面 -->
		<div id="detailCost" style="">

			<form id="formdetail" name="formdetail" method="post" class="l-form">

				<div class="l-group l-group-hasicon">
					<img src="${baseURL}/themes/default/icons/32X32/communication.gif" />
					<span>新增版本</span>
				</div>
				<table>
					
					<tr height="30">
						<td align="right" width="120">
							<span style="color: red">*</span>&nbsp;版本号：
						</td>
						<td>
							<input type="text" inputwidth="220" name="SDdetail_versionNum"
								id="SDdetail_versionNum" value="${apkVersionForm.versionNum}"
								validate="{required:true,minlength:1,maxlength:50}" />
						</td>

						<td align="right" width="190">
							版本名称：
						</td>

						<td>
							<input type="text" inputwidth="220" ltype="text"
								name="SDdetail_versionName" id="SDdetail_versionName"
								value="${apkVersionForm.versionName}"
								validate="{minlength:1,maxlength:50}" />
						</td>
					</tr>

					

					<tr height="30">
						<td align="right" width="120" height="30">
							<span style="color: red">*</span>&nbsp;描述：
						</td>

						<td colspan="3">
							<input type="text" inputwidth="632" ltype="text"
								name="SDdetail_versionDescription" id="SDdetail_versionDescription"
								value="${apkVersionForm.versionDescription}"
								validate="{required:true,minlength:1,maxlength:100}" />
						</td>
						<td width="30" align="left">

						</td>
					</tr>
					
					<tr>
						<tr>
						<td height="29" align="right">
							附件：
						</td>
						<td colspan="4">
							<div id="upload">
								<input name="attach" id="attach" type="file" class="field"
										style="width: 635px; height: 20px; border: 1px solid #aecaf0;"
										inputwidth="635" size="94" validate="{required:true}"/>
							</div>
							<div id="download" style="display: none;">
								<span style="color: #53CBF1; size: 12px;">${apkVersionForm.attachName}</span>
								<a href="${baseURL }/version/apkversion/apkversionsave/downloadFile.do?apkVersionId=${apkVersionForm.id }">下载</a>
									<a href="#"
										onclick="deleteAttach('${apkVersionForm.id }');return false;">删除</a>
								</div>
						</td>
						<td><div id="upload1"><span style="color: #FF4500; margin-left: 10px">请上传小于${filemax}M的文件！</span></div></td>
					</tr>
				</table>
				
				<input type="hidden" inputwidth="300" ltype="text"
								name="SDdetail_id" id="SDdetail_id" value="${apkVersionForm.id}"/>
				
			</form>
			<a href=""></a>
		</div>
		<script type="text/javascript">

		function initFile() {
			<c:if test="${empty apkVersionForm || empty apkVersionForm.attachName }">
				$("#upload").show();
				$("#upload1").show();
				$("#download").hide();
			</c:if>
			<c:if test="${not empty apkVersionForm && not empty apkVersionForm.attachName }">
				$("#upload").hide();
				$("#upload1").hide();
				$("#download").show();
				
			</c:if>
		}
		initFile();
		
		var formdetail = $("#formdetail");
		LG.setFormDefaultBtn(FF_Cancel, FF_Save);
		//表单底部按钮 
		//表单应用likui样式
		function FF_Save() {
			var win = parent || window;
			formdetail.attr("action","${baseURL}/version/apkversion/apkversionsave/apkVersionSave.do");
			LG.submitForm(formdetail, function(data) {
				
				if (data && data.hasOk) {
						
					alert('操作成功!');
					win.LG.closeAndReloadParent("versionEdit", "${param.menuId}");
					win.LG.closeCurrentTab("versionEdit");
					
				} else {
					alert("操作失败!失败信息如下:\n" + data.message + "\n如您对以上信息有疑问，请联系管理人员!");
				}
			});
		}
		
		//删除附件
		 function deleteAttach(apkVersionId) {
	    	$.ajax({
				type:"post",
				dataType:"json",
				url:"${baseURL }/version/apkversion/apkversionsave/deleteFile.do?apkVersionId="+apkVersionId,
				async: false,
				contentType:"application/x-www-form-urlencoded;charset=UTF-8",	
				success:function(data){
					if (data.result == true) {
						$("#upload").show();
						$("#download").hide();
						$.ligerDialog.success("删除附件成功！");
					}else {
						$.ligerDialog.success("删除附件失败！");
					}
				},
				error:function(xhr, ajaxOptions, thrownError) {
					 $.ligerDialog.error(xhr.responseText)
				}
			});
	    }
		
		function FF_Cancel() {
			var win = parent || window;
			win.LG.closeCurrentTab("versionEdit");
		}
		
		jQuery.metadata.setType("attr", "validate");
		LG.validate(formdetail);
		formdetail.ligerForm();

</script>

	</body>
</html>
