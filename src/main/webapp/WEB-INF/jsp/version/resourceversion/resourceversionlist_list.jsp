<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>HTML列表</title>
</head>
<body>
 	<input type="hidden" name="menuId" id="menuId" value="${apkId}"/>
		<!-- 搜索表单 -->
 		<div id="mainsearch" style="width: 98%">

			<form id="formsearch" class="l-form" method="get">
				<table>
					<tr>
						
						<td align="right" class="l-table-edit-td">
							版本名称:
						</td>
						<td align="left" class="l-table-edit-td" style="width: 160px">
							<input name="versionName" type="text" id="versionName" ltype="text"
								class="field" />
						</td>
						<td align="left" class="l-table-edit-td"></td>
						
						<td align="right" class="l-table-edit-td">
							版本号:
						</td>
						<td align="left" class="l-table-edit-td" style="width: 160px">
							<input inputwidth="120" name="versionNum" id=""versionNum"" class="field" ltype="text"/>
						</td>
						<td align="left" class="l-table-edit-td"></td>

						<td>
							<input type="button" value="搜索" id="btnSearch"
								class="l-button l-button-submit" />
						</td>
						<td>
							<input type="reset" value="重置" id="btnReset"
								class="l-button l-button-test" />
						</td>
					</tr>
				</table>
				<input type="hidden" name="apkId" id="versionApkId" value="${apkId}"/>
				
			</form>
		</div>
		
	<!-- 列表信息-->
  <div id="childrenlist" style="margin:10px;"></div>
  
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
          {display:"版本号",name:"versionNum",width:100,type:"text",align:"center",isSort : true},
           {display:"版本名称",name:"versionName",width:240,type:"text",align:"center",isSort : true},
           {display:"描述",name:"versionDescription",width:300,type:"text",align:"center",isSort : true},
           {display:"附件",name:"attachName",width:300,type:"text",align:"center",isSort : true,
	           render:function(row) {
	        			var attachName = row.attachName;
	        			var html = '';
	        			if (attachName != "" && attachName != null) {
	        				if(attachName.length > 15){
	            				attachName = attachName.substring(0,15) + "...";
	            	  		}
	        				html += "<a style='color:blue;' href='${baseURL }/version/resourceversion/resourceversionsave/downloadFile.do?resourceVersionId="+row.id+"'>" + attachName + "</a>";
	        			}
	        			return html;
	        		}
	          }],
		   dataAction: 'server',toolbar: {},
		  url: '${baseURL}/version/resourceversion/resourceversionlist/listJSON.do', sortName: 'code',
          width: '98%', height: '98%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
      });
     
  	 //加载toolbar
      LG.createToolbarButton(childrenDetailsGridVersion, [
    	  							{id : "add", name : "新增", clickEvent : FF_AddClickEventVersion, icon : "/silkicons/add.png"},
      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEventVersion, icon : "/silkicons/application_edit.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEventVersion, icon : "/silkicons/delete.png"}
    	  							]);
 	 //双击事件
      LG.setGridDoubleClick(childrenDetailsGridVersion, FF_ModifyClickEventVersion);
  	  
 	   //新增事件
      function FF_AddClickEventVersion(btnItem){
 		   alert("${param.menuId}");
 		var versionApkId = $("#versionApkId").val();  
      	parent.f_addTab("resourceVersionEdit", '新增', '${baseURL}/version/resourceversion/resourceversionedit/editAddUrl.do?menuId=${param.menuId}&IsView=1&versionApkId='+versionApkId);
      }
       //修改事件
      function FF_ModifyClickEventVersion(btnItem){
		var row = childrenDetailsGridVersion.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	var versionApkId = $("#versionApkId").val();
      	parent.f_addTab("resourceVersionEdit", '编辑', '${baseURL}/version/resourceversion/resourceversionedit/editUpdateUrl.do?menuId=${param.menuId}&IsView=0&resourceVersionId=' + row.id+'&versionApkId='+versionApkId);
      }
 	 
    //删除事件
      function FF_DeletedClickEventVersion(btnItem){
		var selectedRow = childrenDetailsGridVersion.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/version/resourceversion/resourceversiondelete/delete.do?menuId=${param.menuId}&IsView=0",
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
  </script>
 </body>
</html>
