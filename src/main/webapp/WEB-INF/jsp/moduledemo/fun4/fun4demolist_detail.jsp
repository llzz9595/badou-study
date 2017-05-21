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
	  LG.setFormDefaultBtn(FF_Cancel, FF_Save);
      function FF_ShowDialog(data, isAddNew)
      {
          curentData = data;
          currentIsAddNew = isAddNew;
          if (detailWin){
              detailWin.show(); 
          }else{
              //创建表单结构, 这里的字段命名为了与同其它地方区分，加了SDdetail_前缀，后台获取数据时也得去掉前缀(若明细与列表不在同一页面时，可不用)
              formdetail.ligerForm({ 		//弹出框新增
                  fields: [
					{ name: "SDdetail_id", type: "hidden" },
					{ display: "<span style='color: red;'>*</span>&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号", name: "SDdetail_workerNum", newline: true, labelWidth: 80, width: 250, space: 30, type: "text",
							validate: { required: true, maxlength: 32}},
					{ display: "<span style='color: red;'>*</span>&nbsp姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名", name: "SDdetail_workerName", newline: true, labelWidth: 80, width: 250, space: 30, type: "text",
							validate: { required: true, maxlength: 32}},
					{ display: "&nbsp&nbsp&nbsp性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别", name: "SDdetail_sex", newline: true, labelWidth: 80, width: 250, space: 30, type: "text",
							validate: { maxlength: 2}},
					{ display: "&nbsp&nbsp身份证号", name: "SDdetail_identityCard", newline: true, labelWidth: 80, width: 250, space: 30, type: "text",
							validate: { maxlength: 20}},
					{ display: "&nbsp&nbsp入职时间", name: "SDdetail_entryTime", newline: true, labelWidth: 80, width: 250, space: 30, type: "date",
							options : {showTime:true, format: "yyyy-MM-dd hh:mm:ss"}},
					{ display: "&nbsp&nbsp&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp种", name: "SDdetail_genre", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 10}},
					{ display: "&nbsp&nbsp&nbsp工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp资", name: "SDdetail_salary", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 8}},
					{ display: "&nbsp&nbsp联系方式", name: "SDdetail_contact", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 20}},
					{ display: "&nbsp&nbsp&nbspQQ&nbsp&nbsp&nbsp&nbsp&nbsp号", name: "SDdetail_qq", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 20}},
					{ display: "&nbsp&nbsp&nbsp微&nbsp&nbsp信&nbsp&nbsp号", name: "SDdetail_weChat", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 20}},
					{ display: "&nbsp&nbsp&nbsp邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱", name: "SDdetail_email", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 20}},
					{ display: "&nbsp&nbsp家庭住址", name: "SDdetail_address", newline: true, labelWidth: 80, width: 350, space: 30, type: "text",
							validate: { maxlength: 50}},
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
              $("#SDdetail_workerNum").val(curentData.workerNum);
              $("#SDdetail_workerName").val(curentData.workerName);
              $("#SDdetail_sex").val(curentData.sex);
              $("#SDdetail_identityCard").val(curentData.Id);
              $("#SDdetail_entryTime").val(curentData.entryTime);
              $("#SDdetail_genre").val(curentData.genre);
              $("#SDdetail_salary").val(curentData.salary);
              $("#SDdetail_contact").val(curentData.contact);
              $("#SDdetail_qq").val(curentData.qq);
              $("#SDdetail_weChat").val(curentData.weChat);
              $("#SDdetail_email").val(curentData.email);
              $("#SDdetail_address").val(curentData.address);
              $("#SDdetail_url").val(curentData.url);
              $("#SDdetail_smallIcon").val(curentData.smallIcon);
          }else{
        	  $("#SDdetail_workerNum");
        	  $("#SDdetail_workerName");
        	  $("#SDdetail_sex");
        	  $("#SDdetail_identityCard");
        	  var myDate = new Date();
        	  var yyyy= myDate.getFullYear();   //获取完整的年份(4位,1970-????)
        	  var MM= myDate.getMonth()+1;      //获取当前月份(0-11,0代表1月)
        	  var DD= myDate.getDate();       //获取当前日(1-31)
        	  var HH=  myDate.getHours();      //获取当前小时数(0-23)
        	  var mm=  myDate.getMinutes();    //获取当前分钟数(0-59)
        	  var ss=  myDate.getSeconds();    //获取当前秒数(0-59)
        	  var date=yyyy+'-'+MM+'-'+DD+' '+ HH+':'+mm+':'+ss;
        	  $("#SDdetail_entryTime").val(date);
        	  $("#SDdetail_genre");
        	  $("#SDdetail_salary");
        	  $("#SDdetail_contact");
        	  $("#SDdetail_qq");
        	  $("#SDdetail_weChat");
        	  $("#SDdetail_email");
        	  $("#SDdetail_address");
        	  $("#SDdetail_url");
        	  $("#SDdetail_smallIcon");
        	  $("#SDdetail_id").val("");
          }
      }
     jQuery.metadata.setType("attr", "validate"); 
     LG.validate(formdetail);
     function FF_Save(){
        	  formdetail.attr("action","${baseURL}/moduledemo/fun4/fun4demosave/save.do");
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
     function FF_Cancel(){
	    	var win = parent || window;
	        win.LG.closeCurrentTab("Fun4DemoEdit");
	    }
  </script>
