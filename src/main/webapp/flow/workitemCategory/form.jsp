<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.util.AddressHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.ViewDictionary"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorkItemCategory"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>

		<title>待办/已办类别配置</title>
		<%@ include file="/web/pub/head.inc"%>
		<script>
			function ev_save() {
				if(CheckForm($_E('form1'))) {
					$_E('form1').submit();
				}
			}
			function back() {
				window.close();
			}
			
			function ev_edit2(id) {
				openWin("${ROOT}/showViewDictionary.do1?id="+id,{showCenter:true,width:750,height:450});
			}
		</script>
		
	</head>
	<body>
		<br />
		<div align="left">
			<h2>
				待办/已办类别配置
			</h2>
		</div>
		<div id="div1" style="display:;">
			<table border="0" cellspacing="0" cellpadding="0" class="list-top">
				<tr>
					<td></td>
				</tr>
				<tr>
					<td class="list-caozuo">
						<a id="hlinkDelete" href="javascript:ev_save();">保存</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a id="hlinkDelete" href="javascript:back();">关闭</a>&nbsp;&nbsp;
						红星（<font color="red">*</font>）是必填
					</td>
				</tr>
			</table>
			<form action="${ROOT}/saveWorkItemCategory.do1" method="post" id="form1">
				<input type="hidden" value="${workItemCategory.id }" name="id" />
				<table class="formtext1" border="0" cellpadding="0" cellspacing="1">
					<tr>
						<td width="20%" class="t">
							类别名称 <font color="red">*</font>
						</td>
						<td width="80%">
							<input class='input-textline' type='text' size='79' maxlength="40" name="name" check="notBlank;" required="true" showName="类别名称"
								value='${workItemCategory.name}' />

						</td>
					</tr>	
					<tr>
						<td width="20%" class="t">
							序号 <font color="red">*</font>
						</td>
						<td width="80%">
							<input class='input-textline' type='text' size='10' maxlength="5" name="priority" check="notBlank;" required="true" showName="序号"
								value='${workItemCategory.priority}' />

						</td>
					</tr>				
					<tr>
						<td  class="t">
							相关视图 <font color="red">*</font>
						</td>
						<td >
							<%
								WorkItemCategory workItemCategory = (WorkItemCategory)request.getAttribute("workItemCategory");
							 %>
							<c:forEach var="busi" items="${busiList}">
								<table>
									<tr>
										<td>
											${busi.busiName }
										</td>
									</tr>
									<tr>
									<c:forEach var="view" items="${viewMap[busi.id]}" varStatus="viewIndex">
										<c:if test="${viewIndex.index%5 == 0 }">
										</tr>
										<tr>
										</c:if>
										<td>
											<input type="checkBox" name="viewId" value="${view.id}" 
											<%
											ViewDictionary view = (ViewDictionary)pageContext.getAttribute("view");
											if(workItemCategory.hasView(view)){
											%>
												checked
											<% }%>
											/>
											<a href="#" onclick="ev_edit2('${view.id}')">
												${view.name }
											</a>											
										</td>
									</c:forEach>
									</tr>
								</table>
							</c:forEach>							
						</td>
					</tr>
					
				</table>
				
				<br />
			</form>
		</div>

	</body>
</html>
