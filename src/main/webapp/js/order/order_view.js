/**
 * 订单视图脚本,包括页面添加商品，删除商品，导入客户，保存，导出excel等事件
 * @auth  xiangsf 2013-3-15
 */
$(function(){
	//运费，税费等文字改变事件，计算汇总值
	$(".total_money").change(function(e){
		FF_CalcTotal();
	});
	//保存事件
	$("#btnSave").click(function(e){
		var orderId = $("#id").val();
		var fromPage = $("#fromPage").val();
		
		FF_SaveOrder({callback: function(msg){
			if (msg && msg.hasOk) { 
				alert('操作成功!');
				if(orderId == ""){
					window.location.href = baseURL + "/order/orderedit/edit.do?id="+msg.bean.id+"&fromPage="+fromPage+"&"+Math.random();
					if(window.opener && !window.opener.closed && fromPage == 'myorderlist') {
            			window.opener.location.reload();
            		}
				}else{
					window.location.reload();
					if(window.opener && !window.opener.closed && fromPage == 'myorderlist') {
            			window.opener.location.reload();
            		}
				}
			} else {
				alert("操作失败!失败信息如下:\n" + msg.message
						+ "\n如您对以上信息有疑问，请联系管理人员!");
			}
		}});
	});
	
	//保存并关闭事件
	$("#btnSaveClose").click(function(e){
		var fromPage = $("#fromPage").val();
		FF_SaveOrder({callback: function(msg){
			if (msg && msg.hasOk) {
				alert('操作成功!');
				if(window.opener && !window.opener.closed && fromPage == 'myorderlist') {
                	window.opener.location.reload();
                }
				window.close();
			} else {
				alert("操作失败!失败信息如下:\n" + msg.message
						+ "\n如您对以上信息有疑问，请联系管理人员!");
			}
		}});	
	});
	//导出完整Excel事件
	$("#btnExportExcel").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		window.location.href = baseURL+"/order/export/orderexport/excel.do?orderId="+id;
		return false;
	});
	//导出标准Excel事件
	$("#btnExportStandardExcel").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		window.location.href = baseURL+"/order/export/orderexport/excelStandard.do?orderId="+id;
		return false;
	});
	//销售环节导出完整Excel事件
	$("#btnExportExcel1").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		window.location.href = baseURL+"/order/export/orderexport/excelRevise.do?orderId="+id;
		return false;
	});
	//销售环节导出标准Excel事件
	$("#btnExportStandardExcel1").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		window.location.href = baseURL+"/order/export/orderexport/excelReviseStandard.do?orderId="+id;
		return false;
	});
	//仓管人员导出标准Excel事件
	$("#btnExportExcel2").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		window.location.href = baseURL+"/order/export/orderexport/excelWarehouse.do?orderId="+id;
		return false;
	});
	//取消事件,即关闭当前窗口
	$("#btnCancel").click(function(e){
		if(confirm("您确定要关闭当前窗口吗?")){
			window.close();
		}
		return false;
	});
	//选择客户事件
	$("#btnSelectCustom").click(function(e){
		custom_open({onReturn: afterSelectCustom});
		return false;
	});
	//选定客户后事件
	function afterSelectCustom(result){
		if(result && result.length > 0){
			//只需要一个
			var c = result[0];
			$("#customerId").val(c.id);
			$("#customerName").val(c.name);
			$("#customerCompanyName").val(c.unit);
			$("#customerTel").val(c.tel);
			$("#receiveAddress").val(c.sendAddress);
			$("#receiver").val(c.receiver);
			$("#receiverTel").val(c.receiverTel);
		}
	}
	//选择客户地址事件
	$("#btnSelectCustomAddress").click(function(e){
		var customId = $("#customerId").val();
		if(!customId || customId.length == 0){ 
			alert("请先选择客户!");
			return false;
		}
		
		cusaddress_open({onReturn: afterSelectCustomAddr, customId: customId});
		return false;
	});
	//选定客户地址后事件
	function afterSelectCustomAddr(result){
		if(result && result.length > 0){
			var a = result[0];
			if(a){
				$("#receiveAddress").val(a.sendAddress);
				$("#receiver").val(a.receiver);
				$("#receiverTel").val(a.receiverTel);
			}
		}
	}
	//另存为新客户事件
	$("#btnNewCustom").click(function(e){
		var customerName = $("#customerName").val();
		if(customerName && customerName.length > 0){
			FF_ShowNewCustomDialog();
		}else{
			alert("请先填写客户信息!");
		}
		return false;
	});
	//另存为客户新地址事件
	$("#btnNewCusAddress").click(function(e){
		var customerId = $("#customerId").val();
		if(customerId && customerId.length == 0){
			alert("当前客户为新客户信息,请先保存,然后再试一次!");
			return false;
		}
		var form1 = $("#form1"); 
		      form1.attr("action",baseURL+"/custom/custom/address/customaddresssave/createAddressFromOrder.do");
        	  LG.submitForm(form1, function (data) {
                if (data && data.hasOk) {  
                     alert('操作成功!');
                } else { 
                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
                }
              });
	});
	//批量导入商品事件
	$("#btnImportGoods").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
	});
	//保存商品数量事件
	$("#btnSaveNums").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		var len = grid.rows;
		if(len <= 0){
			alert("请先选择添加商品,然后重试一次!");
			return false;
		}
		$("#form1").attr("action",baseURL+"/order/goods/ordergoodssave/saveNum.do?orderId="+id);
			LG.submitForm($("#form1"),
			function(data) {
				if (data && data.hasOk) {
					alert('操作成功!');
				} else {
					alert("操作失败!失败信息如下:\n" + data.message
							+ "\n如您对以上信息有疑问，请联系管理人员!");
				}
		});
	});
	//选择新增商品事件
	$("#btnNewGoods").click(function(e){
		var id = $("#id").val();
		if(id.length == 0){
			alert("请先保存销售单,然后重试一次!");
			return false;
		}
		sd.goods.selectGoods({callback : "afterSelectGoods"});
	});
	//导入商品
	$("#btnImpGoods").click(function(e){
		var orderId = $("#id").val();
		$.ligerDialog.open({ 
			url: baseURL + '/order/impt/ordergoodsimport/select.do?orderId=' + orderId,
			height: 200,
			width: 400,
			modal: true,    //是否模态对话框
			title: "商品批量导入"
		});
	});
	//删除商品事件
	$("#btnDelGoods").click(function(e){
		
		var selectedRow = grid.getCheckedRows();
		
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的商品!"); return false;}
      	var orderId = $("#id").val();
      	if(window.confirm('您确定删除选定的商品吗?')){
      		$.ajax({
   					type: "GET",
   					url: baseURL+"/order/goods/ordergoodsdelete/delete.do",
   					dataType : "json",
   					data: "ids=" + LG.serialIdParam(selectedRow),
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
     						 alert('操作成功!');
     						 grid.set('parms', {orderId : orderId});
     						 grid.loadData();
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
      	}
	});
	//模板中英文选择
	$("input[name='templateCode']").click(function(){
		var code = $(this).val();
		var id = $("#id").val();  
		var sourceCode = $("#templateCode").val();
		if(sourceCode == code) return false;
		var hasChange = FF_PageValueChange();
		if(id != '' || (id == '' && !hasChange) || (id == '' && hasChange && window.confirm("您尚未保存数据，切换模板后当前数据将丢失!\n您确定切换模板?"))){
			if(id == '') //新增
				window.location.href = baseURL+"/order/ordernew/edit.do?code="+code;
			else
				window.location.href = baseURL+"/order/orderedit/edit.do?id="+id+"&code="+code;
		}
	});
	//订单财务信息
	$("#moneyInfo").click(function(){
		var orderId = $("#id").val();
		$.ligerDialog.open({
			url: baseURL + '/order/funds/orderfundslist/list.do?orderId=' + orderId,
			height: 450,
			width: 500,
			modal: true,    //是否模态对话框
			title: "订单财务信息",
			buttons: [ 
				{ text: '保存', 
					onclick: function (item, dialog) {
						dialog.frame.FF_Save(function(){
							dialog.close();
							f_reload();
						});
					} },
				{ text: '取消', 
					onclick: function (item, dialog) { dialog.close(); } } 
			] 
		});
	});
});
//订单保存
function FF_SaveOrder(options){
	if(validBeforeSave()){
		$("#form1").attr("action",baseURL+"/order/ordersave/save.do?valid=false");
		LG.submitForm($("#form1"),
			function(data) {
				options.callback(data);
			});
	}
	return false;
}

	//计算汇总值
	function FF_CalcTotal(){
 		var totalPrice = parseFloat($("#goods_totalPrice").html());
 		var woodsMoney = parseFloat($("#totalAppendMoney").val());
 		var freightMoney = parseFloat($("#freightMoney").val());
 		var taxMoney = parseFloat($("#taxMoney").val());
 		var otherMoney = parseFloat($("#otherMoney").val());
		var tsum = totalPrice + woodsMoney + freightMoney + taxMoney + otherMoney;
		tsum = isNaN(tsum) ? 0 : parseFloat(tsum);
 		$("#totalSaleMoney").html($.formatMoney(tsum));
 		var deposit = parseFloat($("#deposit").val());
 		//var noPaid = tsum-deposit;
 		$("#totalSaleMoneyNoPaid").html($.formatMoney(Math.floor((tsum-deposit)*100))/100);
	}

