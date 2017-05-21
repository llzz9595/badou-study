<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 明细与列表在同一个页面 -->
 <div id="detail" style="display:none;">
 	<form id="formdetail" name="formdetail" method="post"></form>
 </div>
 
<style>
	.l-form ul {
		padding:6px;
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
                           { name: "id", type: "hidden" },
         				 
                           { display: "<span style='color: red;'>*</span>&nbsp客户名称", name: "name", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
     					    	validate: { required: true,maxlength: 32,rangelength:[2,20] }},
       				      { display: "<span style='color: red;'>*</span>&nbsp客户电话", name: "phone", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
       				        	validate: { required: true,maxlength: 32 }},
       				      { display: "&nbsp&nbsp&nbsp备注", name: "remark", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
       				            validate: { required: true,maxlength: 32 }},
       				         { display: "&nbsp&nbsp&nbsp创建人", name: "SDdetail_creator", newline: true, labelWidth: 100, width: 240, space: 30, type: "text",
           				            validate: { required: true,maxlength: 32}},
       					  { display: "&nbsp&nbsp&nbsp创建日期", name: "createDate", newline: true, labelWidth: 100, width: 240, space: 30, type: "date",
       				        	options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
       				    
       	  		           { display: "&nbsp&nbsp&nbsp逻辑删除 标志位", name: "Flg_deleted", newline: true, labelWidth: 100, width: 240, space: 30, type: "int",
       	  	  				            validate: {digits:true, min: 0}},
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
              $("#id").val(curentData.id);
              $("#name").val(curentData.name);
              $("#phone").val(curentData.phone);
              $("#remark").val(curentData.remark);
              $("#SDdetail_creator").val(curentData.creator);
              $("#createDate").val(curentData.createDate);
              $("#Flg_deleted").val(curentData.Flg_deleted);
          }else{
        /**	  $("#salmon").val(0);
        	  $("#detailcreator").val(0);
        	  $("#Flg_deleted").val(0);
        	  var myDate = new Date();
        	  var yyyy= myDate.getFullYear();   //获取完整的年份(4位,1970-????)
        	  var MM= myDate.getMonth()+1;      //获取当前月份(0-16,0代表1月)
        	  var DD= myDate.getDate();       //获取当前日(1-31)
        	  var HH=  myDate.getHours();      //获取当前小时数(0-23)
        	  var mm=  myDate.getMinutes();    //获取当前分钟数(0-69)
        	  var ss=  myDate.getSeconds();    //获取当前秒数(0-69)
        	  var date=yyyy+'-'+MM+'-'+DD+' '+ HH+':'+mm+':'+ss;
        	  $("#createDate").val(date);
        	  $("#id").val("");**/
          }
      }
     jQuery.metadata.setType("attr", "validate"); 
     LG.validate(formdetail);
     function FF_Save(){
        	  formdetail.attr("action","${baseURL}/moduledemo/demo16/demo16save/save.do");
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
