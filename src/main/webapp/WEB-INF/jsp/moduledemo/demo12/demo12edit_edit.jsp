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
				<div id="toptoolbar12"></div> 
				<div id="childrenlist12" style="margin:2px auto;"></div>
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
					{display:"订单标题",name:"orderTitle",width:150,type:"text",align:"center",isSort : true},
					{display:"订单编号",name:"orderNo",width:150,type:"text",align:"center",isSort : true},
					{display:"所属销售人员名称",name:"salmon",width:150,type:"text",align:"center",isSort : true},
					{display:"顾客",name:"customerName",width:150,type:"text",align:"center",isSort : true},
					{display:"顾客电话号码",name:"customerPhoneNum",width:150,type:"text",align:"center",isSort : false},
				    {display:"创建人",name:"creator",width:150,type:"text",align:"center",isSort : false},
				    {display:"创建日期",name:"createDate",width:150,type:"date",align:"center",isSort : false, 
				 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
					{display:"最后修改人",name:"lastUpdator",width:150,type:"long",align:"center",isSort : false}, 
					{display:"最后更新日期",name:"lastUpdateDate",width:150,type:"date",align:"center",isSort : false, 
					 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}}
				],
                toJSON: JSON2.stringify
			});
            
      		//添加验证
     		jQuery.metadata.setType("attr", "validate"); 
     		LG.validate(mainform);
     		
			//保存
			function FF_Save(){
				mainform.attr("action","${baseURL}/moduledemo/demo12/demo12save/save.do?id=${id}");
				LG.submitForm(mainform, function (data) {
		        	var win = parent || window;
					if (data && data.hasOk) {  
						alert('操作成功!');
						win.LG.closeAndReloadParent("demo12Edit", "${param.menuId}");
	                } else { 
	                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
	                }
				});
    		}
			
     		//取消按钮，即关闭窗体
		    function FF_Cancel(){
		    	var win = parent || window;
		        win.LG.closeCurrentTab("demo12Edit");
		    }
     		
     		//加载完数据后，在页面设置某些值
     		function FF_AfterLoaded(){
				//do noting
     		}
     		
           	//加载数据
     		LG.loadForm(mainform, {url:'${baseURL}/moduledemo/demo12/demo12edit/editJSON.do?id=${id}'},FF_AfterLoaded);
  		</script>
  		<%@ include file="demo12edit_child_list.jsp"%>
  		<script type="text/javascript">
      		//加载表单数据
      		LG.loadForm({mainForm: mainform, detailForm: childrenDetailsGrid,childName : "children",
    	  			url:'${baseURL}/moduledemo/demo12/demo12edit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
  		</script>
		<%@ include file="demo12edit_child_detail.jsp"%>
	</body>
</html>