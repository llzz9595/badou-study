/**
 * 工作流程公用js调用方法，包括提交，归档，判断处理人等
 * @auth  xiangsf 2013-3-15
 */
$(function(){
	$(".l-route-btn").click(function(e){
		var routeId = $(this).attr("routeId");
		//获得页面上的保存按钮，如果有则触发一下保存
		if($(this).text()=='提交至销售员确认归档'){
			FF_SaveWareLogistics({callback : function(){
				WF_Submit(routeId);
			}});
		}else if($(this).text()=='提交仓库发货') {
			FF_SaveConfirm({callback : function(){
				WF_Submit(routeId);
			}});
		}else if($(this).text()=='提交财务部审核'){
			FF_SaveFLowOrder({callback : function(){
				WF_Submit(routeId);
			}});
		}else{
			WF_Submit(routeId);
		}
	});
});
function WF_Submit(routeId){
	var wlId = $("#worklistId").val();
	var flgFullScreen = $("#flgFullScreen").val();
	//if(WF_Valid()){
		$.ajax({
            cache: false,
            async: false,
            url: baseURL+"/process/gtasks/submit/next.do",
            data: {worklistId: wlId, routeId: routeId},
            dataType: 'json', type: 'get',
            beforeSend: function (){
		       LG.loading = true;
		       LG.showLoading('正在处理中...请稍候');
		       if(WF_Valid() && window.confirm("您确定要提交当前表单吗?")){
		    	   return true;
		       }
		       return false;
		    },
		    complete: function (){
		       LG.loading = false;	  
		       LG.hideLoading();
		    },
            success: function (result)
            {
                if(result && result.hasOk){
                	alert("操作成功!");
                	if(flgFullScreen && flgFullScreen == 'true'){
                		if(window.opener && !window.opener.closed) {
                			window.opener.location.reload();
                		}
                		window.close();
                	}else {
                		LG.closeCurrentTab();
                	}
                }else{
                	alert("操作失败!失败信息如下:\n"+result.message+"\n如您对以上信息有疑问，请联系管理人员!");
                }
            }
        });
	//}else{//弹出选人框
		
	//}
}
function WF_triggerSave(options){
	$(".l-dialog-btn").each(function(){
		if($.trim($(this).html()).indexOf("保存")>-1){
			
		}
	});
	
}
/**
 * 提交过程中验证
 * 如果已提交则提示并闭窗口
 * 如果没有处理人则弹出选人框
 */
function WF_Valid(){
		var validFlag = false;
		var wlId = $("#worklistId").val();
		var flgFullScreen = $("#flgFullScreen").val();
		 $.ajax({
            cache: false,
            async: false,
            url: baseURL+"/process/gtasks/submit/valid.do",
            data: {"worklistId": wlId},
            dataType: 'json', type: 'get',
            success: function (result)
            {
                if(result && result.hasOk && result.tip == 'SUCCESS'){
                	validFlag = true;
                }else if(result.hasOk && result.tip == 'ERROR'){
                	LG.loading = false;	  
 			        LG.hideLoading();
                	alert(result.message);
                	if(flgFullScreen && flgFullScreen == 'true'){
                		window.close();
                	}else{ 
                		LG.closeCurrentTab();
                	}
                }
            }
        });
	return validFlag;
}