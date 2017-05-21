<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>意见</title>
	<script type="text/javascript">
	window.name="win_options" 
	var obj = window.dialogArguments;
	var ids = obj.ids;
function submitNext(btn){
	var routeId = "${param.routeId}";
	document.all.id.value = ids;
	var val = $_EV("opinion");
		if(val.trim()==''){
			alert("处理意见不可为空!");
			return;
		}
 		if(val.trim().length > 500) {
 			alert("意见只可以输入500个字符！");
			return;	
 		} 
 	var submitType = "${type}";
 	var submitWay = "${currentNode.flgSubmitSync}";
 	var url = "";
	var confirmContent = "";	
 	if("${type}"=="archive"){
		url = submitWay=="1"?"${ROOT}/submitArchiveSync.do1":"${ROOT}/submitArchive.do1";
	}else if("${type}"=="back"){
		url = submitWay=="1"?"${ROOT}/submitBackSync.do1":"${ROOT}/submitBack.do1";
	}else{
		url = submitWay=="1"?"${ROOT}/submitNextSync.do1":"${ROOT}/submitNext.do1";
	}	
	url += "?routeId="+routeId;
	if("您确认要提交${nextNode.nodeName}?"){
	   	form1.action= url;
	   	form1.target = "win_options";
	   	btn.disabled = true;
	   	showProcessor();
		form1.submit();		
	}
}
</script>
</head>

<body>
<form name="form1" method="post" action="" target="win_options">
<input type="hidden" name="id" value=""/>
<table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg" style="text-align: right;"><div class="dialog-title">
            <input type="button" class="button2" value="提交" onclick="submitNext(this);"/>
			<input type="button" class="button2" value="关闭" onclick="window.close();"/>&nbsp;&nbsp;&nbsp;
          </div></td>
        </tr>
        <tr valign="top" align="left">
          <td height="500px" valign="top" align="left" class="address-text-bg">
          <table  cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 borderColorLight=#b5caff border=1 width="95%" >
			<tr>
			    <td class="t" width="10%">意见填写</td>
				<td width="80%">
				  <textarea id="opinion" name="opinion" rows="4" cols="50">已确认</textarea>
			      <select title="选择意见" onmousewheel="return false;"  onchange="if(this.value!='')document.getElementById('opinion').innerHTML+=this.value;">
			      	<option value="">请选择意见</option>
			      	<option value="已确认">已确认</option>
			      	<option value="已填写考核指标,请领导审核">已填写考核表,请领导审核</option>
			      	<option value="已修改考核指标,请领导审核">已修改考核表,请领导审核</option>
			      	<option value="已审核">已审核</option>
			      	<option value="已评分，请领导审核">已评分，请领导审核</option> 
			      	 <option value="已评分，请确认">已评分，请确认</option>
			      	<option value="请修改后再提交">请修改后再提交</option>
			      </select>
				  <!-- <input type="button" value="确定" onclick="createOpinion();"/> -->
				</td>
			  </tr>
          	</table>
          	<center>
          	<!-- 环节信息 -->
			<iframe src="${ROOT}/listFlowOpinions.do1?resourceId=${param.resourceId}&nodeCode=${param.nodeCode}" width="95%" height="100%" frameborder="0"></iframe>
          </center>
          </td>
         </tr>
</table>

</form>
</body>
</html>