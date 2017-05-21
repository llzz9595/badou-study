<%@ page language="java" pageEncoding="UTF-8"%>
  <script type="text/javascript">
  		var childrenDetailsGrid = $("#childrenlist").ligerGrid({ 
          columns: [
	          {display:"排序号",name:"priority",width:50,type:"number",align:"center",isSort : true},  
	          {display:"创建时间",name:"createTime",width:150,type:"date",align:"center",isSort : true},
	          {display:"创建人",name:"creatorName",width:80,type:"text",align:"center",isSort : true},
	          {display:"字段1",name:"pageType",width:150,type:"text",align:"center",isSort : false},
	          {display:"字段2",name:"targetWin",width:80,type:"text",align:"center",isSort : false}
	       ],
		  usePager : false,
          url : '${baseURL}/moduledemo/fun3/children/fun3demochildlist/listJSON.do?fun3DemoId=${id}',
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
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	FF_ShowDialog({
      		pkId : row.id, SDdetail_pageType : row.pageType,
      		SDdetail_targetWin : row.targetWin, priority : row.priority
      	}, false);
      }
      //删除事件
      function FF_DeletedClickEvent(btnItem){
		var selectedRow = childrenDetailsGrid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/fun3/children/fun3demochilddelete/delete.do",
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