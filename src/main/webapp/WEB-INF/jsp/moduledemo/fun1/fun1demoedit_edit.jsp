<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/pub/head.inc"%>
	    <title>DEMO演示功能-弹出编辑框 </title>
	</head>
	<body style="padding-bottom:31px;">
		<div id="tabcontainer" style="margin:3px;">
	    	<div title="基本信息" tabid="mainTab">
	        	<form id="mainform" method="post"></form> 
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
					{ name: "id", type: "hidden" },
					{ display: "<span style='color: red;'>*</span>&nbsp编码", name: "code", newline: true, labelWidth:70, width: 240, space: 30, type: "text", 
							group:"基本信息",groupicon:"${baseURL}/themes/default/icons/32X32/communication.gif",validate: { required: true, maxlength: 32} },
					{ display: "<span style='color: red;'>*</span>&nbsp名称", name: "name", newline: true, labelWidth: 70, width: 240, space: 30, type: "text" ,
							validate: { required: true, maxlength: 50}},
					{ display: "<span style='color: red;'>*</span>&nbsp字段1", name: "fieldName1", newline: true, labelWidth: 70, width: 240, space: 30, type: "text",	
							validate: { required: true, maxlength: 32}},
					{ display: "&nbsp&nbsp&nbsp字段2", name: "fieldName2", newline: true, labelWidth: 70, width: 240, space: 30, type: "int",
							validate: { required: true,digits:true, min: 0, max: 100}},
					{ display: "&nbsp&nbsp&nbsp字段3", name: "fieldName3", newline: true, labelWidth: 70, width: 240, space: 30, type: "number",
							validate: { required: true, number:true, min: 0, max: 99999}},
					{ display: "&nbsp&nbsp&nbsp字段4", name: "fieldName4", newline: true, labelWidth: 70, width: 240, space: 30, type: "long",
							validate: { required: true, digits:true, min: 0, max: 5}},
					{ display: "&nbsp&nbsp&nbsp字段5", name: "fieldName5", newline: true, labelWidth: 70, width: 240, space: 30, type: "date",
							group:"其它信息",groupicon:"${baseURL}/themes/default/icons/32X32/communication.gif", options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
					{ display: "&nbsp&nbsp&nbsp字段6", name: "fieldName6", newline: true, labelWidth: 70, width: 240, space: 30, type: "textarea",
							validate: { required: false, maxlength:200}},
					{ display: "&nbsp&nbsp&nbsp排序号", name: "priority", newline: true, labelWidth: 70, width: 240, space: 30, type: "int",
							validate: { required: true, min: 0, max: 99999, digits:true}}
				],
                toJSON: JSON2.stringify
			});
            
      		//添加验证
     		jQuery.metadata.setType("attr", "validate"); 
     		LG.validate(mainform);
     		
			//保存
			function FF_Save(){
				mainform.attr("action","${baseURL}/moduledemo/fun1/fun1demosave/save.do?id=${id}");
				LG.submitForm(mainform, function (data) {
		        	var win = parent || window;
					if (data && data.hasOk) {  
						alert('操作成功!');
						win.LG.closeAndReloadParent("fun1demoEdit", "${param.menuId}");
	                } else { 
	                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
	                }
				});
    		}
			
     		//取消按钮，即关闭窗体
		    function FF_Cancel(){
		    	var win = parent || window;
		        win.LG.closeCurrentTab("fun1demoEdit");
		    }
     		
     		//加载完数据后，在页面设置某些值
     		function FF_AfterLoaded(){
				//do noting
     		}
     		
           	//加载数据
     		LG.loadForm(mainform, {url:'${baseURL}/moduledemo/fun1/fun1demoedit/editJSON.do?id=${id}'},FF_AfterLoaded);
  		</script>
  		<%@ include file="fun1demoedit_child_list.jsp"%>
  		<script type="text/javascript">
      		//加载表单数据
      		LG.loadForm({mainForm: mainform, detailForm: childrenDetailsGrid,childName : "children",
    	  			url:'${baseURL}/moduledemo/fun1/fun1demoedit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
  		</script>
		<%@ include file="fun1demoedit_child_detail.jsp"%>
	</body>
</html>