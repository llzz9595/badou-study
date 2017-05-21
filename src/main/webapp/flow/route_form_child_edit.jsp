<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人考核</title>
	</head>
	<script language="javascript">
function ev_save(){
	if(CheckForm(form1)){
		//如果是多目标环节的，则目标环节不可重复
		var nodeDom = document.getElementsByName("nextNodeCode");
		if(nodeDom && nodeDom.length>1){
			var arr = [];
			for(var i=0;i<nodeDom.length;i++){
				arr[i] = SelectUtil.getSelectedValue(nodeDom[i]);
			}
			for(var i=0;i<arr.length;i++){
				for(var j=0;j<arr.length;j++){
					if(i!=j && arr[i]==arr[j]){alert('目标环节不可重复!');return false;}
				}
			}
		}
		form1.action = "${ROOT}/editRoute.do1?routeCode=${flwRoute.id}";
	    form1.submit();
	}
}
function ev_show(v){
	var dom = document.form1.flgAttributeValue;
	if(v==1){
		dom.style.display = '';
		dom.select();
	}else{
		dom.style.display = 'none';
	}
}
function ev_showMulti(flg){
	var btn = document.getElementById("btnAddNode");
	if(flg == 1 || flg == 2){
		btn.style.display = '';
	}else{
		btn.style.display = 'none';
	}
}
var newItemRow = null;
function ev_addNode(){
	var tbl = document.getElementById('targetNode');
	var cloneRow = newItemRow.cloneNode(true);
	tbl.appendChild(cloneRow);
}
function ev_delNode(contralDOM){
	if(contralDOM){
		var parentDOM = contralDOM.parentNode;
		while(parentDOM){
			if(parentDOM.nodeName=='TR') {parentDOM.removeNode(true);break;}
			else parentDOM = parentDOM.parentNode;
		}
	}
}
</script>
	<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
		<br>
		<form id="form1" name="form1" method="post" action="">
			<table cellSpacing=0 cellPadding=0 width=600 align=center border=0 >
				<tr>
					<td>
						<br>
						<DIV class=tab-pane id=tabPane1>
							<SCRIPT type=text/javascript>
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</SCRIPT>
							<DIV class=tab-page id=tabPage1>
								<H2 class=tab>
									基本配置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<!-- 这里嵌套流程基本配置 -->
								<table class=box  cellSpacing=1 cellPadding=5 width="100%" border=0 >
									<TBODY>
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												路由名称：
											</TD>
											<TD width="72%" height=25>
												<INPUT  class=editline size=30 value="<bean:write name="flwRoute" property="name"/>" name="name" check="notBlank" showName="路由名称" required="true" maxlength="128"/>
											</TD>
										</TR>
									   <TR>
											<td align="right"></td>
											<TD align=left height=35>
												路由说明：
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwRoute" property="memo"/>" name="memo" maxlength="500"/>
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												提交按钮名称:
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwRoute" property="menuName"/>" name="menuName">
											</TD>
										</TR>	
									<TR>
											<td align="right"></td>
											<TD align=left height=35>
												路由类型:
											</TD>
											<TD height=25>
											<input type="radio" name="flgMultiNode" value="0" onclick="ev_showMulti(0);" ${flwRoute.flgMultiNode==0?'checked':'' }>普通路由
											<input type="radio" name="flgMultiNode" value="1" onclick="ev_showMulti(1);" ${flwRoute.flgMultiNode==1?'checked':'' }>多目标路由
											<input type="radio" name="flgMultiNode" value="2" onclick="ev_showMulti(2);" ${flwRoute.flgMultiNode==2?'checked':'' }>多目标单向路由
											</TD>
										</TR>								
									<!-- 	<TR>
											<td align="right"></td>
											<TD align=left height=35>
												路由属性:
											</TD>
											<TD height=25>
											<input type="radio" name="flgAttribute" value="back" onclick="ev_show(0);" ${flwRoute.flgAttribute=='back'?'checked':'' }>回退路由
											<input type="radio" name="flgAttribute" value="next" onclick="ev_show(0);" ${flwRoute.flgAttribute==null || flwRoute.flgAttribute=='next'?'checked':'' }>前进路由
											<input type="radio" name="flgAttribute" value="" onclick="ev_show(1);" ${flwRoute.flgAttribute!=null && flwRoute.flgAttribute!='back' && flwRoute.flgAttribute!='next'?'checked':'' }>自定义标识
											<input type="text" name="flgAttributeValue" size='5' value="${flwRoute.flgAttribute}" style="display:${flwRoute.flgAttribute!=null && flwRoute.flgAttribute!='back' && flwRoute.flgAttribute!='next'?'':'none'};" />
											</TD>
										</TR>
 										-->
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left>
												目标环节：
											</TD>
											<TD>
												<table cellSpacing=0 cellPadding=0 border=0 >
												<tbody id="targetNode">
												<c:if test="${flwRoute.flgMultiNode==1 || flwRoute.flgMultiNode==2}">
													<c:forEach var="o" items="${flwRoute.routeNodes}" varStatus="idx">
														<tr><td>
														<select name="nextNodeCode" >
															<c:forEach var="o1" items="${nodeList}">
																<option value="${o1.id}" ${o1.id==o.node.id ? 'selected' : ''}>${o1.nodeName}</option>
															</c:forEach>
														</select>
														<c:if test="${idx.count==1}">
															<input type="button" id="btnAddNode" style="display:'';" value="添加" onClick="ev_addNode();"/>
														</c:if>
														<c:if test="${idx.count>1}">
															<input type="button" name="btnDelNode" style="display:'';" value="删除" onClick="ev_delNode(this);"/>
														</c:if>
														</td></tr>
													</c:forEach>
												</c:if>
												<c:if test="${flwRoute.flgMultiNode==0}">
												<tr><td>
												<html:select name="routeForm" property="nextNodeCode">
													<html:optionsCollection name="nodeList" value="nodeCode" label="nodeName" />
												</html:select>
												<input type="button" id="btnAddNode" style="display:none;" value="添加" onClick="ev_addNode();"/>
												</td></tr>
												</c:if>
												</tbody>
												</table>
												<table style="display:none;" >
													<tr id="newTargetNode"><td>
														<select name="nextNodeCode" >
															<c:forEach var="o1" items="${nodeList}">
																<option value="${o1.id}" >${o1.nodeName}</option>
															</c:forEach>
														</select>
													<input type="button" name="btnDelNode" value="删除" onClick="ev_delNode(this);"/>
													</td></tr>
												</table>
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												排序号：
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwRoute" property="priority"/>" name="priority" check="notBlank;isInt('0+')" showName="排序号" required="true"/>
											</TD>
										</TR>
										</table>

							</DIV>
							<!-- 	整个TAB结束 -->
					</td>
				</tr>
			</table>
		</form>
</div></td></tr></table>
	</body>
	<script>
	window.onload = function(){
				 var tempRow = document.getElementById("newTargetNode");
				 newItemRow = tempRow.cloneNode(true);
				 tempRow.removeNode(true);
	}
</script>
</html>
