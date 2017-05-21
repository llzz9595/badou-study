<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<title>User功能演示</title>
	<script src="/main/webapp/jsjquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	
</head>
<body style="padding-bottom: 31px;">

	<div id="tabcontainer" style="margin: 3px;">
		 <div title="基本信息" tabid="mainTab">
	        	<form id="scenform" method="post">
	        	   <input name="id" type="hidden" id="id" value="${id}" />
				<table cellpadding="0" cellspacing="0" class="l-table-edit">
					<tr height="40">
						<td align="right"><font color="red">*</font>名称：</td>
						<td align="left" ><input name="name" type="text" class="field"
							id="name"validate="{required:true,minlength:1,maxlength:50}" value="" /></td>
					</tr>
					<tr height="40">
						<td align="right"><font color="red">*</font>年龄：</td>
						<td align="left" ><input name="age" type="text" class="field"
							id="age"validate="{required:true,digits:true, min: 0,max: 120}" value="" /></td>
					</tr>
					<tr height="40">
						<td align="right"><font color="red">*</font>电话：</td>
						<td align="left"><input name="photo" type="text" class="field"
							id="photo" validate="{required:true,minlength:1,maxlength:30}"
							value="" /></td>
					</tr>
					<tr height="40">
						<td align="right"><font color="red">*</font>性别：</td>
						<td align="left" ><input name="sex" type="radio" 
							 value="1" checked="checked"/>男
							<input name="sex" type="radio"
							 value="0" />女</td>
					</tr>
	        	   <tr height="40">
						<td align="right">地址：</td>
						<td align="left"><input name="address" type="text" class="field"
							id="address" validate="{required:true,minlength:1,maxlength:100}"
							value="" /></td>
					</tr>
				</table>
	        	</form> 
	     	</div>
        <div title="子表单列表信息" tabid="childrenTab">
				<div id="toptoolbar"></div> 
				<div id="childrenlist" style="margin:2px auto;"></div>
			</div>
       
	</div>
	
	<script type="text/javascript">
  var isEdit = true;
  var childrenDetailsGrid = $("#childrenlist").ligerGrid({ 
      columns: [
      {display:"排序号",name:"priority",width:300,type:"text",align:"center",isSort : false},
      //{display:"userid",name:"userid",width:50,type:"text",align:"center",isSort : true}, 
      {display:"爱好",name:"playName",width:150,type:"text",align:"center",isSort : false},
      {display:"描述",name:"playMs",width:150,type:"text",align:"center",isSort : false,},
      ],
	  dataAction: 'server',usePager : false,toolbar: {},
      url : '${baseURL}/moduledemo/user/children/userdemochildlist/listJSON.do',
      width: '100%', height: '88%',heightDiff:-10, checkbox: true,
      rowHeight:23,rownumbers:true,isScroll:true
  });
  
  	if(isEdit){
  		LG.createToolbarButton(childrenDetailsGrid, [
  		                      { name: '增加', id:'add', clickEvent: FF_AddClickEvent ,icon : "/silkicons/add.png"},
  		                    { name: '修改', id:'modify', clickEvent: FF_ModifyClickEvent ,icon : "/silkicons/application_edit.png"},
  		                    { name: '删除', id:'delete', clickEvent: FF_DeletedClickEvent ,icon : "/silkicons/delete.png"}
  		                ]);
	}
      
  	 
 	 //双击事件
      LG.setGridDoubleClick(childrenDetailsGrid, FF_ModifyClickEvent);
  	 //工具条事件
      //新增事件
      function FF_AddClickEvent(btnItem){
    	  $.ligerDialog.open({
  			url: '${baseURL}/moduledemo/user/children/userdemochildedit/edit.do',
  			height: 330,
  			title : "新增客户爱好",
  			width: 600,
  			buttons: [ 
  			    {   text: '保存', 
  					onclick: function (item, dialog) {
  						$(".l-dialog-btn").attr("style","display:none");
  						dialog.frame.FF_Save(function(data){
  							if(data.hasOk){
  								childrenDetailsGrid.loadData();
  								LG.showSuccess("操作成功!",function(){
  									dialog.close();
  								});
  							}
  							$(".l-dialog-btn").attr("style","display:block");
  						});
  					} 
  			    }, 
  				{ text: '取消', 
  					onclick: function (item, dialog) { dialog.close(); } } 
  			] 
  		  });
      }
       //修改事件
      function FF_ModifyClickEvent(btnItem){
      	var row = childrenDetailsGrid.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	$.ligerDialog.open({
			url: '/moduledemo/user/children/userdemochildedit/edit.do?menuId=${param.menuId}&id='+row.id,
			height: 330,
			title : "修改客户收货地址",
			width: 600,
			buttons: [ 
			    {   text: '保存', 
					onclick: function (item, dialog) {
						$(".l-dialog-btn").attr("style","display:none");
						dialog.frame.FF_Save(function(data){
							if(data.hasOk){
								childrenDetailsGrid.loadData();
								LG.showSuccess("操作成功!",function(){
  									dialog.close();
  								});
							}
							$(".l-dialog-btn").attr("style","display:block");
						});
					} 
			    }, 
				{ text: '取消', 
					onclick: function (item, dialog) { dialog.close(); } } 
			] 
		  });
      }
      //删除事件
      function FF_DeletedClickEvent(btnItem){
		var selectedRow = childrenDetailsGrid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "/moduledemo/user/children/userdemochildelete/delete.do",
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
     						childrenDetailsGrid.loadData();
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
              }
        });
      }
  </script>
	
	
	 <script type="text/javascript">
  		 var pkId = '${id}';
  		//tab样式
  		var tab = $("#tabcontainer").ligerTab();
  	    //表单底部按钮 
  	    LG.setFormDefaultBtn(FF_Cancel, FF_Save);
  	    
        function badousoft(){}
			badousoft.ajax=function(s){
			    jQuery.ajax(s);
		}
           
		//编辑，新增
        var mainform = $("#scenform");
