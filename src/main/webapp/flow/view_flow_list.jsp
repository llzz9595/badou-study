<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/flow/secure.inc" %>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/web/pub/head.inc"%>
<script src="${ROOT}/js/prototype.js"></script>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
	<script>
		
		function ev_new() {
			openWin("${ROOT}/flow/flow_view_frame.jsp?orgId=${org.id }&busiId=${busi.id}",{showCenter:true,width:850,height:600});
		}
		function ev_edit(id) {
			openWin("${ROOT}/flow/flow_view_frame.jsp?flowCode="+id+urlPara,{showCenter:true,width:850,height:600});
		}
		function ev_del() {
			var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return false;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.form1.action="${ROOT}/deleteFlow.do1?"+urlPara;
				document.form1.submit();
			}	
		}
		function ev_monitor_start(id, name){
			var url = "${ROOT}/watchMonitorStart.do1?id="+id+"&flowName="+name+urlPara;
			window.open(url, "_blank", "width=850,height=600,left=210,top=50,resizable=1,status=no,scrollbars=1");
		}
		function ev_monitor(id){
			var url = "${ROOT}/watchMonitor.do1?id="+id+urlPara;
			window.open(url, "_blank", "width=850,height=600,left=110,top=80,resizable=1,status=no,scrollbars=1");
		}
		//复制,粘贴
		function copyData(){
			var id = getAllChecked('selectedrow');
			if(id==""){
				alert('请选择要复制的项！！');
				return ;
			}
			var url = "${ROOT}/copyData.do1?flowIds="+id+"&nocache="+Math.random()+urlPara;
			LoadAjaxContent(url,copyCallBackMethod);
		}
		function copyCallBackMethod(){
			alert(this.request.responseText+'复制成功!');
		}
		function copyCallBackMethodByPaste(){
			var val = Trim(this.request.responseText);
			if(val == ""){
				alert('粘贴成功!');
				//window.location.href = window.location.href;
				window.location.reload();
			}
			else{
				alert(val);
			}
				
		}
		function pasteData(){
			var url = "${ROOT}/loadCopyData.do1?nocache="+Math.random()+urlPara;
			new Ajax.Request(url, {
				onSuccess:function(response){
					var result = eval("(" + response.responseText + ")");  // parse JSON 数据;
					if(result.isPass == 'true'){
						if(confirm("您确定要粘贴流程["+result.msg+"]?")){
							form1.action="${ROOT}/pasteData.do1";
							form1.method="post";
							form1.submit();
						}
					}else{
						alert("没有需要粘贴的数据!");
					}
				},
				parameters: $('form1').serialize(true),
				asynchronous:false
			});
		}
		
function judge()
{
	var selectedRow = document.getElementsByName("selectedrow");
	var count=0;
	var val="";
	var len=selectedRow.length;
	for (i=0;i<len;i++)
	{			
		if(selectedRow[i].checked)
		{
			if(count==0)
			{
				count = count +1;
				val+=selectedRow[i].value;
			}
			else
			{
				 count = count +1;
				 val+=","+selectedRow[i].value;
			}			 	
		}
	}	
	if(count<=0){
		alert("您还没有选择记录!");
		return "";
	}
	return val;
}

function pasteToEffect(){
	if(SelectUtil.checkedCount('selectedrow')>0){
		var ids = SelectUtil.serialize("selectedrow");
		var retV = window.showModalDialog("${ROOT}/showPasteToEffectFlow.do1?flowIds="+ids,document, "dialogWidth:500px;dialogHeight:300px;status:no;");
	}else{
		alert("请先选择要引用的流程！");
	}
}

	</script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">${busi.busiName}
    <form name="form1" method="post" style="margin-top: 0px">
    	<input type="hidden" name="orgId" value="${org.id }"/>
    	<input type="hidden" name="busiId" value="${busi.id}"/>
    	<!-- 这里用于引用下级组织的ID -->
    	<input type="hidden" name="orgNames" value=""/>
    	<input type="hidden" name="orgIds" value=""/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>${busi.busiName}流程管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a href="#" onClick="ev_new();return false;" title="新增一条新的流程" >新增</a>&nbsp;| &nbsp;
						<a href="#" onClick="ev_del();return false;" title="勾选复选框后，删除所选流程" >删除</a>&nbsp;|&nbsp;
						<a href="#" onClick="copyData();return false;" title="勾选复选框后，复制流程到剪贴板，出现粘贴按钮" >复制</a>&nbsp;|&nbsp;
						<a href="#" onClick="pasteData();return false;" title="" >粘贴</a>&nbsp;|&nbsp;
					</td>
				</tr>
  			</tbody>
  		</table>
        <div align="left">
        	[<font color="#CC3300">${org.fullPathName}</font>]下的流程列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="20%">类别</td>
				<td class="list-title" width="*" colspan="2">操作</td>
			</tr>
		<c:forEach var="flow" items="${flowList}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1"><input type="checkbox" value="${flow.id}" name="selectedrow" class="checkboxInput"/></td>
				<td class="list-text1">
					<a href="#" onClick="ev_edit('${flow.flowCode}');return false;">${flow.flowName}</a> 
				</td>
				<td class="list-text1">${flow.commBusi.busiName}</td>
				<td class="list-text1" align="right">
					<c:if test="${flow.commBusi.flgBatch==1}">
						<a href="#" onClick="ev_monitor_start('${flow.monitor.id }','${flow.flowName }');return false;">发起</a>
					</c:if>
				&nbsp;</td>
    		    <td class="list-text1" align="left">&nbsp;
    		    	<a href="#" onClick="ev_monitor('${flow.monitor.id }');return false;">监控</a>
    		    </td>
			</tr>
		</c:forEach>			
		</table>
		<kpi:page-bar formId="form1" />
	</form>
	
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>