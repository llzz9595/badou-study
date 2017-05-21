<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script>
		function ev_new() {
			pageShowForm("${ROOT}/editResource.do1?parentResourceId=${parentResource.id}&resourceId=");
		}
		function ev_edit(id) {
			pageShowForm("${ROOT}/editResource.do1?parentResourceId=${parentResource.id}&resourceId="+id);
		}
		
		function ev_del(id) {
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
				document.form1.action="${ROOT}/delResource.do1";
				document.form1.submit();
			}	
		}
		function swapResource(currId,swapId,parentId){
			var url = "${ROOT}/swapResource.do1?currId="+currId+"&swapId="+swapId+"&parentId="+parentId;
			window.location = url;
		}
	</script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" action="" onsubmit="" id="form1" style="margin-top: 0px">
    	<input type="hidden" name="parentResourceId" id="parentResourceId" value="${parentResource.id }"/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>菜单管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a onclick="ev_new()" href="javascript:;">新增</a> |
						<a onclick="ev_del()" href="#" >删除</a>
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <div align="left">
        	[<font color="#CC3300">${parentResource.fullName }</font>]下的菜单列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<th class="list-title" nowrap width="12%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></th>
				<th class="list-title" width="15%">名称</th>
				<th class="list-title" width="10%">编号</th>
				<th class="list-title" width="10%">类别</th>
				<th class="list-title" width="15%">URL</th>
				<th class="list-title" width="*">排序</th>
			</tr>
   <c:forEach var="o" items="${resourceList}" varStatus="idx">
  <tr class="list-color${idx.count%2 == 0 ? '1' : '2'}">
    <td class="list-text1" ><input type="checkbox" value="${o.id}" name="selectedrow" class="checkboxInput"/></td>
    <td class="list-text1" ><a onclick="ev_edit('${o.id}');return false;" href="#">${o.name}&nbsp;</a></td> 
    <td class="list-text1" >${o.code}&nbsp;</td> 
    <td class="list-text1" >${o.type}&nbsp;</td>
    <td class="list-text1" >${o.url}&nbsp;</td> 
    <td class="list-text1" >${o.priority}
    </td> 
  </tr> 
</c:forEach>
</table>
  <kpi:page-bar formId="form1" />
	</form>
</body>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>
</html>
