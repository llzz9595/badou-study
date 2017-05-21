<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<title>菜单功能</title>
<script type="text/javascript" src="${baseURL }/js/ajaxfileupload.js"></script>
</head>

<script type="text/javascript">
	//检查上传图片的格式是否正确
	function checkFile(path) {
		var errorType = "";
		var suffix = path.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase();
		if (suffix != "png" && suffix != "jpg") {
			errorType = "不支持的文件类型!";
		} else {
			errorType = "";
		}
		return errorType;
	}
	//图片上传 
	var tempId = "";
	function uploadFile(obj) {
		tempId = "";
		var errorType = checkFile($(obj).val());
		if (errorType != "") {
			$.ligerDialog.alert("不支持该图片类型的上传!");
			return false;
		}
		var imgId = "";
		var id = $(obj).attr("id");
		$("#type" + id).val(id);
		var uploadUrl = "${baseURL}/ordersystem/menu/menuedit/uploadGoodsImg.do?tempId="+ imgId + "&randId=" + Math.random();
		$.ajaxFileUpload({
			url : uploadUrl,
			secureuri : false,
			fileElementId : id,
			dataType : "text",
			success : function(data, status) {
				tempId = data;
				if (tempId != "") {
					$("#imgId").val(tempId);
					//放置缓存成功后去读取
				
					$("#img_container" + id).attr("src","${baseURL}/ordersystem/menu/menuedit/downloadTopicImgCache.do?tempId="+ tempId + "&randId=" + Math.random());
				} else {
					alert("上传失败!");
				}
			},
			//服务器响应失败
			error : function(data, status, e) {
				alert("上传失败：" + e);
			}
		});
	}
</script>
<body style="padding-bottom: 31px;">
	<form id="scenform" method="post" name="scenform">
		<div class="l-group l-group-hasicon">
			<img src="${baseURL}/themes/default/icons/32X32/communication.gif" />
			<span>列表编辑信息</span>
		</div>
		<!--    <div id="tabcontainer" style="margin:3px;">
       		<div title="基本信息" tabid="mainTab">          -->
		<form id="mainform" method="post">
			<input type="hidden" id="imgId" name="imgId" />
			<div
				style="float: right; position: fixed; left: 600px; top: 72px; clear: both; width: 600px">
				<table style="width: 90%">
					<tr>
						<td align="right" class="l-table-edit-td" width="120">图片</td>
						<!--无图片显示这里  -->
						<td align="left" class="l-table-edit-td" colspan="8"><c:if
								test="${empty smallIconid}">
								<div
									style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
									<img to_big="true"
										style="position: absolute; width: 120px; height: 120px; margin: 0px;"
										id="img_container1" />
								</div>
							</c:if> <!--有图片显示这里  --> <c:if test="${!empty smallIconid}">
								<div
									style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
									<img to_big="true"
										style="position: absolute; width: 120px; height: 120px; margin: 0px;"
										id="img_container1"
										src="${baseURL}/ordersystem/menu/menuedit/downloadImg.do?tempId=${smallIconid}" />
								</div>
							</c:if></td>

						<td align="left" class="l-table-edit-td" colspan="8"><input
							class="fileInput" type="file" name="attach" id="1"
							style="margin-top: 65px;"
							onchange='uploadFile(this);return false;' /> <!-- <span class="sl-custom-file">
   											 <button type="button" class="btn btn-primary" >上传图片</button>
   											 <input type="file" class="ui-input-file"  onchange='uploadFile(this);return false;'/>
										</span> --></td>
					</tr>
				</table>
			</div>
		</form>

	</form>
	<script type="text/javascript">
		var pkId = '${id}';
		var tab = $("#tabcontainer").ligerTab();
		function badousoft() {
		}
		badousoft.ajax = function(s) {
			jQuery.ajax(s);
		}
		var baseUrl = '${baseURL}/ordersystem/menu/menu';
		//button 
		LG.setFormDefaultBtn(FF_Cancel, FF_Save);

		var mainform = $("#scenform");
		mainform.ligerForm({
			fields : [ {display : "菜单名称",name : "menuName",newline : true,labelWidth : 80,width : 240,space : 30,type : "text",
				validate : {required : true,maxlength : 32}}, 
				{
				display : "价格",name : "price",newline : true,labelWidth : 80,width : 240,space : 30,type : "number",
				validate : {required : true,maxlength : 32}}, 
				{display : "是否有效",name : "effect",newline : true,labelWidth : 80,	width : 240,space : 30,type : "select",
					comboboxName: "effective", options: {data : [{id:'T', text:'是'}, {id:'F', text:'否'}]},	
				validate : {required : false,maxlength : 2}},
				{display : "所属快餐店",name : "restaurant",newline : true,labelWidth : 80,width : 240,space : 30,type : "text",
				validate : {required : false,maxlength : 20}}, ],
				toJSON : JSON2.stringify});

		//validate
		jQuery.metadata.setType("attr", "validate");
		LG.validate($("#scenform"));
		//save
		function FF_Save() {
			mainform.attr("action", baseUrl + "save/save.do?id=${id}");
			LG.submitForm(mainform,
					function(data) {
						var win = parent || window;
						if (data && data.hasOk) {
							alert('保存成功!');
							win.LG.closeAndReloadParent("MenuEdit","${param.menuId}");
						} else {
							alert("保存失败:\n" + msg.message
									+ "\nContract with Manager!");
						}
					});
		}
		//Cancel
		function FF_Cancel() {   
			var win = parent || window;
			win.LG.closeCurrentTab("MenuEdit");
		}
		//After Loaded
		function FF_AfterLoaded() {

		}
	</script>

	<script type="text/javascript">
		//load data
		LG.loadForm({
			mainForm : mainform,
			url : baseUrl + 'edit/editJSON.do?id=${id}',
			callback : FF_AfterLoaded
		});
	</script>
</body>
</html>