<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>
		待办/已办类别配置
	</title>
	<%@ include file="/web/pub/head.inc"%>
   <style>
 	.sleep {color:gray;} 
   	.sleep a:link{ color:red;text-decoration:none; }
   	
   </style>
   <script>
   		function ev_edit(id) {
   			openFullScreenWin('${ROOT}/workItemCategoryForm.do1?id=' + id);
   		}
		function ev_add() {
			openFullScreenWin('${ROOT}/workItemCategoryForm.do1');
		}
			
		function ev_delete() {
			if(SelectUtil.checkedCount('selectedrow') > 0) {
				if(confirm("是否删除所选待办/已办类别配置？")) {
					var f = $_E('form1');
					f.action = '${ROOT}/delWorkItemCategory.do1';
					f.submit();
				}				
			} else {
				alert('请先选择待办/已办类别配置 !');
			}		
		}
		
		
		/**
		 * 打开一个指标查询窗口
		 */
		function openQueryDlg() {
			window.location.href = "${ROOT}/queryworkItemCategory.do1?showForm=1&query=0";
			//pageShowForm("${ROOT}/queryTemplate.do1?showForm=1");
		}
		
		
	</script>
</head>
<body onmousewheel="setScrollzheight()">    
	<table cellspacing="0" cellpadding="0" border="0" class="list-top">
		<tbody>
			<tr>  
				<td>
					<h2>待办/已办类别配置浏览</h2>
				</td>
			</tr>
			<tr>  
				<td class="list-caozuo" style="padding-right:10px;">
					<kpi:secure name="新增 " onClick="ev_add();" code="04${param.scopeType}${param.scopeType}01" resourceId="${param.orgId }" type="link" label="|"/> 
					<kpi:secure name="删除 " onClick="ev_delete();" code="04${param.scopeType}${param.scopeType}02" resourceId="${param.orgId }" type="link" label=""/> 
				</td>
			</tr>
		</tbody>
	</table>

                          
      <form name="form1" id="form1" method="post" action="">      
		<table class="list-box" cellspacing="0" border="0">
			<tr>
				<th class="list-title" nowrap width="10%">全选<input type="checkbox" onclick="SelectUtil.checkAll(this,'selectedrow')" name="selectid22" class="checkboxInput"/></th>
				<th class="list-title" width="30%">待办/已办类别名称</th>
				<th class="list-title" width="20%">相关视图</th>
			</tr>
		<c:forEach var="o" items="${list}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}" >
				<td align="center" class="list-text1">
					<input type="checkbox" name="selectedrow" value="${o.id}" class="checkboxInput"/>
				</td>
				<td class="list-text1">
				<a href="javascript:;" onclick="ev_edit('${o.id}')" title="${o.name}">
					
					<c:choose>
						<c:when test="${fn:length(o.name) >30}">${fn:substring(o.name,0,30)}…</c:when>
						<c:otherwise>${o.name}</c:otherwise>
					</c:choose>
					
				</a>
				</td>
				<td class="list-text1">${o.viewNames}&nbsp;</td>
			</tr>
		</c:forEach>			
		</table>
		<kpi:page-bar formId="form1"/>
	</form>
	
</body>
	
</html>