//在选择新增商品后事件
function afterSelectGoods(goods){
		if(goods && goods.length > 0){//ajax请求保存数据
			var orderId = $("#id").val();
			$.ajax({
				type: "GET",
   				dataType : "json",
				url : baseURL+"/order/goods/ordergoodssave/save.do",
				data : {"orderId" : orderId, "goods": JSON2.stringify(goods)},
				beforeSend: function ()
	            {
					LG.loading = true;
					LG.showLoading('正在处理中...请稍候');
	            },
	            complete: function ()
	            {
	            	LG.loading = false;
	                LG.hideLoading();
	            },
				success : function(result){
					if(result && result.hasOk){
						alert("操作成功!");
						//直接刷新商品列表
						grid.set('url',baseURL + "/order/goods/ordergoodslist/listJSON.do");
				        grid.set('parms', {orderId : orderId});
				        //采用原来的请求地址，带上参数加载数据
						grid.loadData();
					}
				}
			});
		}
	return true;
}

function FF_Valid(options){
	var validFlag = false;
	$.ajax({
				type: "GET",
				async: false,
				cache: false,
   				dataType : "json",
				url : baseURL+options.url,
				data : options.data,
				success : function(result){
					if(result && result.hasOk){
						validFlag = true;
					}else if(result && !result.hasOk){
						alert(result.message);
					}
				}
			});
	 if(!validFlag){
		LG.loading = false;	  
	 	LG.hideLoading();
	 }
	return validFlag;
}
//保存前验证数据
function validBeforeSave(){
	var customerName = $("#customerName").val();
	if(customerName.length == 0){
		alert("请先填写客户信息,然后再试一次!");
		return false;
	}
	//必须有先选择客户,不是选定的则需要先保存
	var customerId = $("#customerId").val();
	if(customerId.length == 0){
		alert("当前客户为新客户信息,请先保存,然后再试一次!");
		return false;
	}
	//新增的话，则不需要验证其它的了
	var id = $("#id").val();
	if(id.length == 0) return true;//为新增
	
	var valigFlag = false;
	//检查状态，比如提交了但还没有关闭当前窗口，以防止错误操作
	 $.ajax({
        cache: false,
        async: false,
        url: baseURL+"/order/ordersave/valid.do",
        data: {orderId: id, customId : customerId},
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
function FF_PageValueChange(){
	return $.trim($("#customerId").val()) != '' || $.trim($("#customerName").val()) != '';
}


