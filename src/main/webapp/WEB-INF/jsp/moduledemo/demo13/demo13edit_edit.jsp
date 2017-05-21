<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<title>DEMO11-CRUD</title>
</head>
<body style="padding-bottom: 31px;">
	<form id="scenform" method="post" name="scenform">
	
			
		<div class="l-group l-group-hasicon">
			<img src="${baseURL}/themes/default/icons/32X32/communication.gif" />
			<span>列表编辑信息</span>
		<div  style="float: right; position: fixed; left: 600px; top: 72px; clear: both; width: 600px">
				<table style="width: 90%">
						<tr>
						
						<td align="right" class="l-table-edit-td" width="70">供应商编号</td>
						
						<input type="select" options={data:${PROVIDER_ID}></input>
						</tr>
					<tr>
						<td align="right" class="l-table-edit-td" width="70">图片</td>
						<td align="left" class="l-table-edit-td" colspan="8">
							<!--无图片显示这里  -->
							<c:if test="${empty bigIconid}">
								<div style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
										<img to_big="true" style="position: absolute; width: 120px; height: 120px; margin: 0px;" id="img_container2" />
								</div>
							</c:if>
								<!--有图片显示这里  -->
							<c:if test="${!empty bigIconid}">
								<div style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
									<img to_big="true" style="position: absolute; width: 120px; height: 120px; margin: 0px;" id="img_container2"
										src="${baseURL}/moduledemo/demo13/demo13edit/downloadGoodsImgCache1.do?tempId=${imgUrl}" />
								</div>
							</c:if>
						</td>
	
						<td align="left" class="l-table-edit-td" colspan="8">
							<input class="fileInput" type="file" name="attach" id="2" style="margin-top: 65px;"
								 onchange="preImg(this.id,'img_container2');"  />
					    </td>
					</tr>
				</table>
			</div>
		</div>	
	</form>
	<script type="text/javascript">
  		var pkId = '${id}';
  		var tab = $("#tabcontainer").ligerTab();
  		
        function badousoft(){}
			badousoft.ajax=function(s){
			    jQuery.ajax(s);
		}	 
		var baseUrl = '${baseURL}/moduledemo/demo13/demo13';
	
           //button 
        LG.setFormDefaultBtn(FF_Cancel, FF_Save);

		var mainform = $("#scenform");
              mainform.ligerForm({ 
                  fields: [
                      { name: "id", type: "hidden" },
  				    
                      { display: "<span style='color: red;'>*</span>&nbsp商品名称", name: "name", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
					    	validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "<span style='color: red;'>*</span>&nbsp商品价格", name: "price", newline: true, labelWidth: 100, width: 240, space: 30, type: "number",
  				        	validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "&nbsp&nbsp&nbsp描述", name: "desc", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
  				            validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "&nbsp&nbsp&nbsp供应商名称", name: "supplier", newline: true, labelWidth: 100, width: 240, space: 30, type: "select",options:{data:${PROVIDER_NAME},valueFieldID:'support'},
  	  				            validate: { required: true,maxlength: 32,rangelength:[2,20] }}, 
  	  				  { display: "&nbsp&nbsp&nbsp供应商编号", name: "supplierID", newline: true, labelWidth: 100, width: 240, space: 30, type: "select",options:{data:${PROVIDER_ID},valueFieldID:'supportID'},
  	  	  				            validate: { required: true,maxlength: 32,rangelength:[2,20] }},           
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
	                     win.LG.closeAndReloadParent("fun1demoEdit", "${param.menuId}");
	                } else { 
	     				alert("保存失败:\n"+msg.message+"\nContract with Manager!");
	                }
	              });
	    }
    	 //Cancel
	    function FF_Cancel(){
	    	var win = parent || window;
	        win.LG.closeCurrentTab("fun1demoEdit");
	    }
	     //After Loaded
	    function FF_AfterLoaded(){
	    		
	    }
		//加载数据
 		LG.loadForm(mainform, {url:'${baseURL}/moduledemo/demo13/demo13edit/editJSON.do?id=${id}'},FF_AfterLoaded);
	
		</script>

	<script type="text/javascript">
		 //load data
	      LG.loadForm({mainForm: mainform, url:baseUrl+'edit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
	</script>
	  <script type="text/javascript"> 
	/** 
	 * 将本地图片 显示到浏览器上
	 * sourceId ：文件域id
	 * targetId ：图片预览显示控件id
	 */ 
	function preImg(sourceId, targetId) { 
		var url = getFileUrl(sourceId); 
		var imgPre = document.getElementById(targetId); 
		imgPre.src = url; 
	
		/** 
		 * 从 file 域获取 本地图片 url 
		 */ 
		function getFileUrl(sourceId) { 
			var url = null; 
			if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
				url = document.getElementById(sourceId).value; 
			} else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
				url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
			} else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
				url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
			} else{
				url = document.getElementById(sourceId).value; 
			}
			return url; 
		};
	}; 
</script> 
</body>
</html>