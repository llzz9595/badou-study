/**
 * 订单流程脚本，包括发起，提交等事件
 * @auth  xiangsf 2013-3-29
 */
$(function(){
	//提交发起流程
	$("#btnSubmit").click(function(e){
		if(!validBeforeStart() || !window.confirm("您确定要提交当前销售单吗?")) return false;
		var id = $("#id").val();
		var flowId = $("#flowId").val();
		var busiType = $("#busiType").val();
		var fromPage = $("#fromPage").val();
		FF_SaveFLowOrder({callback: function(msg){
				if (msg && msg.hasOk) { 
					LG.ajax({
			            type: 'AjaxSystem',
			            url: baseURL+'/startFlow.do1',
			            data: { businessObjectId: id, flowId : flowId, busiType : busiType },
			            loading : '正在处理中...请稍候',
			            success: function (result)
			            {
			                if(result && result.hasOk){
			                	alert("操作成功!");
			                	if(window.opener && !window.opener.closed && fromPage == 'myorderlist') {
				                			window.opener.location.reload();
				                }
			                	window.close();
			                }else{
			                	alert(result.message);
			                }
			            }
			        });
				}else {
					if(msg.tip == 'FAIL')
						alert("操作失败!失败信息如下:\n" + msg.message
							+ "\n如您对以上信息有疑问，请联系管理人员!");
					else
						alert(msg.message);
				}
			}
		});
	});
	//销售人员重处理时的保存事件
	$("#btnSave1").click(function(e){
		var orderId = $("#id").val();
		var fromPage = $("#fromPage").val();
		FF_SaveFLowOrder({callback: function(msg){
			if (msg && msg.hasOk) { 
				alert('操作成功!');
			} else {
				alert("操作失败!失败信息如下:\n" + msg.message
						+ "\n如您对以上信息有疑问，请联系管理人员!");
			}
		}});
	});
	//保存发货时间事件
	$("#btnSaveDeliver").click(function(e, isSubmit){
		FF_SaveConfirm({isClose : false});
	});
	
	//保存发货时间并关闭事件
	$("#btnSaveDeliverClose").click(function(e){
		FF_SaveConfirm({isClose : true});
	});
	
	//保存仓管人员物流信息
	$("#btnWareLogisSave").click(function(e){
		FF_SaveWareLogistics({isClose : false});
	});

	//保存仓管人员物流信息并关闭
	$("#btnWareLogisSaveClose").click(function(e){
		FF_SaveWareLogistics({isClose : true});
	});
	//保存并关闭事件
	$("#btnSaveClose1").click(function(e){
		var fromPage = $("#fromPage").val();
		FF_SaveFLowOrder({callback: function(msg){
			if (msg && msg.hasOk) {
				alert('操作成功!');
				window.close();
			} else {
				alert("操作失败!失败信息如下:\n" + msg.message
						+ "\n如您对以上信息有疑问，请联系管理人员!");
			}
		}});	
	});
});
//确定发货时间保存
function FF_SaveConfirm(options){
	var orderId = $("#id").val();
	if(validBeforeFlowSave()){
		$("#form1").attr("action",baseURL+"/order/flow/node/reviseorder/confirmSave.do");
		LG.submitForm($("#form1"),
			function(data) {
				if (data && data.hasOk) { 
					if($.isFunction(options.callback)) {
						options.callback();
					}else{
						alert('操作成功!');
						if(options.isClose) window.close();
					}
				} else {
					alert("操作失败!失败信息如下:\n" + data.message
							+ "\n如您对以上信息有疑问，请联系管理人员!");
				}
			});
	}
}
//验证数据
function validBeforeStart(){
	var len = grid.data.Total;
	if(len == 0) {
		alert("当前销售单还没有添加商品!");
		return false;
	}
	var rows = grid.data.Rows;
	for(var i = 0; i < rows.length; i++){
		if(rows[i].goodsNum <= 0){
			alert("商品["+rows[i].goodsCode+"]数量不可少于等于0!");
			return false;
		}
	}
	//新增的话，则不需要验证其它的了
	var id = $("#id").val();

	var valigFlag = false;
	
	//检查状态，比如提交了但还没有关闭当前窗口，以防止错误操作
	 $.ajax({
        cache: false,
        async: false,
        url: baseURL+"/order/flow/orderstart/valid.do?orderId="+id,
        data: $("#form1").serialize(),
        dataType: 'json', 
        type: 'post',
        beforeSend: function (p)
        {
            LG.loading = true;
            LG.showLoading("正在处理中...请稍候");
        },
        complete: function ()
        {
            LG.loading = false;
            LG.hideLoading();
        },
        success: function (result)
        {
            if(result && result.hasOk){
            	valigFlag = true;
            }else{
            	alert(result.message);
            	if(result.tip == 'FAIL') window.close();
            }
        }
    });
	return valigFlag;
};
//保存前验证数据
function validBeforeFlowSave(){
	var valigFlag = false;
	var id = $("#id").val();
	//检查状态，比如提交了但还没有关闭当前窗口，以防止错误操作
	 $.ajax({
        cache: false,
        async: false,
        url: baseURL+"/order/flow/node/reviseorder/valid.do",
        data: {orderId: id},
        dataType: 'json', type: 'get',
        success: function (result)
        {
            if(result && result.hasOk){
            	valigFlag = true;
            }else{
            	alert(result.message);
            	if(result.tip == 'FAIL') window.close();
            }
        }
    });
	return valigFlag;
}
//发货时保存
function FF_SaveWareLogistics(options){
	var orderId = $("#id").val();
	if(validBeforeFlowSave()){
		$("#form1").attr("action",baseURL+"/order/flow/node/warehouseorder/logisticsSave.do");
		LG.submitForm($("#form1"),
			function(data) {
				if (data && data.hasOk) {
					if($.isFunction(options.callback)) {
						options.callback();
					}else{
						alert('操作成功!');
						if(options.isClose) window.close();
					}
				} else {
					alert("操作失败!失败信息如下:\n" + data.message
							+ "\n如您对以上信息有疑问，请联系管理人员!");
				}
			});
	}
}
//订单保存
function FF_SaveFLowOrder(options){
	if(validBeforeSave()){
		$("#form1").attr("action",baseURL+"/order/ordersave/save.do?valid=true");
		LG.submitForm($("#form1"),
			function(data) {
				options.callback(data);
			});
	}
	return false;
}