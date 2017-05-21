<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">

 	var childrenDetailsGrid = $("#childrenlist12").ligerGrid({ 
		columns: [
		          {display:"订单编号",name:"orderID",width:150,type:"text",align:"center",isSort : true},
		    {display:"商品名称",name:"goodsName",width:150,type:"text",align:"center",isSort : true},
		    {display:"销售商品数量",name:"goodsCount",width:150,type:"int",align:"center",isSort : false},
		    {display:"销售商品单价",name:"goodsMoney",width:150,type:"int",align:"center",isSort : false},
		    {display:"销售商品总价",name:"goodsSubMoney",width:150,type:"int",align:"center",isSort : false},
		    {display:"创建人",name:"creator",width:150,type:"text",align:"center",isSort : false},
		    {display:"创建日期",name:"createDate",width:150,type:"date",align:"center",isSort : false, 
		 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
			{display:"最后修改人",name:"lastUpdator",width:150,type:"long",align:"center",isSort : false}, 
			{display:"最后更新日期",name:"lastUpdateDate",width:150,type:"date",align:"center",isSort : false, 
			 		options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}}
		    ],
		usePager : false, title:'订单明细表',showTitle:true,
        url : '${baseURL}/moduledemo/demo12/children/demo12childlist/listJSON.do?ID=${id}',
        width: '100%', height: '100%',heightDiff:-50, checkbox: true,
        rowHeight:23,rownumbers:true,isScroll:false
	});
 		
	$("#toptoolbar12").ligerToolBar({ items: [
		{ text: '增加', id:'add', click: FF_AddClickEvent },
		{ text: '修改', id:'modify', click: FF_ModifyClickEvent },
		{ text: '删除', id:'delete', click: FF_DeletedClickEvent }
		]
	});
 	  	
 	//双击事件
 	LG.setGridDoubleClick(childrenDetailsGrid, FF_ModifyClickEvent);
	
 	//工具条事件
   	//新增事件
   	function FF_AddClickEvent(btnItem){
   		FF_ShowDialog(null, true);
   	}
 	 	
   	//修改事件
  	function FF_ModifyClickEvent(btnItem){
  		var row = childrenDetailsGrid.getLastSelected();
  		if (!row) {
  			alert("请先选择需要修改的行!"); 
  			return false;
  		}
  		
		FF_ShowDialog({
			id : row.id, goodsName : row.goodsName,
			goodsMoney : row.goodsMoney, goodsCount : row.goodsCount,
			goodsSubMoney : row.goodsSubMoney ,creator : row.creator,createDate : row.createDate,
      		lastUpdator : row.lastUpdator ,lastUpdateDate : row.lastUpdateDate
		}, false);
  	}
      	
   	//删除事件
   	function FF_DeletedClickEvent(btnItem){
		var selectedRow = childrenDetailsGrid.getCheckedRows();
  		if (!selectedRow || !selectedRow.length) {
  			alert("请先选择需要删除的行!"); 
  			return false;
  		}
     		
     	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
           	if (confirm){
            	$.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/demo12/children/demo12childdelete/delete.do",
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
     						 alert('操作成功!');
     					}else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				});
			}
		});
	}
</script>