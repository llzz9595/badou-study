<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 明细与列表在同一个页面 -->
 <div id="detail" style="display:none;">
 	<form id="formdetail" name="formdetail" method="post">
 		<input type="hidden" name="SDdetail_menuId" id="SDdetail_menuId"  value="${id}"/>
 		<input type="hidden" name="SDdetail_id" id="SDdetail_id"  value=""/>
 	</form>
 </div>
   <script type="text/javascript">
      //编辑，新增弹出框
      var detailWin = null, curentData = null, currentIsAddNew;
	  var formdetail = $("#formdetail");
      function FF_ShowDialog(data, isAddNew)
      {
          curentData = data;
          currentIsAddNew = isAddNew;
          if (detailWin){
              detailWin.show(); 
          }else{
              //创建表单结构, 这里的字段命名为了与同其它地方区分，加了SDdetail_前缀，后台获取数据时也得去掉前缀(若明细与列表不在同一页面时，可不用)
              formdetail.ligerForm({ 
                  fields: [
					         { display: "<span style='color: red;'>*</span>&nbsp字段1", name: "SDdetail_pageType", newline: true, labelWidth: 70, width: 240, space: 30, type: "text",
					        	 	validate: { required: true, maxlength: 256}},
					         { display: "<span style='color: red;'>*</span>&nbsp字段2", name: "SDdetail_targetWin", newline: true, labelWidth: 70, width: 240, space: 30, type: "text",
					        	 	validate: { required: true, maxlength: 256}},
					       	 { display: "&nbsp&nbsp&nbsp排序号", name: "SDdetail_priority", newline: true, labelWidth: 70, width: 240, space: 30, type: "int",
					        		validate: { required: true, min: 0, max: 99999, digits:true}}
         			],
                  toJSON: JSON2.stringify
              });

              detailWin = $.ligerDialog.open({
            	  title: '示例1子单编辑',
                  target: $("#detail"),
                  width: 400, height: 300,top:10,
                  buttons: [
	                  { text: '保存', onclick: function () { FF_DetailSave(); } },
	                  { text: '取消', onclick: function () { detailWin.hide(); } }
                  ]
              });
          }
          if(curentData)
          {
              $("#SDdetail_id").val(curentData.pkId);
              $("#SDdetail_fieldName1").val(curentData.fieldName1);
              $("#SDdetail_fieldName2").val(curentData.fieldName2);
              $("#SDdetail_priority").val(curentData.priority);
          }else{
              $("#SDdetail_priority").val(1);
          }
      }
     jQuery.metadata.setType("attr", "validate"); 
     LG.validate(formdetail);
     function FF_DetailSave(){
        	  formdetail.attr("action","${baseURL}/moduledemo/fun3/children/fun3demochildsave/save.do");
        	  LG.submitForm(formdetail, function (data) {
                if (data && data.hasOk) {  
                     childrenDetailsGrid.loadData();
                     detailWin.hide();
                     alert('操作成功!');
                } else { 
                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
                }
              });
    }
  </script>
