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
  
 	 <div class="l-title">我的待处理事项</div>
    <div class="navline" style="margin-bottom:4px; margin-top:4px;"></div>
    <div class="searchbox">
        	
        </form>
    </div>
     
  
  </div>
<!-- 表格列表 -->
<div id="maingrid"></div> 
 	<script type="text/javascript">
 	
 

 	
      //列表结构
     var grid = $("#maingrid").ligerGrid({
         columns: [ 
          
          {display:"标题",name:"title",width:500,type:"text",align:"left",isSort : false},
          {display:"当前状态",name:"nodeName",width:150,type:"text",align:"left",isSort : false},
          {display:"到达时间",name:"createDate",width:150,type:"text",align:"left",isSort : false}],
          dataAction: 'server',
		  url: '${baseURL}/process/gtasks/worklist/listUndoByUser.do', sortName: 'code',
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
		$.openWindow({url:"${baseURL}/process/gtasks/works/undo.do?worklistItemId="+wid+"&"+Math.random()});
		

      }
 
        
    
  </script>
  
</body>
</html>
