<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>

<title>考勤上传页面</title>
	<script type="text/javascript">
       
	    
	    //检查上传图片的格式是否正确
	    function checkFile(path){
	        var errorType = "";
	        var suffix =path.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase();
	        if(suffix != "xls"){
	            errorType = "抱歉，目前仅支持xls格式的文件!";
	        }else{
	            errorType = "";
	        }
	        return errorType;
	    }
	    
	    function ev_validate() {
	    	var path = $("#attach").val();
	    	if (path == "") {
	    		$.ligerDialog.error("请选择导入文件!");
	    		return false;
	    	}
	    	var errormsg = checkFile(path);
	    	if(errormsg != ""){
	            $.ligerDialog.error(errormsg);
	            return false;
	        }
	        
	    	return true;
	    }
	    function exportExcel(fileName){
			fileName = encodeURI(encodeURI(fileName));
			window.location.href = baseURL + "/common/excel/excelexport/exportExcel.do?fileName=" + fileName;
		}
    </script>
</head>
<body>
	<div>
		<div class="l-form"
			style="width:96%; height:100%; margin-left:1%; border:1px solid #ccc; overflow:auto; ">
			<form action="${baseURL}/student/studentimport/importExcel.do" method="post" enctype="multipart/form-data">
			<div class="l-group l-group-hasicon" style="margin:0px;">
				<img src="${baseURL }/themes/default/icons/32X32/communication.gif"/>
				<span>导入文件：
					<input type="file" name="attach" id="attach" />
						<!-- <input type="button" value="上传" class="l-button" style="filter:alpha(opacity=90);" /> -->
					<img id="loading" src="${baseURL }/themes/plugin/ligerUI/lib/ligerUI/skins/Aqua/images/common/loading.gif" style="display: none;">
				</span>
				<br/>
			</div>
			<div class="l-group l-group-hasicon" style="margin:0px;padding: 0px;">
				<span style="font-size: 12px;color: red;font-style: normal;">（请上传学生信息模板的excel文件）</span>
				<a href="#" onclick="exportExcel('学生信息导入模板');return false;">模板下载</a>
			</div>
			</form>
		</div>
		<div class="l-form"
			style="width:96%; height:auto; min-height:180px; margin-left: 1%; border:1px solid #ccc; overflow:auto; ">
			<div class="l-group l-group-hasicon" style="margin:0px;">
				<img src="${baseURL }/themes/default/icons/32X32/communication.gif"/>
				<span>导入结果：</span>
			</div>
			<div id="upload_error" style="font: 12px;color:#505050 ; padding-left: 10px;">${returnMsg }</div>
		</div>
	</div>
</body>
</html>
