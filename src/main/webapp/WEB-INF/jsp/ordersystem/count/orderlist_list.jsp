<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>菜单明细表</title>
</head>
<body style="padding-top:20px">
 <!-- 表格列表 -->
  <div id="maingrid"></div> 

 <script type="text/javascript">
      //列表结构
      var orderdate = '${orderdate}';
      var time1  = encodeURI('${opinionDecoder}');
	  var time = encodeURI(time1);
      var grid = $("#maingrid").ligerGrid({ 
              columns: [
		          {display:"下单人",name:"workerName",width:100,type:"text",align:"center",isSort : true},
		          {display:"下单时间",name:"createTime",width:180,type:"date",align:"center",isSort : true, format: "yyyy-MM-dd"},
		          {display:"快餐",name:"menuName",width:150,type:"text",align:"center",isSort : true},
		          {display:"价格",name:"priceSum",width:100,type:"text",align:"center",isSort : true},
		          {display:"所属商家",name:"restaurant",width:150,type:"text",align:"center",isSort : true}],
	          
		      url: '${baseURL}/ordersystem/count/orderlist/detailJSON.do?orderdate='+ orderdate +"&ordertime=" + time , 
	          sortName: 'code',
	          width: '80%', height: '100%',heightDiff:-10, checkbox: true,
	          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
	          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });
  </script>

</body>
</html>
