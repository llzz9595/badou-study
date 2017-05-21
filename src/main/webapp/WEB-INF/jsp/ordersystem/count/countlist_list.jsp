<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>菜单表</title>
</head>
<body>
  <!-- 搜索表单 -->
  <div id="mainsearch" style=" width:98%">
	    <div class="searchtitle">
	        <span>搜索</span><img src="${baseURL}/themes/default/icons/32X32/searchtool.gif" />
	        <div class="togglebtn"></div> 
	    </div>
	    <div class="navline" style="margin-bottom:4px; margin-top:4px;"></div>
	    <div class="searchbox">
	        <form id="formsearch" class="l-form" method="post">
	        	<table cellpadding="0" cellspacing="1" class="l-table-edit" >
		           	 <tr>
		                <td align="right" class="l-table-edit-td">预订日期</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="order_Date" name="order_Date" ltype="date"  class="field" style="margin-left: 2px；"/>
		                </td>       
		                <td align="left" class="l-table-edit-td">
								<select  id="order_Time" name="order_Time" ltype="text" class="field" value="" style="margin-left: 2px;width:130px">
								    <option value="全天">全天</option>
									<option value="中午">中午</option>
				  					<option value="晚上">晚上</option>
				  					
								</select>
		                </td>     
						<td align="left" class="l-table-edit-td" >
								<input type="button" value="搜索" id="btnSearch" class="l-button l-button-submit"  /> 
						</td>	
						<td align="left" class="l-table-edit-td" style="padding-left: 40px">
								<input type="reset" value="重置" id="btnReset" class="l-button l-button-test"/> 
						</td>
		            </tr>   
	      	  </table>
	        </form>
    	</div>
  </div>
 <!-- 表格列表 -->
  <div id="maingrid"></div> 

 <script type="text/javascript">
 
 
	 $(function(){
	$(document).keypress(function(event){
		if (event.keyCode == 13) { // 13表示回车键
			FF_Search();
		}
	 });
     });
	 
	 
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
              columns: [
		          {display:"日期",name:"orderdate",width:150,type:"date",align:"center",isSort : true,
		        	  render : function(row){
		        		  var html ="";
		        		  html = row.orderdate+"&nbsp;&nbsp;&nbsp;&nbsp;"+row.ordertime;
		        		  return html;
		        	  },
		        	  options : {showTime:false, format: "yyyy-MM-dd"}},
		          {display:"人数",name:"workerId",width:80,type:"text",align:"center",isSort : true},
		          {display:"价格",name:"priceSum",width:80,type:"text",align:"center",isSort : true},
		          {display:"最后下单时间",name:"createTime",width:150,type:"date",align:"center",isSort : true
		          },
		          {display:"状态",name:"status",width:100,type:"text",align:"center",isSort : true}],
	          dataAction: 'server',toolbar: {},
	          url: '${baseURL}/ordersystem/count/countlist/historyJSON.do', sortName: 'code',
	          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
	          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
	          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });

      $("#formsearch").ligerForm();
      //加载toolbar
      LG.createToolbarButton(grid, [{id : "query", name : "查看订单", clickEvent : FF_QueryClickEvent_list, icon : "/silkicons/book_open.png"},
     								{id : "confirm", name : "确认下单", clickEvent : FF_ConfirmClickEvent, icon : "/silkicons/tick.png"},
                                    {id : "delete", name : "撤消下单", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/application_edit.png"}]);

	  //搜索事件
	      $("#btnSearch").click(function(e){
    	  var json = LG.bulidFilterParams($("#formsearch"));
    	  console.info(json);
          grid.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		  grid.loadData();
     		 });
	  
	  //重置事件
	      $("#btnReset").click(function(e){
	           grid.set('parms', null);
	            //采用原来的请求地址，带上参数加载数据
			   grid.loadData();
	      });
	     
      //查看事件
      function FF_QueryClickEvent_list(btnItem){
    	  var row = grid.getCheckedRows();
      	  if (!row || !row.length) { alert("请先选择需要修改的行!"); return false;}
      	  if (row.length>1) { alert("系统仅允许选择一条记录进行查看"); return false;}
    	  var time1  = encodeURI(row.ordertime);
		  var time = encodeURI(time1);
     	  parent.f_addTab("OrderList", '预订订单', '${baseURL}/ordersystem/count/orderlist/result.do?orderdate='+ row[0].orderdate +"&ordertime=" + time );
      } 
      
    //确定事件
      function FF_ConfirmClickEvent(btnItem){
    	  var row = grid.getCheckedRows();
      	  if (!row || !row.length) { alert("请先选择需要修改的行!"); return false;}
      	  if (row.length>1) { alert("系统仅允许选择一条记录进行确认"); return false;}
    	  var time1  = encodeURI(row.ordertime);
		  var time = encodeURI(time1);
		  if (row.status == "已确认"){ alert("该订单已确认！无须再确认"); return false;}
		  if (row.status == "已撤消"){ alert("该订单已撤消！不能再确认"); return false;}
    	  $.ajax({
					type: "POST",
					url: "${baseURL}/ordersystem/order/workersave/comfirm.do?orderdate="+ row.orderdate + "&ordertime=" + time,
					dataType : "json",
					data: "ordertime=" + time, 
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
						 grid.loadData();
						 alert('操作成功!');
						 //刷新
					}else{
						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
					}
					}
			 });
		  
      } 
      
      //撤消事件
      function FF_DeletedClickEvent(btnItem){
    	  var row = grid.getCheckedRows();
      	  if (!row || !row.length) { alert("请先选择需要修改的行!"); return false;}
      	  if (row.length>1) { alert("系统仅允许选择一条记录进行撤消"); return false;}
    	  var time1  = encodeURI(row.ordertime);
		  var time = encodeURI(time1);
		  if (row.status == "已确认"){ alert("该订单已确认！不能再撤消"); return true;}
		  if (row.status == "已撤消"){ alert("该订单已撤消！不能再撤消"); return false;}
    	  $.ajax({
					type: "POST",
					url: "${baseURL}/ordersystem/order/workersave/remove.do?orderdate="+ row.orderdate + "&ordertime=" + time,
					dataType : "json",
					 data: "ordertime=" + time, 
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
						 grid.loadData();
						 alert('操作成功');
						 //刷新
					}else{
						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
					}
					}
			 });
      } 
      
    
  </script>

</body>
</html>
