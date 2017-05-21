<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
	<%@ include file="/jinhan/head.inc"%>
	<title>个人请假单填写</title>
	</head>
	<script type="text/javascript" src="${baseURL }/js/ajaxfileupload.js"></script>
<body>
<!-- http://ihanfeng.iteye.com/blog/834232 -->
	<div id='center'>
	<h1>个人请假单填写</h1>
	<form action='${baseURL}/jinhan/holiday/jinhanholidaysave/saveholiday.do' id="holiday_form" method="post" enctype="multipart/form-data" >
	<table style="text-align:left" >
			<tr>
			<td>用户ID</td>
			<td><input type='text' name='memberId' id='memberId' value='${userid}' required /></td>
			<td><span id="memberIdTip" ></span></td>
			</tr>

			<tr>
			<td>姓名</td>
			<td><input type='text' name='memberName'  id='memberName' value='${username}'></td>
			<td><span id="memberNameTip" ></span></td>
			</tr>
			
			<tr>
			<td>部门</td>
			<td><input type='text' name='memberPart' id='memberPart' value='${userpart}'></td>
			<td><span id="memberPartTip" ></span></td>
			</tr>
			
			<tr>
			<td>请假原因</td>
			<td>
			<select name="reason" id="reason" style="width:200px">
			<option value="1">事假</option>
			<option value="2">病假</option>
			</select>
			</td>
			<td><span id="reasonTip" ></span></td>
			</tr>
			
			<tr>
			<td>请假天数</td>
			<td><input type='text' name='days' id='days' value=1 /></td>
			<td><span id="daysTip" ></span></td>
			</tr>
			
			<tr>
			<td>请假起始时间</td>
			<td><input type='text' name='periodb' id='periodb' value="2015-12-13" /></td>
			<td><span id="periodbTip" ></span></td>
			</tr>
			
			<tr>
			<td>请假终止时间</td>
			<td><input type='text' name='periode' id='periode' value="2015-12-14" /></td>
			<td><span id="periodeTip" ></span></td>
			</tr>
			
		<tr>
			<td>其他说明</td>
			</tr>
			<tr>
			<td>附件1</td>
			<td><input  name="file1"  type="file"  id="1"  /></td>
			</tr>
			<tr>
			<td>附件2</td>
			<td><input  name="file1" type="file"  id="2" /></td>
			</tr>
			<tr>
			<td>附件3</td>
			<td><input  name="file1"  type="file"  id="3"  /></td>
			</tr>
			<tr>

	</table>
	<input type="submit" value="保存"  />
	<p>说明：保存后不能更改，请假时请填写请假天数和详细日期，请假半天按一天算，如果有特殊情况请上传附件说明，最多支持三个附件。</p>
	</form>
	</div>

	  <script>
	$(function(){
		$.formValidator.initConfig({formID:"holiday_form",theme:"Bull",submitOnce:true,
		/*	onSuccess:function(){
				var registerForm=$("#holiday_form");
				$.post(registerForm.attr("action"),registerForm.serialize(),function(data){
					alert(data);
					if(data=="0"){
						alert("上传失败");				
					}else if(data=="1"){
						alert("新建请假单成功");
						window.location = "${baseURL}/jinhan/holiday/jinhanholidaylistmn/list.do";
					}else if(data=="2"){
						alert("请假单修改成功");
						window.location = "${baseURL}/jinhan/holiday/jinhanholidaylistmn/list.do";
					}else{
						alert("未知名错误");
					}
				});
			}*/
		});

		
		$("#memberName").formValidator({onShowText:"请输入姓名",onFocus:"请输入姓名"})
		.inputValidator({min:2,max:30,onError:"姓名格式错误"});
		$("#memberPart").formValidator({onShowText:"请输入部门名",onFocus:"请输入部门名"})
		.inputValidator({min:2,max:30,onError:"部门名格式错误"});
		$("#memberId").formValidator({onFocus:"",onShowText:""});
		$("#reason").formValidator({onFocus:"",onShowText:""});
		$("#days").formValidator({onFocus:""})
		.inputValidator({min:1,max:99,type:"value",onError:"请假时间必填或者为整数"});
		$("#periodb").formValidator({onFocus:"",onCorrect:"你输入的日期合法"})
		.inputValidator({min:"2011-01-01",max:"2018-01-01",type:"date",onError:"日期格式如：\"1995-01-01\""});
		$("#periode").formValidator({onFocus:"",onCorrect:"你输入的日期合法"})
		.inputValidator({min:"2011-01-01",max:"2018-01-01",type:"date",onError:"日期格式如：\"1995-01-01\""});
	

		$("#tel").formValidator({onFocus:"如0768-8888888或11位手机号码",onCorrect:"谢谢你的合作"})
		.regexValidator({regExp:["tel","mobile"],dataType:"enum",onError:"你输入的手机或电话格式不正确"});
		$("#other").formValidator({onFocus:""})
		
		
		
	});
	</script>
	</body>
</html>