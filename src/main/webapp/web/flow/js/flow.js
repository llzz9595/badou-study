/*****************************************************************************/
/******待办操作JS方法类
/******提供提交下一环节，回退上一环节，传阅，转办等公共方法
/******修改时间: 2010-05-18 
/******修改人: xsf
/******
/*****************************************************************************/
/*
	批量提交下一步
*/
function FF_Submit(routeId){
	//var flag = isSubmit();
	if(!checkView(routeId)){
		return ;
	}
	var ids = getAllCheckedSplit('id',';'); 
	if(ids=="") {
		alert("请您选择要提交的记录!");
		return;
	}
	var obj = new Object();
	obj.ids = ids;
	obj.boIds = ev_boId('id');
	var url = "";
	var batchId = getColVal('batchId');
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');
	if(batchId==""||flowCode==""||nodeCode==""||flgFullScreen==""){
		return ;
	}
  	if(ids.split(";").length==1){
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&resourceId="+obj.boIds+"&nodeCode="+nodeCode+"&isAll=0";
  	}else{
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&isAll=1";
  	}
  	var value = window.showModalDialog(url,obj,"dialogHeight:700px;dialogWidth:850px;status=1");
  	if(value=="ok"){
  		if(window.opener==null||window.opener==undefined){
  			location.href = context+"/listUndoWorklist.do?batchId="+batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&flgFullScreen="+flgFullScreen;
  		}else{
	  		try{
	  			window.opener.location.reload();
	  		}catch(e){	}
	  		window.close();
  		}
  	}
}
/*
	单独提交下一步
*/
function FF_SingleSubmit(routeId){
if(!checkView(routeId)){
	return ;
}
var ids = document.getElementById("worklistItemId").value;
var obj = new Object();
obj.ids = ids;
obj.boIds = ev_boId('id');
var batchId = getColVal('batchId');
var flowCode = getColVal('flowCode');
var nodeCode = getColVal('nodeCode');
var flgFullScreen = getColVal('flgFullScreen');

var url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&isAll=1";
	
	var value = window.showModalDialog(url,obj,"dialogHeight:700px;dialogWidth:850px;status=1");
	if(value=="ok"){
		if(window.opener==null||window.opener==undefined){
			location.href = context+"/listUndoWorklist.do?batchId="+batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&flgFullScreen="+flgFullScreen;
		}else{
	  		try{
	  			window.opener.location.reload();
	  		}catch(e){	}
  			window.close();
		}
	}
}
/*
	批量流程提交归档
*/
function FF_Archive(routeId){
	//var flag = isSubmit();
	if(!checkView(routeId))
		return ;
	var ids = getAllCheckedSplit('id',';');
  	if(ids=="") {alert("请您选择要归档的记录!");return;}
  	var obj = new Object();
  	obj.ids = ids;
  	var url = "";
  	var boIds = ev_boId('id');
  	obj.boIds = boIds;
  	
  	var batchId = getColVal('batchId');
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');
	if(batchId==""||flowCode==""||nodeCode==""||flgFullScreen==""){
		return ;
	}
	
  	if(ids.split(";").length==1){
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&resourceId="+boIds+"&nodeCode="+nodeCode+"&type=archive&isAll=0";
  	}else{
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&type=archive&isAll=1";
  	}
  	var value = window.showModalDialog(url,obj,"dialogHeight:700px;dialogWidth:850px;status=off");
  	if(value=="ok"){
  		if(window.opener==null||window.opener==undefined){
  			location.href = context+"/listUndoWorklist.do?batchId="+batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&flgFullScreen="+flgFullScreen;
  		}else{
	  		window.opener.location.reload();
	  		window.close();
  		}
  	}
}
/*
	单独流程提交归档
*/
function FF_SingleArchive(routeId){
	if(!checkView(routeId))
	return ;
	var ids = document.getElementById("worklistItemId").value;

	var obj = new Object();
	obj.ids = ids;
	var boIds = ev_boId('id');
	obj.boIds = boIds;
	
	var batchId = getColVal('batchId');
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');

	var	url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&type=archive&isAll=1";
	
	var value = window.showModalDialog(url,obj,"dialogHeight:700px;dialogWidth:850px;status=off");
	if(value=="ok"){
		if(window.opener==null||window.opener==undefined){
			location.href = context+"/listUndoWorklist.do?batchId="+batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&flgFullScreen="+flgFullScreen;
		}else{
	  		window.opener.location.reload();
	  		window.close();
		}
	}
}
/**
  * 回退路由
  **/
