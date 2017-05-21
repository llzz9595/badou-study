<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<script src="${baseURL}/themes/plugin/ligerUI/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
	<title>示例3(树结构)框架</title>
</head>
<body>
<!-- DEMO演示功能-分页列表 -->
	<!-- 这里定义了转发进入的TAB对应的菜单ID，也是TAB的属性ID值 -->
  <input type="hidden" name="menuId" id="menuId" value="${param.menuId}"/>
<div id="mainsearch" style=" width:98%">
  <!-- 搜索表单 -->
	    <div class="searchtitle">
	       	<img src="${baseURL}/themes/default/icons/32X32/searchtool.gif" /><span>搜索</span>
	        <div class="togglebtn"></div> 
	    </div>
	    <div style="margin-top: 4px; margin-bottom: 4px;" class="navline"></div>
	    <div class="searchbox">
	        <form id="formsearch" name="formsearch" class="l-form" method="get" >
				<table cellpadding="0" cellspacing="1" class="l-table-edit" >
		            <tr>
		                <td align="right" class="l-table-edit-td">编码:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		               		<input name="code" type="text" id="code" ltype="text" class="field" /></td>
		                <td align="right" class="l-table-edit-td">名称:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<input name="name" type="text" id="name" ltype="text" class="field" /></td>
		                <td align="left" class="l-table-edit-td">
		                	<input type="button" value="搜索" id="btnSearch" class="l-button l-button-submit" /> 
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
   	$("#formsearch").ligerForm();
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
	        columns: [
	          {display:"排序号",name:"priority",width:50,type:"number",align:"center",isSort : true},
	          {display:"编码",name:"code",width:150,type:"text",align:"left",isSort : true},
	          {display:"菜单名称",name:"name",width:150,type:"text",align:"center",isSort : true},
	          {display:"URL",name:"url",width:220,type:"text",align:"center",isSort : false},
	          {display:"小图标路径",name:"smallIcon",width:220,type:"text",align:"center",isSort : false},
	          {display:"大图标路径",name:"bigIcon",width:220,type:"text",align:"center",isSort : false},
	          {display:"更新时间",name:"updateTime",width:150,type:"text",align:"center",isSort : true,
	        	  options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
	          {display:"更新人",name:"fieldName2",width:80,type:"int",align:"center",isSort : false}
	       	],
          dataAction: 'server',toolbar: {}, title:'[${parentForm.fullName}]下的菜单列表',showTitle:true,headerImg: '${baseURL}/themes/default/icons/silkicons/house_link.png',
          url: '${baseURL}/moduledemo/fun3/fun3demolist/listJSON.do?pid=${parentForm.id}', sortName: 'code',
          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });
      //双击事件
      LG.setGridDoubleClick(grid, FF_ModifyClickEvent);

      //搜索事件
      $("#btnSearch").click(function(e){
    	  var json = LG.bulidFilterParams($("#formsearch"));
           grid.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		   grid.loadData();
      });
 
      //加载toolbar
      LG.createToolbarButton(grid, [{id : "add", name : "新增", clickEvent : FF_AddClickEvent, icon : "/silkicons/add.png"},
      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEvent, icon : "/silkicons/application_edit.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);

      //工具条事件
      //新增事件
      function FF_AddClickEvent(btnItem){
      		parent.f_addTab("fun3demoEdit", '示例3编辑', '${baseURL}/moduledemo/fun3/fun3demoedit/edit.do?menuId=${param.menuId}');
      }
       //修改事件
      function FF_ModifyClickEvent(btnItem){
      	var row = grid.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	parent.f_addTab("fun3demoEdit", '示例3编辑', '${baseURL}/moduledemo/fun3/fun3demoedit/edit.do?menuId=${param.menuId}&id=' + row.id);
      }
      //删除事件
      function FF_DeletedClickEvent(btnItem){
      	var selectedRow = grid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/fun3/fun3demodelete/delete.do",
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
     						 FF_Reload();
     						 alert('操作成功!');
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
              }
        });
      }
      //重置事件
      $("#btnReset").click(function(e){
           grid.set('parms', null);
            //采用原来的请求地址，带上参数加载数据
		   grid.loadData();
      });
      //一个重新加载数据方法，该方法主要作为外部框架调用使用
      function FF_Reload(){
    	  grid.loadData();
      }
  </script>
  </body>
  </html>
