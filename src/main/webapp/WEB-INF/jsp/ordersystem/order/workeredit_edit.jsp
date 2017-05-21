<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/pub/head.inc"%>
    <title>菜单信息列表页</title>
</head>
<body>
<div id="mainsearch" style=" width:98%">
    <div class="searchbox">
        <form id="formsearch" method="get">
        	<table cellpadding="0" cellspacing="1" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">菜名:</td>
                <td align="left" class="l-table-edit-td" >
                <input type="text" id="menuName" name ="menuName" ltype="text" class="field" value="" inputwidth="200px"/></td>
                <td align="left" class="l-table-edit-td">
                <td align="right" class="l-table-edit-td">快餐店:</td>
                <td align="left" class="l-table-edit-td" >
                <input type="text" id="restaurant" ltype="text" class="field" name = "restaurant" value="" inputwidth="200px"/></td>
                <td align="left" class="l-table-edit-td">
                <input name="hide" type="text" id="hide" ltype="text" style="display:none;" />
                <input type="button" value="搜索" id="btnSearch" onclick="FF_Search()"   class="l-button l-button-submit"  /> 
                </td>
                <td align="left" class="l-table-edit-td">
                <input type="reset" value="重置" id="btnReset" class="l-button l-button-test"/> 
                </td>
            </tr>
        </table>
        </form>
    </div>
    <div class="navline" style="margin-bottom:4px; margin-top:4px;">
    <!-- select multiple="multiple" ></select> -->
    </div>
  </div>
<table align="center" style="margin:0; padding:0">
<tr>
	<td ><div align="center" id="maingrid"  style="height:302px;margin-left:5px;margin-right:0px"></div> </td>
	<td >
		<div style="margin-left:5px;margin-right:5px">
		<a class="l-button" onclick="addCustom();" >添          加</a><br/>
		<a class="l-button" onclick="deleteCustom();" >删          除</a>
		</div>
	</td>
	
	<td ><div align="center" id="maingrid1"   style="height:302px;margin-left:0px;margin-right:5px"></div> </td>
</tr>
<tr>
<td colspan="3" width="100%" class="address-depict" valign="top" >
<label style=margin-left:5px>描述：</label> 
<span name="addressRemark" id="addressRemark" ></span>
</td>
</tr>
</table>


<script type="text/javascript">
// 	var chosenMenuName = $(window.parent.document).find("input[id='chosenMenuName']").val();
//  var chosenCustomName = $(window.parent.document).find("input[id='customerName']").val();
// 	var chosenPrice = $(window.parent.document).find("input[id='chosenPrice']").val();
// 	var chosenRestaurant = $(window.parent.document).find("input[id='chosenRestaurant']").val();
// 	var chosenCustomCustomerTel = $(window.parent.document).find("input[id='customerCompanyName']").val();
// 	var chosenCustomCustomerTel = $(window.parent.document).find("input[id='customerCompanyName']").val();
//	var chosenCustomCustomerTel = $(window.parent.document).find("input[id='customerCompanyName']").val();
 	$(function(){
		$(document).keypress(function(event){
			if (event.keyCode == 13) { // 13表示回车键
				FF_Search();
			}
		});
	});
 	
 	
	
	
	var jsonObj = {};
//	if(chosenCustomId!=null)
//		jsonObj.Rows = [];
//	else
		jsonObj.Rows = [];
	
	//$("#formsearch").ligerForm();
	
	//在待选列表中选中客户，双击可以将其加入右边的已选列表
	function addCustom() {
		var row = grid.getSelecteds();
      	if (row.length==0) { alert("请在【待选列表】中选择要添加的行!"); return false;}
      	/* 
      	for(var i = 0 ; i < grid1.rows.length ; i++ ){
      		grid1.deleteRow(grid1.rows[i]);
      	} */
      	
    	//将客户数据缓存在前台...然后点击保存时就将这些数据填充到order_china.jsp页面中的客户form中
       	for(var i = 0 ; i < row.length ; i++){
      		grid1.addRow({ id : row[i].id, menuName: row[i].menuName, price:row[i].price, restaurant:row[i].restaurant});
	 		$("#addressRemark").html("菜名:"+row[i].menuName+"  ;  单价:"+row[i].price+"  ;  所属快餐店:"+row[i].restaurant+".");
      	}  
	}

	function deleteCustom() {
		var row = grid1.getSelecteds();
		if (row.length==0) { alert("请在【已选列表】中选择要删除的行!"); return false;}
      	else{ 
	   		 grid1.deleteSelectedRow();
	   		 document.getElementById("addressRemark").innerHTML = "";
	   		}
	}
	
     //列表结构
     var grid = $("#maingrid").ligerGrid({
         columns: [    
           {display:"菜名",name:"menuName",width:130,type:"text",align:"left",isSort : false},
           {display:"单价",name:"price",width:65,type:"text",align:"left",isSort : false},
           {display:"所属快餐店",name:"restaurant",width:180,type:"text",align:"left",isSort : false}  
          ],
          dataAction: 'server',
		  url: '${baseURL}/ordersystem/order/workerdialog/listJSON.do',
		  title:'待选列表',
		  //width: 350, height: 300,
		  width: '98%', height: 300,checkbox:false,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:90,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",checkbox:false,pageSize: ${pageSize}
	 });
     
      	//双击事件
     LG.setGridDoubleClick(grid, addCustom);
   

 	
	var grid1 = $("#maingrid1").ligerGrid({
		columns: [
          {display:"菜名",name:"menuName",width:80,type:"text",align:"left",isSort : false} ,    
          {display:"单价",name:"price",width:65,type:"text",align:"left",isSort : false},
          {display:"所属快餐店",name:"restaurant",width:	180,type:"text",align:"left",isSort : false}
		],
		data: jsonObj, 
		width: '98%', height:300, 
		usePager:true,
		isScroll:true,
		checkbox :false,
		title:'已选列表'
	});
	
    //双击事件
    LG.setGridDoubleClick(grid1, deleteCustom);
    
     function FF_Search(){
     /* 	var val1 = $("#menuName").val();  
     	var val2 = $("#restaurant").val();  
         grid.setOptions(                   
				{ parms: [{ name: 'params', value: val}] }              
				);  */
		 var json = LG.bulidFilterParams($("#formsearch"));
	     grid.set('parms', json);
         //采用原来的请求地址，带上参数加载数据
		  grid.loadData();
		  return false;
     }
      
       //重置事件
      $("#btnReset").click(function(e){
           grid.set('parms', null);
            //采用原来的请求地址，带上参数加载数据
		   grid.loadData();
      });
  </script>
  </body>
  </html>