function FF_Back(routeId){
	if(!checkView(routeId))
		return ;
	var ids = getAllCheckedSplit('id',';');
  	if(ids=="") {alert("请您选择要提交的记录!");return;}
  	var obj = new Object();
  	obj.ids = ids;
  	var url = "";
  	var boIds = ev_boId('id');
  	obj.boIds = boIds;
  	
  	var batchId = getColVal('batchId');
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');
	if(batchId==""||flowCode==""||nodeCode==""||flgFullScreen==""){
		return ;
	}
	
  	if(ids.split(";").length==1){
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&resourceId="+boIds+"&nodeCode="+nodeCode+"&type=back&isAll=0";
  	}else{
  		url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&type=back&isAll=1";
  	}
  	var value = window.showModalDialog(url,obj,"dialogHeight:700px;dialogWidth:850px;status=off");
  	if(value=="ok"){
  		if(window.opener==null||window.opener==undefined){
  			location.href = context+"/listUndoWorklist.do?batchId="+batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&flgFullScreen="+flgFullScreen;
  		}else{
	  		window.opener.location.reload();
	  		window.close();
  		}
  	}
}
/**
  *	主要用于完整考核表视图,checkBox的boId属性
  */
function ev_boId(chkId){
	var chkId = document.getElementsByName(chkId);
	var ids="";
	for(i=0;i<chkId.length;i++){
		if(chkId[i].checked==true){
	    	if(ids==""){
	   			ids=chkId[i].boId;
	   		}else {
				ids = ids+","+chkId[i].boId;
			}
		}
  	}
   	return ids;
}

//在表单里面提交流程的时候会调用此方法，自动将父页面的选择框选中。
function autoSelect(boid){
	var chkId = document.getElementsByName("id");
	for(i=0;i<chkId.length;i++){
		if(chkId[i].boId==boid){
			chkId[i].checked = true;
		} else {
			chkId[i].checked = false;
		}
  	}
}

/*
	提交前的验证:
	1.判断是否汇聚环节的提交
*/
function isSubmit(){
	var handleWay = document.getElementById("handleWay");
	//1.判断是否汇聚环节的提交
	if(handleWay!=null&&handleWay.value == 7){//汇聚
		var ids1 = document.getElementsByName("id");
		var recFlowSize = getColVal('recFlowSize');
		if(recFlowSize==""){
			return ;
		}
		if(recFlowSize != ids1.length){
			alert("此批次中还有流程未走到当前环节!");	
			return false;
		}
		for(var i=0;i<ids1.length;i++){
			if(!ids1[i].checked){
				alert("请选择所有的记录!");
				return false;
			}
		}
	}
	return true;
}

/*
	传阅
*/
function FF_Spread(){
	var ids = getAllChecked('id');
	if(ids=="") {alert("请选择传阅记录！");return;}
	getAddressList('20','n','1','spreadHandlerName','spreadUserId');
	
	var spreadUserId = document.getElementById("spreadUserId");
	if(spreadUserId!=null&&spreadUserId.value.length>0){
		var url = context+"/spread.do?ids="+ids+"&spreadUserId="+spreadUserId.value;
		LoadAjaxContent(url,spreadMethod);
	}
}
/**
	传阅的回调方法
*/
function spreadMethod(){
	var spreadUserId = document.getElementById("spreadUserId");
	var spreadHandlerName = document.getElementById("spreadHandlerName");
	spreadUserId.value = "";
	spreadHandlerName.value = "";
	alert(Trim(this.request.responseText));
}

/**
	根据页面控件的name,获得控件的value
*/
function getColVal(cName){
	var c = document.getElementsByName(cName);
	if(c==null||c.length==0){
		alert(cName+"不能为空!");
		return "";
	}else{
		return c[0].value;
	}
}
/**
	转办
*/
function FF_Turning(){
	var flag = isSubmit();
	if(!flag)
		return ;
	var ids = getAllChecked('id');
	if(ids=="") {alert("请选择转办记录！");return;}
	var obj = new Object();
  	obj.ids = ids;
  	var boIds = ev_boId('id');
  	obj.boIds = boIds;
  	var nodeCode = getColVal('nodeCode');
  	var url = "";
  	if(ids.split(";").length==1){
  		url = context+"/flow/bo_options_transfer.jsp?nodeCode="+nodeCode+"&isAll=0";
  	}else{
  		url = context+"/flow/bo_options_transfer.jsp?nodeCode="+nodeCode+"&isAll=1";
  	}
  	var value = window.showModalDialog(url,obj,"dialogHeight:500px;dialogWidth:720px;status=off");
	if(value=="ok"){
  		location.reload();
  	}
}
function FF_ShowTip(tip){
	document.body.insertBefore("<script type=\"text/javascript\" >showPop(3,'系统提示','"+tip+"');</script>");
}
/**
  *	视图验证方法
  */
function checkView(){return true;}