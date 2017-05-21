<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<script type="text/javascript" src="${baseURL}/js/sdAppFrameworkCommon.js"></script>
	<script type="text/javascript" src="${baseURL}/js/util/numberutil.js"></script>
	<script type="text/javascript" src="${baseURL}/js/util/dateutil.js" ></script>
	
    <title>我的订单-${basePageTitle}</title>
</head>
<body>
	<!-- 这里定义了转发进入的TAB对应的菜单ID，也是TAB的属性ID值 -->
  <input type="hidden" name="menuId" id="menuId" value="${param.menuId}"/>
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
                <td align="center" class="l-table-edit-td" width="80px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*</span>菜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
                <td align="left" class="l-table-edit-td" colspan="2" >
                <input name="menuName" type="text" id="menuName" ltype="text" class="field" inputwidth="380" validate="{required:true}" /></td>
                
                <input name="price" id="price" inputWidth="200" type = "hidden" value=""/>
                <input name="restaurant" id="restaurant" inputWidth="200" type = "hidden" value=""/>
                <input name="CREATE_TIME" id="CREATE_TIME" inputWidth="200" type = "hidden" value=""/>
                
                <td align="left" class="l-table-edit-td" width="50" >
                	<input type="button" id="btnSelectCustom" value="选择" class="l-button" style="filter:alpha(opacity=90);" />
                </td>
			</tr>
			
			<tr>
				<td align="right" class="l-table-edit-td" style="width:75px" ><span style="color:red;">*</span>预定日期:</td>
                <td align="left" class="l-table-edit-td"  colspan="1">
                	<input name="orderDate" type="text" id="orderDate" inputWidth="200" ltype="date" validate="{required:true}" />
                </td>
                <td align="left" class="l-table-edit-td">
					<select  id="order_Time" name="order_Time" ltype="text" class="field" value="" style="margin-left: 2px;width:130px">
						<option value="中午">中午</option>
				  		<option value="晚上">晚上</option>
					</select>
		        </td>     
               
                <td align="right" class="l-table-edit-td"></td>
                <td class="l-table-edit-td" style="padding-left: 40px;">
                	<input type="button"  id="btnSave" value="预定我的饭饭" class="l-button" style="width:100px"/>
                </td>
                
                 <td align="left" class="l-table-edit-td">
                <input type="reset" value="重置" id="btnReset" class="l-button l-button-test"/> 
                </td>
            </tr>
            
            <tr>
                <td colspan="2"><span style="width:250px; color:red;font-size:16px">我预定的饭饭</span></td>
			</tr> 
            </table>
        </form>
    </div>
  </div>
 <!-- 表格列表 -->
<div id="maingrid">
   <input type="hidden"" name="id" id="id"/>
</div> 
  <script type="text/javascript">
  $(function(){
		$(document).keypress(function(event){
			if (event.keyCode == 13) { // 13表示回车键
				$("#btnSearch").click();
			}
		});
	});
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
          columns: [
          {display:"预定日期",name:"orderDate",width:200,type:"text",align:"center",isSort : true,format: "yyyy-MM-dd",
        	  render : function(row){
        		  var html ="";
        		  html = row.orderDate+"&nbsp;&nbsp;&nbsp;&nbsp;"+row.order_Time;
        		  return html;
        	  } 
          },  
          {display:"菜名",name:"menuName",width:350,type:"text",align:"center",isSort : false},
          {display:"价格",name:"price",width:50, type:"text",align:"center",isSort : false},
          {display:"所属快餐店",name:"restaurant",width:300, type:"tetx",align:"center",isSort : false},
          {display:"下单时间",name:"CREATE_TIME",width:200, type:"date",align:"center",isSort : true, format: "yyyy-MM-dd hh:mm:ss"}
          ],
          
          dataAction: 'server',toolbar: {},
          url: '${baseURL}/ordersystem/order/workerlist/listJSON.do', sortName: 'code',
          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });
