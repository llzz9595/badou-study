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
	        <form id="formsearch" class="l-form" method="get">
	        	<table cellpadding="0" cellspacing="1" class="l-table-edit" >
		           	 <tr>
		                <td align="right" class="l-table-edit-td">菜   单   名   称</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="menuName" name="menuName" ltype="text" class="field" value=""  style="margin-left: 2px；"/>
		                </td>
		                
		                <td align="right" class="l-table-edit-td"  style="padding-left: 100px">餐   厅   名   称</td>
		                <td align="left" class="l-table-edit-td" >
								<input type="text" id="restaurant" name="restaurant" ltype="text" class="field" value="" style=" margin-left:2px"/>
		                </td>
		            </tr>
		            
		            <tr>
		                <td align="right" class="l-table-edit-td">今日是否有效</td>
		                <td align="left" class="l-table-edit-td" >
								<select  id="effective" name="effective" ltype="text" class="field" value="" style="margin-left: 2px;width:130px">
									<option value="是">是</option>
				  					<option value="否">否</option>
								</select>
		                </td>
						<td align="left" class="l-table-edit-td" style="padding-left: 160px">
								<input type="button" value="搜索" id="btnSearch"  class="l-button l-button-submit"  /> 
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
      //列表结构
      var grid = $("#maingrid").ligerGrid({ 
              columns: [
		          {display:"菜单名称",name:"menuName",width:150,type:"text",align:"center",isSort : true},
		          {display:"价格",name:"price",width:80,type:"text",align:"center",isSort : true},
		          {display:"是否有效",name:"effective",width:150,type:"date",align:"center",isSort : true},
		          {display:"所属快餐店",name:"restaurant",width:80,type:"text",align:"center",isSort : true},
		         
	          ],
	          dataAction: 'server',toolbar: {},
	          url: '${baseURL}/ordersystem/menu/menulist/listJSON.do', sortName: 'code',
	          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
	          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
	          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
	          sortorderParmName:"sortOrder",checkbox:true,pageSize: ${pageSize}
      });

      //双击事件
//       LG.setGridDoubleClick(grid, FF_ModifyClickEvent);
      //增加搜索按钮,并创建事件, 最后一个参数控制是否显示“高级搜索按钮”
   /*    LG.appendSearchButtons("#formsearch", grid, false); */
      $("#formsearch").ligerForm();
      //加载toolbar
      LG.createToolbarButton(grid, [{id : "add", name : "新增", clickEvent : FF_AddClickEvent_list, icon : "/silkicons/add.png"},
      								{id : "modify", name : "修改", clickEvent : FF_ModifyClickEvent_list, icon : "/silkicons/application_edit.png"},
      								{id : "delete", name : "删除", clickEvent : FF_DeletedClickEvent, icon : "/silkicons/delete.png"}]);

	  
      //工具条事件
      //新增事件
      function FF_AddClickEvent(btnItem){
      		FF_ShowDialog(null,true);
      }
    //工具条事件
      //列表新增事件
      function FF_AddClickEvent_list(btnItem){
    	  parent.f_addTab("MenuEdit", '菜单添加', '${baseURL}/ordersystem/menu/menuedit/edit.do?menuId=${param.menuId}');
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
      
      //列表修改事件
      function FF_ModifyClickEvent_list(btnItem){
    	  var row = grid.getLastSelected();
    	  if (!row) { alert("请选择需要修改的行!"); return false;}
    	  parent.f_addTab("MenuEdit", '菜单修改', '${baseURL}/ordersystem/menu/menuedit/edit.do?menuId=${param.menuId}&id='+ row.id);
      } 
       

      //删除事件
      function FF_DeletedClickEvent(btnItem){
      	var selectedRow = grid.getCheckedRows();
      	if (!selectedRow || !selectedRow.length) { alert("请先选择需要删除的行!"); return false;}
      	jQuery.ligerDialog.confirm('您确定删除吗?', function (confirm) {
              if (confirm){
              	 $.ajax({
   					type: "GET",
   					url: "${baseURL}/ordersystem/menu/menudelete/delete.do",
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

</body>
</html>
