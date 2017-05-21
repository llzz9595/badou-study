<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
 	var childrenDetailsGrid = $("#childrenlist").ligerGrid({ 
		columns: [
		    {display:"排序号",name:"priority",width:50,type:"number",align:"center",isSort : true},
		    //{display:"userid",name:"userid",width:50,type:"text",align:"center",isSort : true}, 
		    {display:"爱好",name:"playName",width:100,type:"text",align:"center",isSort : true},
		    {display:"描述",name:"playMs",width:80,type:"text",align:"center",isSort : false},
		    
		],
		usePager : false, title:'user子单列表',showTitle:true,
        url : '${baseURL}/moduledemo/user/children/userdemochildlist/listJSON.do?userid=${id}',
        width: '100%', height: '100%',heightDiff:-50, checkbox: true,
        rowHeight:23,rownumbers:true,isScroll:false
	});
 		
	$("#toptoolbar").ligerToolBar({ items: [
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
			pkId : row.id, priority : row.priority,
			playName : row.playName, playMs : row.playMs
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
   					url: "${baseURL}/moduledemo/user/children/userdemochilddelete/delete.do",
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