<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>${basePageTitle}</title>
</head>
<body>
  <!-- 搜索表单 -->
  <div id="mainsearch" style=" width:98%">
  <div class="searchtitle">
        <%--<span>搜索</span><img src="${baseURL}/themes/default/icons/32X32/searchtool.gif" />
        <div class="togglebtn"></div> 
    
    --%>
    <div class="l-title">我的已处理事项</div>
    <div class="navline" style="margin-bottom:4px; margin-top:4px;"></div>
  
    <div class="searchbox">
         <form id="formsearch" class="l-form" method="get">
        <table>
       			<tr>
        		<td align="right" class="l-table-edit-td" width="60px">到达时间:</td>
                 <td align="left" class="l-table-edit-td">
                    <input name="arriveTimeStart" type="text" class="field" inputWidth="100" id="arriveTimeStart" ltype="date" class="field"/>
                </td>
                <td align="right" class="l-table-edit-td">-</td>
                <td align="left" class="l-table-edit-td" width="60px">
                   <input name="arriveTimeEnd" type="text" id="arriveTimeEnd" inputWidth="100" class="field" ltype="date" />
                </td>
                 <td align="left" class="l-table-edit-td"></td>
                <td align="right" class="l-table-edit-td" width="60px">处理时间:</td>
                 <td align="left" class="l-table-edit-td">
                    <input name="handleTimeStart" type="text" class="field" inputWidth="100" id="handleTimeStart" ltype="date" class="field"/>
                </td>
                <td align="right" class="l-table-edit-td">-</td>
                <td align="left" class="l-table-edit-td" width="60px">
                   <input name="handleTimeEnd" type="text" id="handleTimeEnd" inputWidth="100" class="field" ltype="date" />
                </td>
                <td align="left" class="l-table-edit-td"></td>
      			<td><input type="button" value="搜索" id="btnSearch" class="l-button l-button-submit" /> </td>
				<td><input type="reset" value="重置" id="btnReset" class="l-button l-button-test"/> </td>
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
				$("#btnSearch").click();
			}
		});
	});
 	
 	$("#formsearch").ligerForm();

 	
      //列表结构
     var grid = $("#maingrid").ligerGrid({
         columns: [ 
         
          {display:"标题",name:"title",width:500,type:"text",align:"left",isSort : false},
          {display:"状态",name:"nodeName",width:150,type:"text",align:"left",isSort : false},
          {display:"到达时间",name:"createDate",width:150,type:"text",align:"left",isSort : false},
          {display:"处理时间",name:"dealDate",width:150,type:"text",align:"left",isSort : false}],
          dataAction: 'server',
		  url: '${baseURL}/process/gtasks/worklist/listDoneByUser.do', sortName: 'code',
          width: '98%', height: '100%',heightDiff:-10, checkbox: false,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
        
      });
	 //双击事件
      LG.setGridDoubleClick(grid, FF_AddClickEvent);
  
      //搜索表单应用ligerui样式
     

     //查看事件
      function FF_AddClickEvent(btnItem){
      					//待办列表打开待办事件
      	var row = grid.getLastSelected();
		var wid = row.id;
		$.openWindow({url:"${baseURL}/process/gtasks/works/done.do?worklistItemId="+wid+"&"+Math.random()});
			
      }
 	
       //搜索事件
      $("#btnSearch").click(function(e){
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
        
    
  </script>
  
</body>
</html>
