<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 明细与列表在同一个页面 -->
<div id="detail" style="display:none;">
 	<form id="formdetail" name="formdetail" method="post">
 		<input type="hidden" name="SDdetail_fun1DemoId" id="SDdetail_fun1DemoId"  value="${id}"/>
 		<input type="hidden" name="SDdetail_id" id="SDdetail_id"  value=""/>
 	</form>
</div>
<script type="text/javascript">
	//编辑，新增弹出框
	var detailWin = null, curentData = null, currentIsAddNew;
	var formdetail = $("#formdetail");
	function FF_ShowDialog(data, isAddNew)
	{
		curentData = data;
		currentIsAddNew = isAddNew;
		if (detailWin){
			detailWin.show(); 
		}else{
			//创建表单结构, 这里的字段命名为了与同其它地方区分，加了SDdetail_前缀，后台获取数据时也得去掉前缀(若明细与列表不在同一页面时，可不用)
			formdetail.ligerForm({ 
            	fields: [
             { name: "id", type: "hidden" },		
             {display:"订单编号",name:"orderID",width:150,type:"text",align:"center",isSort : true},
             {display:"商品名称",name:"SDdetail_goodsName",width:150,type:"text",align:"center",isSort : true},
		    {display:"销售商品数量",name:"SDdetail_goodsCount",width:150,type:"int",align:"center",isSort : false},
		    {display:"销售商品单价",name:"SDdetail_goodsMoney",width:150,type:"int",align:"center",isSort : false},
		    {display:"销售商品总价",name:"SDdetail_goodsSubMoney",width:150,type:"int",align:"center",isSort : false},
		    {display:"创建人",name:"SDdetail_creator",width:150,type:"text",align:"center",isSort : false},
		    {display:"创建日期",name:"SDdetail_createDate",width:150,type:"date",align:"center",isSort : false, 
		 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
			{display:"最后修改人",name:"SDdetail_lastUpdator",width:150,type:"long",align:"center",isSort : false}, 
			{display:"最后更新日期",name:"SDdetail_lastUpdateDate",width:150,type:"date",align:"center",isSort : false, 
			 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}}
         		],
                toJSON: JSON2.stringify
			});

			detailWin = $.ligerDialog.open({
				title: '示例1子单编辑',
				target: $("#detail"),
				width: 400, height: 300,top:10,
				buttons: [
					{ text: '保存', onclick: function () { FF_DetailSave(); } },
					{ text: '取消', onclick: function () { detailWin.hide(); } }
				]
			});
		}
		if(curentData)
		{
			$("#id").val(curentData.Id);
            $("#orderID").val(curentData.orderID);
            $("#SDdetail_goodsName").val(curentData.SDdetail_goodsName);
            $("#SDdetail_goodsCount").val(curentData.SDdetail_goodsCount);
            $("#SDdetail_goodsMoney").val(curentData.SDdetail_goodsMoney);
            $("#SDdetail_goodsSubMoney").val(curentData.SDdetail_goodsSubMoney);
          
            $("#SDdetail_lastUpdator").val(curentData.SDdetail_lastUpdator);
		}else{
			$("#SDdetail_priority").val(1);
		}
	}
	
    jQuery.metadata.setType("attr", "validate"); 
	LG.validate(formdetail);
	
	function FF_DetailSave(){
		formdetail.attr("action","${baseURL}/moduledemo/demo12/children/demo12childsave/save.do");
		LG.submitForm(formdetail, function (data) {
			if (data && data.hasOk) {  
				childrenDetailsGrid.loadData();
					detailWin.hide();
					alert('操作成功!');
			} else { 
				alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
			}
		});
	}
</script>
