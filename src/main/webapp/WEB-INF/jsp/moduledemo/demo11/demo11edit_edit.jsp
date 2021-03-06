<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<title>DEMO11-CRUD</title>
</head>
<body style="padding-bottom: 31px;">
	<form id="scenform" method="post" name="scenform">
		<div class="l-group l-group-hasicon">
			<img src="${baseURL}/themes/default/icons/32X32/communication.gif" />
			<span>列表编辑信息</span>
		</div>	
	</form>
	<script type="text/javascript">
  		var pkId = '${id}';
  		var tab = $("#tabcontainer").ligerTab();
  		
        function badousoft(){}
			badousoft.ajax=function(s){
			    jQuery.ajax(s);
		}	 
		var baseUrl = '${baseURL}/moduledemo/demo11/demo11';
           //button 
        LG.setFormDefaultBtn(FF_Cancel, FF_Save);

		var mainform = $("#scenform");
              mainform.ligerForm({ 
                  fields: [
                      { name: "id", type: "hidden" },
  				    
                      { display: "<span style='color: red;'>*</span>&nbsp订单标题", name: "orderTitle", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
					    	validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "<span style='color: red;'>*</span>&nbsp所属销售人员名称", name: "salmon", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
  				        	validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "&nbsp&nbsp&nbsp备注", name: "remark", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
  				            validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  				      { display: "&nbsp&nbsp&nbsp创建人", name: "creator1", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
  	  				            validate: { required: true,maxlength: 32,rangelength:[2,20] }},
  					  { display: "&nbsp&nbsp&nbsp创建日期", name: "createDate", newline: true, labelWidth: 100, width: 240, space: 30, type: "date",
  				        	options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
  				    
  	  		           { display: "&nbsp&nbsp&nbsp逻辑删除 标志位", name: "Flg_deleted", newline: true, labelWidth: 100, width: 240, space: 30, type: "int",
  	  	  				            validate: {digits:true, min: 0}},
  	  			      
       			  ],
                  toJSON: JSON2.stringify
              }); 
              
     	 //validate
	     jQuery.metadata.setType("attr", "validate"); 
	     LG.validate($("#scenform"));
     	//save
	     function FF_Save(){
	        	  mainform.attr("action",baseUrl+"save/save.do?id=${id}");
	        	  LG.submitForm(mainform, function (data) {
	        		  var win = parent || window;
	                if (data && data.hasOk) {  
	                     alert('保存成功!');
	                     win.LG.closeAndReloadParent("fun1demoEdit", "${param.menuId}");
	                } else { 
	     				alert("保存失败:\n"+msg.message+"\nContract with Manager!");
	                }
	              });
	    }
    	 //Cancel
	    function FF_Cancel(){
	    	var win = parent || window;
	        win.LG.closeCurrentTab("fun1demoEdit");
	    }
	     //After Loaded
	    function FF_AfterLoaded(){
	    		
	    }

	</script>

	<script type="text/javascript">
		 //load data
	      LG.loadForm({mainForm: mainform, url:baseUrl+'edit/editJSON.do?id=${id}',callback: FF_AfterLoaded});
	</script>
</body>
</html>