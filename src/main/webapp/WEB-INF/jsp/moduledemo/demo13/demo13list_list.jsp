<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>HTML列表</title>
</head>

<script type="text/javascript">
	//检查上传图片的格式是否正确
		function checkFile(path) {
			var errorType = "";
			var suffix = path.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase();
			if (suffix != "xls" && suffix != "xlsx") {
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
				$.ligerDialog.alert("不支持该类型的上传!");
				return false;
			}
			var imgId = "";
		    var id = $(obj).attr("id");
		    $("#type"+id).val(id);
		    var uploadUrl = "${baseURL}/moduledemo/demo13/demo13list/importExcel.do?tempId="+imgId+ "&randId=" + Math.random();
		    $.ajaxFileUpload({
		        url:uploadUrl,
		        secureuri:false,
		        fileElementId:id,
		        dataType:"text",
		        success:function(data,status){
		        	tempId = data;
		           	if(tempId!= ""){
		           		//放置缓存成功后去读取
		           		alert("上传成功!");
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


<body>
 	<input type="hidden" name="menuId" id="menuId" value="${apkId}"/>
		<!-- 搜索表单 -->
  		<div id="mainsearch" style=" width:98%">
	    	<%-- <div class="searchtitle">
	        	<img src="${baseURL}/themes/default/icons/32X32/searchtool.gif" /><span>搜索</span>
	        	<div class="togglebtn"></div> 
	    	</div>
    		<div class="navline" style="margin-bottom:4px; margin-top:4px;"></div> --%>
    		<div class="searchbox">
	        	<form id="formsearch" class="l-form" method="get">
			        <table cellpadding="0" cellspacing="1" class="l-table-edit" >
			          <tr>
			           <tr>
			                <td align="right" class="l-table-edit-td">编码</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="code" name="code" ltype="text" class="field" value="" style="margin-left: 2px;width: 160px"/>
			                </td>
			                <td align="right" class="l-table-edit-td"  style="padding-left: 30px">名称</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="name" name="name" ltype="text" class="field" value="" style=" margin-left:2px;width: 160px"/>
			                </td>
			                <td align="left" class="l-table-edit-td" style="padding-left: 30px">
								<input type="button" value="搜索" id="btnSearch"  class="l-button l-button-submit"  /> 
			                </td>
			                <td align="left" class="l-table-edit-td">
								<input type="reset" value="重置" id="btnReset" class="l-button l-button-test"/> 
			                </td> 
			             
			               
			            </tr>
			        </table>
	       		</form>
	       		
	       		<form action="${baseURL}/moduledemo/demo13/demo13list/importExcel.do"  enctype="multipart/form-data">
	       		<table>
	       		<tr>
	       		   
			                <td  class="l-table-edit-td">
			                
									<div id="upload">
									<input class="fileInput" type="file" name="fileName" id="2" style="margin-top: 0px;"
								  />
									<input type="submit" value="上传" id="btnUpload" class="l-button l-button-test"/> 	
							 
							</div>
			                </td>
			                 <td  class="l-table-edit-td">
								
								
			                </td>
	       		</tr>
	       		</table>
	       		</form>
			</div>
  		</div>

	<!-- 列表信息-->
  <div id="childrenlist" style="margin:10px; "></div>
  
  <script type="text/javascript">
 

	  
  //搜索事件
      $("#btnSearch").click(function(e){
    	  var json = LG.bulidFilterParams($("#formsearch"));
           childrenDetailsGridVersion.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		   childrenDetailsGridVersion.loadData();
      });
  
  		var childrenDetailsGridVersion = $("#childrenlist").ligerGrid({ 
          columns: [
			{display:"主键ID",name:"id",width:100,type:"number",align:"center",isSort : true},
          {display:"商品名 称",name:"name",width:100,type:"text",align:"center",isSort : true},
           {display:"商品价格",name:"price",width:240,type:"text",align:"center",isSort : true},
           {display:"商品描述",name:"desc",width:300,type:"text",align:"center",isSort : true},
           {display:"附件",name:"imgUrl",width:300,type:"text",align:"center",isSort : true,
	           render:function(row) {
	        			var attachName = row.imgUrl;
	        			var html = '';
	        			if (attachName != "" && attachName != null) {
	        				if(attachName.length > 15){
	            				attachName = attachName.substring(0,15) + "...";
	            	  		}
	        				html += "<a style='color:blue;' href='${baseURL }/moduledemo/demo13/demo13save/downloadFile.do?demo13Id="+row.id+"'>" + attachName + "</a>";
	        			}
	        			return html;
	        		}
	          }],
		   dataAction: 'server',toolbar: {},
		  url: '${baseURL}/moduledemo/demo13/demo13list/listJSON.do', sortName: 'code',
          width: '98%', height: '98%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
      });
     
  	 //加载toolbar
      LG.createToolbarButton(childrenDetailsGridVersion, [
    	  							{id : "add", name : "新增", clickEvent : FF_AddClickEventVersion, icon : "/silkicons/add.png"},
      								{id : "modify", name : "查看详情", clickEvent : FF_ModifyClickEventVersion, icon : "/silkicons/application_edit.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEventVersion, icon : "/silkicons/delete.png"}
    	  							]);
 	 //双击事件
      LG.setGridDoubleClick(childrenDetailsGridVersion, FF_ModifyClickEventVersion);
  	  
 	   //新增事件
      function FF_AddClickEventVersion(btnItem){
 		   alert("--"+"${role.name }");
 		var versionApkId = $("#versionApkId").val();  
      	parent.f_addTab("demo13Edit", '新增', '${baseURL}/moduledemo/demo13/demo13edit/editAddUrl.do?menuId=${param.menuId}&IsView=1&versionApkId='+versionApkId);
      }
       //修改事件
      function FF_ModifyClickEventVersion(btnItem){
		var row = childrenDetailsGridVersion.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	
      	var versionApkId = $("#versionApkId").val();
    	parent.f_addTab("fun1demoEdit", '详情', '${baseURL}/moduledemo/demo13/demo13edit/edit.do?menuId=${param.menuId}&id=' + row.id );
      }
 	 
    //删除事件
      function FF_DeletedClickEventVersion(btnItem){
		var selectedRow = childrenDetailsGridVersion.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/demo13/demo13delete/delete.do?menuId=${param.menuId}&IsView=0",
   					dataType : "json",
   					data: "ids="+LG.serialIdParam(selectedRow),
   					beforeSend: function (){
		                LG.loading = true;
		                LG.showLoading('正在处理中...请稍候');
		            },
		            complete: function (){
		                LG.loading = false;	  
		                LG.hideLoading();
		            },
   					success: function(msg){
     					if(msg && msg.hasOk){
     						 childrenDetailsGridVersion.loadData();
     						 alert('操作成功!');
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
              }
        });
      }
     
    	$("#formsearch").ligerForm();
	  	//搜索事件
      	$("#btnSearch").click(function(e){
    	
      		var json = LG.bulidFilterParams($("#formsearch"));
        	grid.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		  	grid.loadData();
      		
         
		  	
      	});
	  
 	   	//重置事件
      	$("#btnReset").click(function(e){
			grid.set('parms', null);
            //采用原来的请求地址，带上参数加载数据
		   	grid.loadData();
     	});
 	   	
  
  </script>
  
   
 </body>
</html>