//       LG.setFormDefaultBtn(FF_Save);
      //双击事件
      LG.setGridDoubleClick(grid, FF_ModifyClickEvent);
      var mainform = $("#formsearch");		//获取得到表单数据
      $("#formsearch").ligerForm();		//用ligerUI渲染
      
      jQuery.metadata.setType("attr", "validate"); 		//给<input>标签添加validate属性
   	  LG.validate(mainform);		//调用系统的验证方法
       //搜索事件
      $("#btnSearch").click(function(e){
    	  if(vaildDate()){
    		  alert("结束时间不能小于开始时间!");
				return false;
    	  };
    	  var json = LG.bulidFilterParams($("#formsearch"));
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
 	 
		$("#orderDateStart").attr("readOnly",true);
		$("#orderDateEnd").attr("readOnly",true);
      
		
	 //预定我的饭饭
	   $("#btnSave").click(function(e){
	        	  mainform.attr("action","${baseURL}/ordersystem/order/workersave/save.do?id=${id}");
	        	  LG.submitForm(mainform, function (data) {
	        		  var win = parent || window;
	                if (data && data.hasOk) {  
	                     alert('保存成功!');
	                     win.LG.closeAndReloadParent("WorkerEdit", "${param.menuId}");
	                } else { 
	     				alert("保存失败:\n"+msg.message+"\nContract with Manager!");
	                }
	              });
	    });
      //加载toolbar
      LG.createToolbarButton(grid, [
      								{id : "delete", name : "删除预定", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}
      								]);

	  
      //工具条事件
      //新增事件
      function FF_AddClickEvent(btnItem){
    	  $.openWindow({name : "orderWindow", url:"${baseURL}/order/ordernew/edit.do?menuId="+menuId+"&id=&fromPage=myorderlist&"+Math.random()});
      	 //parent.f_addTab("orderAdd", '订单新增', '${baseURL}/order/ordernew/edit.do?tid=&menuId=${param.menuId}');
      }
       //修改事件
      function FF_ModifyClickEvent(btnItem){
    	var menuId = $("#menuId").val();
      	var row = grid.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	$.openWindow({name : "orderWindow", url:"${baseURL}/order/orderedit/editOrder.do?menuId="+menuId+"&id="+(row.id)+"&fromPage=myorderlist&"+Math.random()});
      }
      
      //查看事件
      function FF_ViewEvent(btnItem){
    	var menuId = $("#menuId").val();
      	var row = grid.getLastSelected();
      	if (!row) { alert("请先选择需要查看的行!"); return false;}
      	$.openWindow({name : "orderWindow", url:"${baseURL}/order/orderedit/view.do?menuId="+menuId+"&id="+(row.id)+"&fromPage=myorderlist&"+Math.random()});
      }
      
      //删除事件
      function FF_DeletedClickEvent(btnItem){
      	var selectedRow = grid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/ordersystem/order/workerdelete/delete.do",
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
     						 FF_Reload();
     						 alert('操作成功!');
     					}else if(msg && msg.tip == 'ERROR'){
     						alert(msg.message);
     					} else{
     						alert("操作失败!失败信息如下:\n"+msg.message+"\n如您对以上信息有疑问，请联系管理人员!");
     					}
   					}
 				 });
              }
        });
      }
  
      
  	// 选择菜名事件
  	$("#btnSelectCustom").click(function(e) {
  		custom_open({
  			onReturn : afterSelectCustom
  		});
  		return false;
  	});
  
  	/**
 	  * 菜名选择弹出框
 	  * @return {TypeName} 确定后返回选定的菜名集合
 	  */
  	 function custom_open(options)
     {    
	 		 options = $.extend(true, {
				 multi : 1, //单选为1,多选为n,具体数字的话则为不超过该值选择，默认只能单选
				 onReturn : undefined
				}, options);
	 		   var custom_result = [];
	           $.ligerDialog.open({title: "点餐", url: baseURL+'/ordersystem/order/workerdialog/list.do?multi=' 
	        		   + options.multi, height: 500, width: 1100, buttons: [
	                { text: '确定', onclick: function (item, dialog) {               
		                var grid1 = dialog.frame.grid1;
		                var data = grid1.getData();
// 		                alert(JSON.stringify(data));//作为已选框，框中所选数据即为用户想要数据，不需要二次再选择
	                	if(data && data.length > 0){
	                		for(var i = 0 ; i < data.length ; i++ ){
	                			custom_result.push({id:data[i].id , menuName:data[i].menuName , price:data[i].price,restaurant:data[i].restaurant});
	                		}
	                	}
			            if(options.onReturn){
							 options.onReturn(custom_result);
						}
			            dialog.close(); 
			            return false;
	               		}
	                },
	                { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
	             ], isResize: true
	            });
       }
  	 
  // 选定菜菜后事件
 	function afterSelectCustom(result) {
 		if (result && result.length > 0) {
 			// 只需要一个
 			var menuNames = "";
 			var menuPrices = 0;
 			var menuRestaurants = "";
 			for(var i = 0 ; i <result.length ; i++ ){
 				var c = result[i];
 				if(i==result.length-1){
 					menuNames += c.menuName;
 					if(menuRestaurants.indexOf(c.restaurant)<0){
 						menuRestaurants += c.restaurant;
 					}
 				}
 				else{
 					menuNames += c.menuName+";";
 					if(menuRestaurants.indexOf(c.restaurant)<0){
 						menuRestaurants += c.restaurant+";";
 					}
 				}
 				menuPrices += c.price;	 			
 			}
 			$("#menuName").val(menuNames);
 			$("#price").val(menuPrices);
 			$("#restaurant").val(menuRestaurants);
 		}
 	}
       
       //导出事件
      function FF_ImportEvent(btnItem){  
		  var params = $("#formsearch").serialize();
		  params += "&myorder=yes";
		  params = decodeURIComponent(params,true);
		  params = encodeURI(encodeURI(params));
		  window.location.href = "${baseURL}/order/orderlistimport/exportOrderList.do?"+params;
       }
      //一个重新加载数据方法，该方法主要作为外部框架调用使用
      function FF_Reload(){
    	  grid.loadData();
      }
      //选择按钮事件
	 	$("#salerName").ligerComboBox({
            onBeforeOpen: function(){
					var salerInfo = $("#salerInfo").val();
					var datas = $(this).sdAddressBook({multi:1, targetTextId:'salerName',targetValueId:'salerInfo'});
					if(datas && salerInfo != $("#salerInfo").val()){
						$("#salerTel").val(datas.tel);
					}
				return false;
            }, valueFieldID: 'salerInfo'
 });
	 	
      function vaildDate(){
  	  	var startTime = $("#orderTimeStart").val();
		var endTime = $("#orderTimeEnd").val();
		if(startTime!=""&&endTime!=""){
			if(validTime(startTime,endTime)){
				return true;
			}else{
				return false;
			}
		}
      }
  </script>
</body>
</html>
