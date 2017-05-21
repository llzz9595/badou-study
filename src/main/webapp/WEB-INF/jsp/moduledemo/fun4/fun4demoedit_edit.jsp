<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<title>DEMO演示功能2</title>
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
    	var  tempId = "";
		function uploadFile(obj){
			tempId = "";
			var errorType=checkFile($(obj).val());
			if(errorType!=""){
				$.ligerDialog.alert("不支持该图片类型的上传!");
				return false;
			}
			var imgId = "";
		    var id = $(obj).attr("id");
		    $("#type"+id).val(id);
		    var uploadUrl = "${baseURL}/moduledemo/fun4/fun4demoedit/uploadGoodsImg.do?tempId="+imgId+ "&randId=" + Math.random();
		    $.ajaxFileUpload({
		        url:uploadUrl,
		        secureuri:false,
		        fileElementId:id,
		        dataType:"text",
		        success:function(data,status){
		        	tempId = data;
		           	if(tempId!= ""){
		           		$("#imgId").val(tempId);
		           		//放置缓存成功后去读取
		           		$("#img_container"+id).attr("src","${baseURL}/moduledemo/fun4/fun4demoedit/downloadTopicImgCache.do?tempId=" + tempId + "&randId=" + Math.random());
		  	       }else{
		             	alert("上传失败!");
		            } 
		        }, 
		        //服务器响应失败
		        error:function(data,status,e){
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
                 	<input type="hidden" id="imgId" name="imgId"/>
                 	<div  style="float: right; position: fixed; left: 600px; top: 72px; clear: both; width: 600px">
         				<table style="width: 90%">
         					<tr>
         						<td align="right" class="l-table-edit-td" width="120">头像</td>
         						<!--无图片显示这里  -->
         						<td align="left" class="l-table-edit-td" colspan="8">
         							<c:if test="${empty smallIconid}">
         									<div style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
         										<img to_big="true" style="position: absolute; width: 120px; height: 120px; margin: 0px;" id="img_container1" />
         									</div>
         							</c:if>
         							<!--有图片显示这里  -->
         							<c:if test="${!empty smallIconid}">
         									<div style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
         										<img to_big="true" style="position: absolute; width: 120px; height: 120px; margin: 0px;"
         											id="img_container1" src="${baseURL}/moduledemo/fun4/fun4demoedit/downloadGoodsImgCache.do?tempId=${smallIconid}" />
         									</div>
         							</c:if>
         						</td>
         						
         						<td align="left" class="l-table-edit-td" colspan="8">
         							<input class="fileInput" type="file" name="attach" id="1" style="margin-top: 65px;"
         								 onchange='uploadFile(this);return false;' /> 
         								 <!-- <span class="sl-custom-file">
   											 <button type="button" class="btn btn-primary" >上传图片</button>
   											 <input type="file" class="ui-input-file"  onchange='uploadFile(this);return false;'/>
										</span> -->
         						</td>
         					</tr>
         				</table>
         			</div>
         		</form>
         	
	</form>
	<script type="text/javascript">
  		var pkId = '${id}';
  		var tab = $("#tabcontainer").ligerTab();
        function badousoft(){}
			badousoft.ajax=function(s){
			    jQuery.ajax(s);
		}	 
		var baseUrl = '${baseURL}/moduledemo/fun4/fun4demo';
           //button 
        LG.setFormDefaultBtn(FF_Cancel, FF_Save);

		var mainform = $("#scenform");
              mainform.ligerForm({ 
                  fields: [
  				      { display: "<span style='color: red;'>*</span>&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号", name: "workerNum", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  				        	validate: { required: true, maxlength: 32}},
  				      { display: "<span style='color: red;'>*</span>&nbsp姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名", name: "workerName", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  				        	validate: { required: true, maxlength: 32}},
  				      { display: "&nbsp&nbsp&nbsp性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别", name: "sex", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  				        	validate: {maxlength: 2}},
  				      { display: "&nbsp&nbsp&nbsp身份证号", name: "identityCard", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  				            validate: { maxlength: 20}},
  					  { display: "&nbsp&nbsp&nbsp入职时间", name: "entryTime", newline: true, labelWidth: 80, width: 240, space: 30, type: "date",
  				        	options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
  				      { display: "&nbsp&nbsp&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp种", name: "genre", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  				        validate: {  maxlength: 10}},
  	  				  { display: "&nbsp&nbsp&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp资", name: "salary", newline: true, labelWidth:80, width: 240, space: 30, type: "text",
  	  				       	validate: {  maxlength: 8}},   
  	  				  { display: "&nbsp&nbsp&nbsp联系方式", name: "contact", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  				       	validate: {  maxlength: 20}},
  	  				  { display: "&nbsp&nbsp&nbspQQ&nbsp&nbsp&nbsp&nbsp&nbsp号", name: "qq", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  	  	  				validate: {  maxlength: 20}},   
  	  	  		      { display: "&nbsp&nbsp&nbsp微&nbsp&nbsp信&nbsp&nbsp号", name: "weChat", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  	  				    validate: {  maxlength: 20}},
  	  	  		      { display: "&nbsp&nbsp&nbsp邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱", name: "email", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  	  				    validate: {  maxlength: 20}},   
  	  	  			  { display: "&nbsp&nbsp&nbsp家庭住址", name: "address", newline: true, labelWidth: 80, width: 240, space: 30, type: "text",
  	  	  				    validate: {  maxlength: 50}}     
  	  				 ],
                  toJSON: JSON2.stringify
              }); 
         
   
	
         			
     	 //validate
	     jQuery.metadata.setType("attr", "validate"); 
	     LG.validate($("#scenform"));
     	//save
	     function FF_Save(){
	        	  mainform.attr("action",baseUrl+"save/save.do?id=${id}");
	        	  LG.submitForm(mainform, function (data) {
	        		  var win = parent || window;
	                if (data && data.hasOk) {  
	                     alert('保存成功!');
	                     win.LG.closeAndReloadParent("Fun4DemoEdit", "${param.menuId}");
	                } else { 
	     				alert("保存失败:\n"+msg.message+"\nContract with Manager!");
	                }
	              });
	    }
    	 //Cancel
	    function FF_Cancel(){
	    	var win = parent || window;
	        win.LG.closeCurrentTab("Fun4DemoEdit");
	    }
	     //After Loaded
	    function FF_AfterLoaded(){
	    		
	    }

	</script>

	<script type="text/javascript">
		 //load data
	      LG.loadForm({mainForm: mainform, url:baseUrl+'edit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
	</script>
</body>
</html>