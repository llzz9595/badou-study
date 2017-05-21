<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/pub/head.inc"%>
<html>
  <head>
  	<title>员工导入导出</title>
  	<script src="${ROOT}/themes/js/tab/tabpane.js" type="text/javascript"></script>
  	<script src="${ROOT}/js/util.js" type="text/javascript"></script>
  	<script src="${ROOT}/js/dataprocessor.js"></script>
	<link type="text/css" rel="stylesheet" href="${ROOT }/themes/css/tab/tab.css">
  	<script  type="text/javascript">
	$(function() {
		$("#form1").validate({
			 /* 重写错误显示消息方法,以alert方式弹出错误消息 */ 
	    	 showErrorTipWay: 2
		});
		//关闭按钮
		$("#btnClose").click(function(){
			if(window.confirm("您确定要关闭当前窗口!")){
				window.close();
			}
		});
		//确定按钮
		$("#btnConfirm").click(function(){
				$("#form1").ajaxSubmit({
					url: $("#opType").val()=='4' ? '${ROOT}/importAddUser.do1' : '${ROOT}/importModifyUser.do1',
					beforeSubmit: function(){
						if($("input[name='userId']").length == 0){
							alert("没有需要操作的数据!请关闭本页面重新选择文件导入后，然后再试一次。");
							return false;
						}
						if($("#form1").valid()){
							showProcessor();
						 	return true;
						 }
						return false;
					},
					success: function(data) { 
						if(data && data == 'ok'){
							alert("操作成功!");
							hideProcessor();
							window.close();
						}else{
							alert("操作出错!"+data);
							hideProcessor();
						}
					}
				});
		});
	});
	function FF_SetSame(name, value, index){
		$("#"+name+"_"+index).attr("value", $("#"+name+"_"+(index-1)).val());
		$("#"+value+"_"+index).attr("value", $("#"+value+"_"+(index-1)).val());
	}
	
  	</script>
  </head>
  
