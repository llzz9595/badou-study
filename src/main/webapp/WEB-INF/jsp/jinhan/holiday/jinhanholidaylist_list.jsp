<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/pub/head.inc"%>
    	<title>查看请假状态</title>
	</head>
	<body>
  		<input type="hidden" name="menuId" id="menuId" value="${param.menuId}"/>
  		<!-- 搜索表单 -->
  		<div id="mainsearch" style=" width:98%">
    		<div class="searchbox">
	        	<form id="formsearch" class="l-form" method="get">
			        <table cellpadding="0" cellspacing="1" class="l-table-edit" >
			            <tr>
			                <td align="right" class="l-table-edit-td">起始时间</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="periodb" name="periodb"  ltype="date" class="field" style="margin-left: 2px;width: 160px"/>
			                </td>
			                <td align="right" class="l-table-edit-td"  style="padding-left: 30px">终止时间</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="periode" name="periode" ltype="date"  class="field"  style=" margin-left:2px;width: 160px"/>
			                </td>
			                </tr>
			                <tr>
			                <td align="right" class="l-table-edit-td"  style="padding-left: 30px">名字</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="membername" name="membername"  class="field" value="" style=" margin-left:2px;width: 160px"/>
			                </td>
			       
			                 <td align="right" class="l-table-edit-td"  style="padding-left: 30px">请假天数</td>
			                <td align="left" class="l-table-edit-td" >
								<input type="text" id="days" name="days"  class="field" ltype="text" style=" margin-left:2px;width: 160px" />
			                </td>
			                 <td align="right" class="l-table-edit-td"  style="padding-left: 30px">审核状态</td>
			                <td align="left" class="l-table-edit-td" >
			               		 <select name="agreeFlag" class="field">
								<option value="0">审核中</option>
								<option value="1">已审核</option>
								</select>
			                </td>
			                <td align="left" class="l-table-edit-td" style="padding-left: 30px">
								<input type="button" value="查找" id="btnSearch"  class="l-button l-button-submit"  /> 
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
		                  {display:"id",name:"id",width:150,type:"text",align:"center",isSort : true},
				   {display:"请假创建时间",name:"createTime",width:150,type:"date",align:"center",isSort : true},
					{display:"姓名",name:"memberName",width:100,type:"text",align:"center",isSort : true},
					{display:"部门",name:"memberPart",width:100,type:"text",align:"center",isSort : true},
					{display:"请假起始时间",name:"periodb",width:150,type:"date",align:"center",isSort : true},
					{display:"请假终止时间",name:"periode",width:150,type:"date",align:"center",isSort : true},
					{display:"请假天数",name:"days",width:50,type:"number",align:"center",isSort : true},
					{display:"请假理由",name:"reasonName",width:100,type:"text",align:"center",isSort : true},
					{display:"审核",name:"agreeName",width:100,type:"text",align:"center",isSort : true},
					{display:"HR意见",name:"agreeAdviceh",width:100,type:"text",align:"center",isSort : true},
					{display:"经理意见",name:"agreeAdvicej",width:100,type:"text",align:"center",isSort : true},
			        ],
				dataAction: 'server',toolbar: {},
	          	url: '${baseURL}/jinhan/holiday/jinhanholidaylist/listJSON.do', sortName: 'createTime',
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
	      	LG.createToolbarButton(grid, [
										{id : "add", name : "新增", clickEvent : FF_AddClickEvent, icon : "/silkicons/add.png"},
	      								{id : "modify", name : "查看详情", clickEvent : FF_ModifyClickEvent, icon : "/silkicons/application_edit.png"},
	      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);
	
	      	//修改事件
	      	function FF_ModifyClickEvent(btnItem){
	      		var row = grid.getLastSelected();
	      	 	if (!row) { alert("请先选择需要查看的行!"); return false;}
	      	 	parent.f_addTab("fun1demoEdit", '查看请假单', '${baseURL}/jinhan/holiday/jinhanholidayedit/edit.do?id=' + row.id);
	      	}
	      	
	     	//新增事件
	      	function FF_AddClickEvent(btnItem){
	    		parent.f_addTab("fun1demoEdit", '增加请假单', '${baseURL}/jinhan/holiday/jinhanholidayedit/show.do');
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
		   					url: "${baseURL}/jinhan/holiday/jinhanholidaydelete/delete.do",
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
