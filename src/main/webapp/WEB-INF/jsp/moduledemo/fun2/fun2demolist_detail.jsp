<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 明细与列表在同一个页面 -->
 <div id="detail" style="display:none;">
 	<form id="formdetail" name="formdetail" method="post"></form>
 </div>
 
<style>
	.l-form ul {
		padding:5px;
	}
</style>

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
					{ name: "SDdetail_id", type: "hidden" },
					{ display: "<span style='color: red;'>*</span>&nbsp字段1", name: "SDdetail_fieldName1", newline: true, labelWidth: 60, width: 350, space: 30, type: "text",
							validate: { required: true, maxlength: 32}},
					{ display: "<span style='color: red;'>*</span>&nbsp字段2", name: "SDdetail_fieldName2", newline: true, labelWidth: 60, width: 350, space: 30, type: "int",
							validate: { required: true,digits:true, min: 0}},
					{ display: "<span style='color: red;'>*</span>&nbsp字段3", name: "SDdetail_fieldName3", newline: true, labelWidth: 60, width: 350, space: 30, type: "number",
							validate: {required: true, number:true, min: 0, max: 99999}},
					{ display: "&nbsp&nbsp&nbsp字段4", name: "SDdetail_fieldName4", newline: true, labelWidth: 60, width: 350, space: 30, type: "int",
							validate: {digits:true, min: 0}},
					{ display: "&nbsp&nbsp&nbsp字段5", name: "SDdetail_fieldName5", newline: true, labelWidth: 60, width: 350, space: 30, type: "date",
							options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
         		],
                toJSON: JSON2.stringify
              });

              detailWin = $.ligerDialog.open({
            	  title: '功能示例2编辑',
                  target: $("#detail"),
                  width: 600, height: 400,top:10,
                  buttons: [
	                  { text: '保存', onclick: function () { FF_Save(); } },
	                  { text: '取消', onclick: function () { detailWin.hide(); } }
                  ]
              });
          }
         
          if (curentData)
          {
              $("#SDdetail_id").val(curentData.pkId);
              $("#SDdetail_fieldName1").val(curentData.fieldName1);
              $("#SDdetail_fieldName2").val(curentData.fieldName2);
              $("#SDdetail_fieldName3").val(curentData.fieldName3);
              $("#SDdetail_fieldName4").val(curentData.fieldName4);
              $("#SDdetail_fieldName5").val(curentData.fieldName5);
          }else{
        	  $("#SDdetail_fieldName2").val(0);
        	  $("#SDdetail_fieldName3").val(0);
        	  $("#SDdetail_fieldName4").val(0);
        	  var myDate = new Date();
        	  var yyyy= myDate.getFullYear();   //获取完整的年份(4位,1970-????)
        	  var MM= myDate.getMonth()+1;      //获取当前月份(0-11,0代表1月)
        	  var DD= myDate.getDate();       //获取当前日(1-31)
        	  var HH=  myDate.getHours();      //获取当前小时数(0-23)
        	  var mm=  myDate.getMinutes();    //获取当前分钟数(0-59)
        	  var ss=  myDate.getSeconds();    //获取当前秒数(0-59)
        	  var date=yyyy+'-'+MM+'-'+DD+' '+ HH+':'+mm+':'+ss;
        	  $("#SDdetail_fieldName5").val(date);
        	  $("#SDdetail_id").val("");
          }
      }
     jQuery.metadata.setType("attr", "validate"); 
     LG.validate(formdetail);
     function FF_Save(){
        	  formdetail.attr("action","${baseURL}/moduledemo/fun2/fun2demosave/save.do");
        	  LG.submitForm(formdetail, function (data) {
                if (data && data.hasOk) {  
                     grid.loadData();
                     detailWin.hide();
                     alert('操作成功!');
                } else { 
                	 alert("操作失败!失败信息如下:\n"+data.message+"\n如您对以上信息有疑问，请联系管理人员!");
                }
              });
    }
  </script>
