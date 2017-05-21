<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>接口列表</title>
</head>
<body>
		<!-- 搜索表单 -->
 		<div id="mainsearch" style="width: 98%">

			<form id="formsearch" class="l-form" method="get">
				<table>
					<tr>
						
						<td align="right" class="l-table-edit-td">
							接口名称:
						</td>
						<td align="left" class="l-table-edit-td" style="width: 160px">
							<input name="name" type="text" id="name" ltype="text"
								class="field" />
						</td>
						<td align="left" class="l-table-edit-td"></td>
						
						<td align="right" class="l-table-edit-td">
							接口状态:
						</td>
						<td align="left" class="l-table-edit-td" style="width: 160px">
							<input name="type" id="type"" class="field" ltype="text"/>
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
				
			</form>
			
		</div>
		
	<!-- 列表信息-->
  <div id="childrenlist" style="margin:10px;"></div>
  
  <script type="text/javascript">
 	$("#type").ligerComboBox({data: ${apiType},selectBoxWidth:200});
  
  //搜索事件
      $("#btnSearch").click(function(e){
    	  var json = LG.bulidFilterParams($("#formsearch"));
           childrenDetailsGridAction.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		   childrenDetailsGridAction.loadData();
      });
  
  		var childrenDetailsGridAction = $("#childrenlist").ligerGrid({ 
          columns: [
          {display:"接口名称",name:"name",width:200,type:"text",align:"center",isSort : false},
          {display:"接口状态",name:"typeDesc",width:150,type:"text",align:"center",isSort : true},     
          {display:"消息代码",name:"msgCode",width:150,type:"text",align:"center",isSort : true},
          {display:"接口路径",name:"url",width:500,type:"text",align:"center",isSort : false}],
		   dataAction: 'server',toolbar: {},
		  url: '${baseURL}/openapi/apilist/listJSON.do?', sortName: 'code',
          width: '98%', height: '98%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
      });
     
  	 //加载toolbar
      LG.createToolbarButton(childrenDetailsGridAction, [
    	  							{id : "add", name : "新增", clickEvent : FF_AddClickEventAction, icon : "/silkicons/add.png"},
      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEventAction, icon : "/silkicons/application_edit.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeleteClickEventAction, icon : "/silkicons/delete.png"}]);
 	 //双击事件
      LG.setGridDoubleClick(childrenDetailsGridAction, FF_ModifyClickEventAction);
  	  
 	   //新增事件
      function FF_AddClickEventAction(btnItem){
      		parent.f_addTab("iieatActionEdit", '新增', '${baseURL}/openapi/apiedit/editAddUrl.do?menuId=${param.menuId}&IsView=1');
      }
       //修改事件
      function FF_ModifyClickEventAction(btnItem){
		var row = childrenDetailsGridAction.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	parent.f_addTab("iieatActionEdit", '编辑', '${baseURL}/openapi/apiedit/editUpdateUrl.do?menuId=${param.menuId}&IsView=0&apiId=' + row.id);
      }
 	 
       //修改状态事件
      function FF_DeleteClickEventAction(orderId){ 
    	var selectedRow = childrenDetailsGridAction.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/openapi/apidelete/delete.do",
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
     						 childrenDetailsGridAction.loadData();
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
