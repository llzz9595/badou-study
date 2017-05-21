<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>DEMO演示功能1-分页列表</title>
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
	        <form id="formsearch" class="l-form" method="get">
	        	<table cellpadding="0" cellspacing="1" class="l-table-edit" >
		           	 <tr>
		                <td align="right" class="l-table-edit-td">工号</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="workerNum" name="workerNum" ltype="text" class="field"   style="margin-left: 2px；"/>
		                </td>
		                
		                <td align="right" class="l-table-edit-td"  style="padding-left: 80px">姓名</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="workerName" name="workerName" ltype="text" class="field" value="" style=" margin-left:2px"/>
		                </td>
		            </tr>
		            
		            <tr>
		                <td align="right" class="l-table-edit-td">工种</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="genre" name="genre" ltype="text" class="field" value=""  style="margin-left: 2px"/>
		                </td>
		                
						<td align="right" class="l-table-edit-td">入职时间</td>
						<td align="left" class="l-table-edit-td" style="width: 120px">
								<input id= "entryTimeStart" name="entryTimeStart" type="text" ltype="date" class="field"/>
						</td>
						<td align="right" class="l-table-edit-td">至</td>
						<td align="left" class="l-table-edit-td" style="width: 120px">
								<input id= "entryTimeEnd" name="entryTimeEnd" type="text" ltype="date" class="field" />
						</td>
							
						<td align="left" class="l-table-edit-td" style="padding-left: 40px">
								<input type="button" value="搜索" id="btnSearch"  class="l-button l-button-submit"  /> 
						</td>
						<td align="left" class="l-table-edit-td">
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
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
              columns: [
		          {display:"工号",name:"workerNum",width:150,type:"text",align:"center",isSort : true},
		          {display:"姓名",name:"workerName",width:80,type:"text",align:"center",isSort : false},
		          {display:"性别",name:"sex",width:80,type:"text",align:"center",isSort : false},
		          {display:"身份证号",name:"identityCard",width:80,type:"text",align:"center",isSort : true},
		          {display:"入职时间",name:"entryTime",width:150,type:"date",align:"center",isSort : true},
		          {display:"工种",name:"genre",width:80,type:"text",align:"center",isSort : true},
		          {display:"工资",name:"salary",width:150,type:"text",align:"right",isSort : false},
		     ],
	          dataAction: 'server',toolbar: {},
	          url: '${baseURL}/moduledemo/fun4/fun4demolist/listJSON.do', sortName: 'code',
	          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
	          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
	          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });

      //双击事件
      LG.setGridDoubleClick(grid, FF_ModifyClickEvent);
      //增加搜索按钮,并创建事件, 最后一个参数控制是否显示“高级搜索按钮”
   /*    LG.appendSearchButtons("#formsearch", grid, false); */
       $("#formsearch").ligerForm();
      //加载toolbar
      LG.createToolbarButton(grid, [{id : "add", name : "弹出框新增", clickEvent : FF_AddClickEvent, icon : "/silkicons/add.png"},
                                    {id : "add", name : "列表新增", clickEvent : FF_AddClickEvent_list, icon : "/silkicons/add.png"},
      								{id : "modify", name : "弹出框修改", clickEvent : FF_ModifyClickEvent, icon : "/silkicons/application_edit.png"},
      								{id : "modify", name : "列表修改", clickEvent : FF_ModifyClickEvent_list, icon : "/silkicons/application_edit.png"},
      								{id : "query", name : "查看", clickEvent : FF_QueryClickEvent_list,icon:"/silkicons/query.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);

	  
      //工具条事件
      //新增事件
      function FF_AddClickEvent(btnItem){
      		FF_ShowDialog(null,true);
      }
    //工具条事件
      //列表新增事件
      function FF_AddClickEvent_list(btnItem){
    	  parent.f_addTab("Fun4DemoEdit", 'Demo4添加', '${baseURL}/moduledemo/fun4/fun4demoedit/edit.do?menuId=${param.menuId}');
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
       //修改事件（弹出框修改）
      function FF_ModifyClickEvent(btnItem){
      	var row = grid.getLastSelected();
      	if (!row) { alert("请先选择需要修改的行!"); return false;}
      	FF_ShowDialog({
      		pkId : row.id,workerNum : row.workerNum,
      		workerName : row.workerName,sex : row.sex,Id : row.Id,
      		entryTime : row.entryTime,genre : row.genre,
      		identityCard : row.identityCard, salary : row.salary,
      		contact : row.contact,  qq : row.qq,
      		weChat : row.weChat, email : row.email,
      		address : row.address, priority : row.priority
      	}, false);
      }
      //列表修改事件（列表修改）
      function FF_ModifyClickEvent_list(btnItem){
    	  var row = grid.getLastSelected();
    	  if (!row) { alert("请选择需要修改的行!"); return false;}
    	  parent.f_addTab("Fun4DemoEdit", 'Demo4修改', '${baseURL}/moduledemo/fun4/fun4demoedit/edit.do?menuId=${param.menuId}&id='+ row.id);
      } 
      
    //查看事件（列表查看）
      function FF_QueryClickEvent_list(btnItem){
    	  var row = grid.getLastSelected();
    	  if (!row) { alert("请选择需要查看的行!"); return false;}
    	  parent.f_addTab("Fun4DemoEdit", 'Demo4查看', '${baseURL}/moduledemo/fun4/fun4demoedit/edit.do?menuId=${param.menuId}&id='+ row.id);
      } 
       

      //删除事件
      function FF_DeletedClickEvent(btnItem){
      	var selectedRow = grid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/moduledemo/fun4/fun4demodelete/delete.do",
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
     						 grid.loadData();
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
    <!-- 编辑表单(采用弹出框时，一般是另一个页面请求，此时编辑表单会在另一个文件中) -->
<%@ include file="fun4demolist_detail.jsp" %>
</body>
</html>
