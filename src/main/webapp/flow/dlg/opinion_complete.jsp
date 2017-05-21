<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>意见栏</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/pub/head.inc"%>
</head>
	<body>		
			<table class="formtext" style="width:99%;"  border="0" height="100%" width="99%" cellpadding="0" cellspacing="1">
				<tr>
					<td width="18%" class="t">
						<label id="inputTitle">意见</label>
					</td>
					<td height="200" valign="top" style="padding-top: 5px;padding-left: 5px;">
						<textarea style="display:none;width:97%" rows="13" cols="55" id="input" >这里是意见</textarea>
						<span id="inputText" style="display:none;"></span>
					</td>
				</tr>
			</table>
			<div class="buttonbox">
				<button class="button2" onclick="submit();">确认</button>&nbsp;&nbsp; 
				<button class="button2" onclick="exit();">关闭</button>
			</div>
			<br />
			<iframe id="attachList" src="" frameborder="0"></iframe>
	</body>
	<script>
		// 取得父窗口传来的参数
		var args = window.dialogArguments;
		window.onload = function() {
			// 根据参数设置页面要显示的内容
			// 输入框	
			var input = $_E('input');
			// 附件列表的显示参数--不可上传,不可删除
			var attachConfig = 'isupload=false&delete=false';
			if(args.readOnly) { // 当是只读模式时,显示inputText
				var inputText = $_E('inputText');
				//Util.show(inputText);
				// 设置inputText要显示的内容				
				//inputText.innerHTML = StringUtils.replace(args.inputText,"\n","<br>");;
				Util.show(input);
				// 设置默认值
				input.value = args.inputText;
				input.readOnly = true;
			} else { // 在非只读的模式下,显示输入框input
				Util.show(input);
				// 设置默认值
				input.value = args.inputText;
				// 把焦点移至input输入框
				input.focus();
				// 设置附件列表参数--可上传,可删除
				attachConfig = 'isupload=true&delete=true';
			}		
			// 判断附件列表是否显示
			if(args.attachList) {
					// 显示附件列表
					var attachList = $_E('attachList');
					attachList.src = '${ROOT}/attachList.do1?id=${param.detailId}&' + attachConfig;
					// 设置附件列表的宽高 -- 默认与窗口同宽,高为250px
					attachList.style.width = window.document.body.clientWidth + "px";
					attachList.height = '250';
			} 
			
			// 设置输入项的标题(注意:非html中的title!!!)
			var inputTitle = $_E('inputTitle');
			inputTitle.innerHTML = args.inputTitle;
		}
		//alert(window.document.body.clientHeight);
		// 关闭窗口
		function exit() {
			window.opener = null;
			window.close();
		}
		
		function submit() {
			if(!args.readOnly) {
				// 取得输入的内容
				var outputText = $_EV('input');
				if(args.attachList) {
					// 如果用户不填写内容而上传了附件时,自动加入"请查看附件"的字样
					if(StringUtils.isEmpty(outputText) && hasUploadedAttach()) {
						outputText = "请查看附件";
					} else if(outputText == "请查看附件" && !hasUploadedAttach()) {
						// 如果输入的内容为"请查看附件",而又没有附件上传时,则清空输入内容
						outputText = "";
					}
				}
				window.returnValue = {'outputText':outputText};
			}
			// 关闭窗口	
			exit();
		}
		/*
			判断是否已上传附件
		*/
		function hasUploadedAttach() {
			// document.gete
			// 取得附件列表的IFAME
			var attachFrame = document.frames.attachList;
			var attachCount = 0;
			if(attachFrame) {				
				var atabPro = attachFrame.document.body.all.atabPro;
				// alert(atabPro.rows.length);
				// 取得上传的附件数目
				if(atabPro!="undefined" && atabPro!=null){
					attachCount = atabPro.rows.length - 1;
				}
			}
			return attachCount > 0;
		}
	</script>
</html>
