<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/pub/head.inc"%>
    	<title>DEMO演示功能-分页列表11111111111</title>
	</head>
	<body>
		<!-- 这里定义了转发进入的TAB对应的菜单ID，也是TAB的属性ID值 -->
  		<input type="hidden" name="menuId" id="menuId" value="${param.menuId}"/>
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
			</div>
  		</div>
 		<!-- 表格列表 -->
		<div id="maingrid"></div> 
  		<script type="text/javascript">
	      	//列表结构
	      	var grid = $("#maingrid").ligerGrid({ 
		        columns: [
					{display:"排序号",name:"priority",width:50,type:"number",align:"center",isSort : true},
					{display:"编码",name:"code",width:100,type:"text",align:"center",isSort : true},
					{display:"名称",name:"name",width:150,type:"text",align:"center",isSort : true},
					{display:"创建时间",name:"createTime",width:150,type:"date",align:"center",isSort : true},
					{display:"创建人",name:"creatorName",width:80,type:"text",align:"center",isSort : true},
					{display:"字段1",name:"fieldName1",width:150,type:"text",align:"center",isSort : false},
				    {display:"字段2",name:"fieldName2",width:80,type:"int",align:"center",isSort : false},
					{display:"金额",name:"fieldName3",width:80,type:"number",align:"right",isSort : false},	
					{display:"字段4",name:"fieldName4",width:80,type:"long",align:"center",isSort : false}, 
					{display:"字段5",name:"fieldName5",width:150,type:"date",align:"center",isSort : false, 
					 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
			        ],
				dataAction: 'server',toolbar: {},
	          	url: '${baseURL}/moduledemo/fun1/fun1demolist/listJSON.do', sortName: 'code',
	          	width: '98%', height: '100%',heightDiff:-10, checkbox: true,
	          	pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
	          	rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          	sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
	      	});
	      	//双击事件
	      	LG.setGridDoubleClick(grid, FF_ModifyClickEvent);
	
		  	$("#createTimeStart").attr("readOnly",true);
		  	$("#createTimeEnd").attr("readOnly",true);
	
	      	//加载toolbar
	      	LG.createToolbarButton(grid, [{id : "add", name : "新增", clickEvent : FF_AddClickEvent, icon : "/silkicons/add.png"},
	      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEvent, icon : "/silkicons/application_edit.png"},
	      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);
	
	      	//新增事件
	      	function FF_AddClickEvent(btnItem){
	    		parent.f_addTab("fun1demoEdit", '示例1编辑', '${baseURL}/moduledemo/fun1/fun1demoedit/edit.do?menuId=${param.menuId}');
	   	  	}
	      	
	      	//修改事件
	      	function FF_ModifyClickEvent(btnItem){
	      		var row = grid.getLastSelected();
	      	 	if (!row) { alert("请先选择需要修改的行!"); return false;}
	      	 	parent.f_addTab("fun1demoEdit", '示例1编辑', '${baseURL}/moduledemo/fun1/fun1demoedit/edit.do?menuId=${param.menuId}&id=' + row.id);
	      	}
	      	
	      	//删除事件
	      	function FF_DeletedClickEvent(btnItem){
	      		var selectedRow = grid.getCheckedRows();
	      		if (!selectedRow || !selectedRow.length) {
	      			alert("请先选择需要删除的行!"); return false;
	      		}
	      		jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
	              	if (confirm){
	              		$.ajax({
		   					type: "GET",
		   					url: "${baseURL}/moduledemo/fun1/fun1demodelete/delete.do",
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
	  	  
	      	//一个重新加载数据方法，该方法主要作为外部框架调用使用
	      	function FF_Reload(){
				grid.loadData();
	      	}
		</script>
	</body>
</html>
