<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>HTML列表</title>
  <script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script> 
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>

</head>
<body>
 	
	<!--图表信息 -->
<div id="container" style="height:400px;margin-right:240px;float:left"></div>  
	<!-- 列表信息-->
  <div id="childrenlist"  style=" "></div>

  <script type="text/javascript">
  /**
   * Highcharts 在 4.2.0 开始已经不依赖 jQuery 了，直接用其构造函数既可创建图表
  **/

 
  var myDate = new Date();

   //获取当前日期
 
  var curr =  myDate.toLocaleDateString();
  
  
  $.ajax({
	  url: '${baseURL}/moduledemo/demo14/demo14list/initChart.do',
	  type: 'POST',
	  dataType: 'json',
	  success: function (datas) {
	  var json = eval(datas);
     var chart = new Highcharts.Chart('container', {
     title: {
         text: '顾客7日内消费趋势',
         x: -20
     },
     subtitle: {
         text: '数据来源: demo14',
         x: -20
     },
     xAxis: {
         categories: ['1', '2', '3', '4', '5','6', curr]
     },
     yAxis: {
         title: {
             text: '金额'
         },
         plotLines: [{
             value: 0,
             width: 1,
             color: '#808080'
         }]
     },
     tooltip: {
         valueSuffix: 'RMB'
     },
     legend: {
         layout: 'vertical',
         align: 'right',
         verticalAlign: 'middle',
         borderWidth: 0
     },
     series:json
     });

	  }});
 

    
  		var childrenDetailsGridVersion = $("#childrenlist").ligerGrid({ 
          columns: [
			
          {display:"顾客名称",name:"customer",width:100,type:"text",align:"center",isSort : true},
          {display:"1",name:"first",width:100,type:"number",align:"center",isSort : true},
          {display:"2",name:"second",width:100,type:"number",align:"center",isSort : true},
          {display:"3",name:"third",width:100,type:"number",align:"center",isSort : true},
          {display:"4",name:"fourth",width:100,type:"number",align:"center",isSort : true},
          {display:"5",name:"fifth",width:100,type:"number",align:"center",isSort : true},
          {display:"6",name:"sixth",width:100,type:"number",align:"center",isSort : true},
          {display:"7",name:"seventh",width:100,type:"number",align:"center",isSort : true}
       
  		],
		   dataAction: 'server',toolbar: {},
		 
		  url: '${baseURL}/moduledemo/demo14/demo14list/initDemo14.do', 
		  sortName: 'customer',
          width: '98%', height: '98%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
      });
     
  
  </script>
 </body>
</html>