<body class="LN_body">
<form name="fileForm" method="post" action="${ROOT}" id="fileForm" enctype="multipart/form-data" style="display:none;">	
<input accept="application/msExcel" type="file" id="excelAddFile" name="excelAddFile" size="40" value="${param.filePath}"/>
</form>
<form name="form1" method="post" action="${ROOT}" id="form1" >	
<input type="hidden" name="orgId" value="${org.id}"/>
<input type="hidden" name="opType" id="opType" value="${opType}"/>
<div class="LN_popupsBox" style="width:150%">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" id="btnClose" >关闭</a></div>
<div class="LN_popupsRouteSubmit"><a href="#" id="btnConfirm">确定</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工${opType == 1 ? '修改' : '新增'}导入编辑</div>
<div class="LN_colorRed">说明：1、带有红星*的列是必填
2、因员工所属组织、考核类型、上级领导三项关系到系统具体考核业务范畴，请仔细核对后再进行确定保存。</div>
<div class="tab-pane" id="tabPane">
		<div class="tab-page" id="tabPage1">
		<h2 class="tab">员工编辑</h2>
			<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
			<c:if test="${userRights !=null and fn:length(userRights) > 0}">
		     <tr>
		     	<td align="center" class="LN_tableBoxtitle2" colspan="10">基本信息</td>
		     	<td align="center" class="LN_tableBoxtitle2" colspan="3">考核信息</td>
		     </tr>
     		 <tr>
       			 <td  class="LN_tableBoxtitle2">序号</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>排序号</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>员工编号</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>OA登陆帐号</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>姓名</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>组织</td>
       			 <td  class="LN_tableBoxtitle2">岗位</td>
       			 <td  class="LN_tableBoxtitle2">岗位层级</td>
       			 <td  class="LN_tableBoxtitle2">email</td>
       			 <td  class="LN_tableBoxtitle2">联系方式</td>
       			 <td  class="LN_tableBoxtitle2"><font color='red'>*</font>考核类型</td>
       			 <td  class="LN_tableBoxtitle2">上级领导</td>
       			 <td  class="LN_tableBoxtitle2">专业对口人员</td>
      		</tr>
      		<c:forEach var="o" items="${userRights}" varStatus="idx">
      			<input type="hidden" name="userId" value="${o.id}"/>
      			<tr>
      				<td class="LN_tableBoxText2">${idx.count}</td>
      				<td class="LN_tableBoxText2">
      				<input type="text" name="priority" value="${o.priority}" size="1" class="required" min="0" max="9999" showName="排序号"/>
      				</td>
      				<td class="LN_tableBoxText2"><input type="text" name="logonId" value="${o.logonId}" size="8"
      				class="required" maxlength="32" showName="员工编号"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="uuvId" value="${o.uuvId}" size="8"
      				class="required" maxlength="32" showName="OA登陆账号"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="userName" value="${o.name}" size="8"
      				class="required" maxlength="50" showName="姓名"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="orgName" id="orgName_${idx.count}" value="${o.orgName}" size="15"
      					readOnly="true" class="required" showName="组织"/>
      				<input type="hidden" name="orgText" id="orgText_${idx.count}" value="${o.orgText}"/>
      				<input type="button" class="LN_choose" value="选择" onclick="getAddressList('0','1','3','orgName_${idx.count}','orgText_${idx.count}')"/>
      				<c:if test="${idx.count>1}"><a href="javascript:void(0)" onclick="FF_SetSame('orgName','orgText',${idx.count});return false;">同上</a></c:if>
      				</td>
      				<td class="LN_tableBoxText2"><input type="text" name="positionName" value="${o.positionName}" size="10"
      				maxlength="50" showName="岗位"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="positionLayer" value="${o.positionLayer}" size="10"
      				maxlength="50" showName="岗位层级"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="email" value="${o.email}" size="15"
      				maxlength="50" showName="email"/></td>
      				<td class="LN_tableBoxText2"><input type="text" name="xlt" value="${o.xlt}" size="15"
      				maxlength="50" showName="联系方式"/></td>
      				<td class="LN_tableBoxText2">
      				<kpi:dictionary-select  name='assessmentType' type='USER_ASS_TYPE' style="width:80px;" selected="${o.assType}" htmlType="select"/>
      				</td>
      				<td class="LN_tableBoxText2">
      				<input type="text" name="preManagerName" id="preManagerName_${idx.count}" value="${o.preManagerName}" size="8"
      				readOnly="true"/>
      				<input type="hidden" name="preManagerText" id="preManagerText_${idx.count}" value="${o.preManagerText}"/>
      				<input type="button" class="LN_choose" value="选择" onclick="getAddressList('20','1','3','preManagerName_${idx.count}','preManagerText_${idx.count}')"/>
      				<c:if test="${idx.count>1}"><a href="javascript:void(0)" onclick="FF_SetSame('preManagerName','preManagerText',${idx.count});return false;">同上</a></c:if>
      				</td>
      				<td class="LN_tableBoxText2">
      				<textarea rows="3" cols="20" name="uniformUser" id="uniformUser_${idx.count}"
      				readOnly="true" maxlength="500" showName="专业对口人员">${o.uniformUsers}</textarea>
      				<input type="hidden" name="uniformUserText" id="uniformUserText_${idx.count}" value="${o.uniformUserText}"/>
      				<input type="button" class="LN_choose" value="选择" onclick="getAddressList('20','n','3','uniformUser_${idx.count}','uniformUserText_${idx.count}')"/>
      				<c:if test="${idx.count>1}"><a href="javascript:void(0)" onclick="FF_SetSame('uniformUser','uniformUserText',${idx.count});return false;">同上</a></c:if>
      				</td>
      			</tr>
      		</c:forEach>
      		</c:if>
      		<c:if test="${userRights ==null or fn:length(userRights) == 0}"> 
      			<tr>
       			 <td class="LN_tableBoxText2">本次导入的Excel中没有需要${opType == 1 ? '修改' : '新增'}的员工。</td>
       			</tr> 
     		 </c:if>
     		 </table>
		</div>
		<div class="tab-page" id="tabPage2">
		<h2 class="tab">导入信息</h2>
			<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
			<c:if test="${userErrors !=null and fn:length(userErrors) > 0}">
     		 <tr>
       			 <td width="5%" class="LN_tableBoxtitle2">序号</td>
       			 <td width="8%"  class="LN_tableBoxtitle2">排序号</td>
       			 <td width="10%" class="LN_tableBoxtitle2">员工编号</td>
       			 <td width="10%" class="LN_tableBoxtitle2">姓名</td>
       			 <td width="10%" class="LN_tableBoxtitle2">岗位</td>
       			 <td width="10%" class="LN_tableBoxtitle2">岗位层级</td>
       			 <td width="10%" class="LN_tableBoxtitle2">email</td>
       			 <td width="10%" class="LN_tableBoxtitle2">联系方式</td>
       			 <td width="*" class="LN_tableBoxtitle2">导入信息</td>
       		</tr>
       		<c:forEach var="o" items="${userErrors}" varStatus="idx">
      			<tr>
      				<td class="LN_tableBoxText2">${idx.count}</td>
      				<td class="LN_tableBoxText2">${o.priority}</td>
      				<td class="LN_tableBoxText2">${o.logonId}</td>
      				<td class="LN_tableBoxText2">${o.name}</td>
      				<td class="LN_tableBoxText2">${o.positionName}</td>
      				<td class="LN_tableBoxText2">${o.positionLayer}</td>
      				<td class="LN_tableBoxText2">${o.email}</td>
      				<td class="LN_tableBoxText2">${o.xlt}</td>
      				<td class="LN_tableBoxText2">${o.importInfo}</td>
      			</tr>
      		</c:forEach>
      		</c:if>
      		<c:if test="${userErrors ==null or fn:length(userErrors) == 0}">
      			 <tr>
       			 <td class="LN_tableBoxText2">本次导入的Excel中没有错误信息。</td>
       			 </tr>
      		</c:if>
     		</table>
		</div>
</div>
</div>
</div></form>
</body>
</html>