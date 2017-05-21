<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>DEMO演示功能1-分页列表</title>
</head>
<body>
  <input type="hidden" name="menuId" id="menuId" value="${param.menuId}"/>
  <!-- 搜索表单 -->
  <div id="mainsearch" style=" width:98%">
	    <div class="searchtitle">
	        <span>搜索</span><img src="${baseURL}/themes/default/icons/32X32/searchtool.gif" 

/>
	        <div class="togglebtn"></div> 
	    </div>
	    <div class="navline" style="margin-bottom:4px; margin-top:4px;"></div>
	   <div class="searchbox">
	        	<form id="formsearch" class="l-form" method="get">
			        <table cellpadding="0" cellspacing="1" class="l-table-edit" >
			            <tr>
			                <td align="right" class="l-table-edit-td">id</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id=stuID name="stuID" ltype="text" class="field" value="" style="margin-left: 2px;width: 160px"/>
			                </td>
			                <td align="right" class="l-table-edit-td"  style="padding-left: 30px">名字</td>
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
			</div>
  </div>
 <!-- 表格列表 -->
  <div id="maingrid"></div> 

 <script type="text/javascript">
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
              columns: [
		          {display:"id",name:"stuID",width:150,type:"text",align:"center",isSort : true},
		          {display:"名字",name:"name",width:80,type:"text",align:"center",isSort : true},
		          {display:"性別",name:"sex",width:80,type:"text",align:"center",isSort : true},
		          {display:"年齡",name:"age",width:150,type:"text",align:"right",isSort : false},
		          {display:"地址",name:"address",width:150,type:"text",align:"center",isSort : false},
		          {display:"字段",name:"FLG_DELETED",width:150,type:"text",align:"center",isSort : false},],
	          dataAction: 'server',toolbar: {},
	          url: '${baseURL}/moduledemo/fun5/fun5demolist/listJSON.do', sortName: 'StuID',
	          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
	          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],
	          pagesizeParmName:"perPageSize",rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}});

      //双击事件
      LG.setGridDoubleClick(grid, FF_ModifyClickEvent);
      //增加搜索按钮,并创建事件, 最后一个参数控制是否显示“高级搜索按钮”
   /*    LG.appendSearchButtons("#formsearch", grid, false); */
       $("#formsearch").ligerForm();
      //加载toolbar
   	LG.createToolbarButton(grid, [{id : "add", name : "新增", clickEvent : FF_AddClickEvent, icon : "/silkicons/add.png"},
	      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEvent, icon : "/silkicons/application_edit.png"},
	      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);
	
      //列表新增事件
      function FF_AddClickEvent(btnItem){
    	  parent.f_addTab("fun5demoEdit", 'Demo5编辑', '${baseURL}/moduledemo/fun5/fun5demoedit/edit.do?menuId=${param.menuId}');
      }
      
      //列表修改事件
       function FF_ModifyClickEvent(btnItem){
    	  var row = grid.getLastSelected();
    	  if (!row) { alert("请选择需要修改的行!"); return false;}
    	  parent.f_addTab("fun5demoEdit", 'Demo5编辑', '${baseURL}/moduledemo/fun5/fun5demoedit/edit.do?menuId=${param.menuId}&id='+ row.id);
    	  
      }  
       

      //删除事件
      function FF_DeletedClickEvent(btnItem){
      	var selectedRow = grid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/fun5/fun5demodelete/delete.do",
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
     						 grid.loadData();
     						 alert('操作成功!');
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
              }
        });
      }
      
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
    <!-- 编辑表单(采用弹出框时，一般是另一个页面请求，此时编辑表单会在另一个文件中) -->
<%@ include file="fun5demolist_detail.jsp" %>
</body>
</html>