/*         mainform.ligerForm({ 
            fields: [
					  { name: "id", type: "hidden" },
					  { display: "<span style='color: red;'>*</span>&nbsp姓名", name: "name", newline: true, labelWidth: 60, width: 240, space: 30, type: "text",
					    	validate: { required: true, maxlength: 32}},
					  { display: "<span style='color: red;'>*</span>&nbsp 年齡", name: "age", newline: true, labelWidth: 60, width: 240, space: 30, type: "int",
					        validate: {required: true,digits:true, min: 0,max: 120}},
					  { display: "<span style='color: red;'>*</span>&nbsp性别", name: "sex", newline: true, labelWidth: 60, width: 240, space: 30, type: "text",
						    validate: {required: true, maxlength: 1}},
					  { display: "&nbsp地址", name: "address", newline: true, labelWidth: 60, width: 240, space: 30, type: "text",
					        validate: {maxlength: 50}},
					  { display: "&nbsp电话", name: "photo", newline: true, labelWidth: 60, width: 240, space: 30, type: "text",
						        validate: {maxlength: 50}},
					 
					],
            toJSON: JSON2.stringify
        });  */
        
     	 //validate
	    jQuery.metadata.setType("attr", "validate"); 
	     LG.validate($("#scenform")); 
	     
	      
     	//save
	     function FF_Save(){
	        	  mainform.attr("action","${baseURL}/moduledemo/user/userdemosave/save.do?id=${id}");
	        	  LG.submitForm(mainform, function (data) {
	        		  var win = parent || window;
	                if (data && data.hasOk) {  
	                     LG.showSuccess('保存成功!');
	                     win.LG.closeAndReloadParent("userdemoEdit", "${param.menuId}");
	                     
	                } else { 
	     				LG.showError("保存失败:\n"+msg.message+"\nContract with Manager!");
	                }
	              });
	    }
    	 //Cancel
	    function FF_Cancel(){
	    	var win = parent || window;
	        win.LG.closeCurrentTab("userdemoEdit");
	    }
	     //After Loaded
	    function FF_AfterLoaded(){
	    		
	    } 

	</script> 
<script type="text/javascript">
     //加载数据
      LG.loadForm({mainForm: mainform, url:'${baseURL}/moduledemo/user/userdemoedit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
  </script>

<%@ include file="userdemoedit_child_detail.jsp"%>
</body>
</html>