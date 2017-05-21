<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>DEMO演示功能-弹出编辑框 </title>
</head>
<script type="text/javascript" src="${baseURL }/js/ajaxfileupload.js"></script>

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
		  
		    var uploadUrl = "${baseURL}/moduledemo/fun3/fun3demoedit/uploadGoodsImg.do?tempId="+imgId+ "&randId=" + Math.random();
		    alert("url-"+uploadUrl);
		    $.ajaxFileUpload({
		        url:uploadUrl,
		        secureuri:false,
		        fileElementId:id,
		        dataType:"text",
		        success:function(data,status){
		        	tempId = data;
		           	if(tempId!= ""){
		           		//放置缓存成功后去读取
		           		$("#img_container"+id).attr("src","${baseURL}/moduledemo/fun3/fun3demoedit/downloadTopicImgCache.do?tempId=" + tempId + "&randId=" + Math.random());
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

<body style="padding-bottom:31px;">
 <div id="tabcontainer" style="margin:3px;">
     <div title="基本信息" tabid="mainTab">
        <form id="mainform" method="post">
        
        	<div  style="float: right; position: fixed; left: 600px; top: 72px; clear: both; width: 600px">
				<table style="width: 90%">
					<tr>
						<td align="right" class="l-table-edit-td" width="120">图片1</td>
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
											id="img_container1" src="${baseURL}/moduledemo/fun3/fun3demoedit/downloadGoodsImgCache.do?tempId=${smallIconid}" />
									</div>
							</c:if>
						</td>
						
						<td align="left" class="l-table-edit-td" colspan="8">
							<input class="fileInput" type="file" name="attach" id="1" style="margin-top: 65px;"
								 onchange='uploadFile(this);return false;' />
						</td>
					</tr>
	
					<tr>
						<td align="right" class="l-table-edit-td" width="70">图片2(无缓存)</td>
						<td align="left" class="l-table-edit-td" colspan="8">
							<!--无图片显示这里  -->
							
								<!--有图片显示这里  -->
							<c:if test="${!empty bigIconid}">
								<div style="float: left; position: relative; width: 120px; height: 120px; background: #fff; border: 1px solid #a3c0e8;">
									<img to_big="true" style="position: absolute; width: 120px; height: 120px; margin: 0px;" id="img_container2"
										src="${baseURL}/moduledemo/fun3/fun3demoedit/downloadGoodsImgCache1.do?tempId=${bigIconid}" />
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
    	</form> 
	 </div>
     <div title="子表单列表信息" tabid="childrenTab">
	      <div id="toptoolbar"></div> 
		  <div id="childrenlist" style="margin:2px auto;"></div>
     </div>
</div>

  <script type="text/javascript">
  		var pkId = '${id}';
  		//tab样式
  		var tab = $("#tabcontainer").ligerTab();
          
           //表单底部按钮 
        LG.setFormDefaultBtn(FF_Cancel, FF_Save);
      //编辑，新增
	  var mainform = $("#mainform");
                 //创建表单结构
              mainform.ligerForm({ 
                   fields: [
						{ name: "parent", type: "hidden"},
						{ name: "smallIcon", type: "hidden"},
						{ name: "bigIcon", type: "hidden"},
						{display: "<span style='color: red;'>*</span>&nbsp编码", name: "code", newline: true, labelWidth: 80, width: 220, space: 30, type: "text", 
								group:"基本信息",groupicon:"${baseURL}/themes/default/icons/32X32/communication.gif", validate: { required: true, maxlength: 32} },
						{display: "<span style='color: red;'>*</span>&nbsp菜单名称", name: "name", newline: true, labelWidth: 80, width: 220, space: 30, type: "text" ,
								validate: { required: true, maxlength: 50}},
						{display: "<span style='color: red;'>*</span>&nbspurl", name: "url", newline: true, labelWidth: 80, width: 300, space: 30, type: "text",
								validate: { required: true, maxlength: 40}},
         			 ],
                    toJSON: JSON2.stringify
              });
     
      //添加验证
     jQuery.metadata.setType("attr", "validate"); 
     LG.validate(mainform);
     //保存
     function FF_Save(){
        	  mainform.attr("action","${baseURL}/moduledemo/fun3/fun3demosave/save.do?id=${id}");
        	  LG.submitForm(mainform, function (data) {
        		  var win = parent || window;
                if (data && data.hasOk) {  
                     alert('操作成功!');
                     win.LG.closeAndReloadParent("fun3demoEdit", "${param.menuId}");
                } else { 
                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
                }
              });
    }
     //取消按钮，即关闭窗体
    function FF_Cancel(){
    	var win = parent || window;
        win.LG.closeCurrentTab("fun3demoEdit");
    }
     //加载完数据后，在页面设置某些值
     function FF_AfterLoaded(){
    	 //do noting
     }
           //加载数据
     LG.loadForm(mainform, {url:'${baseURL}/moduledemo/fun3/fun3demoedit/editJSON.do?id=${id}'},FF_AfterLoaded);
  </script>
  <%@ include file="fun3demoedit_child_list.jsp"%>
  <script type="text/javascript">
      //加载表单数据
      LG.loadForm({mainForm: mainform, detailForm: childrenDetailsGrid,childName : "children",
    	  url:'${baseURL}/moduledemo/fun3/fun3demoedit/editJSON.do?id=${id}',callback: FF_AfterLoaded}); 
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
  <%@ include file="fun3demoedit_child_detail.jsp"%>
</body>
</html>