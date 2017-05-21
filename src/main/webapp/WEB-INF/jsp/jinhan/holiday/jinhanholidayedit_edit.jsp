<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
	<%@ include file="/jinhan/head.inc"%>
	<title>审核个人请假单</title>
	</head>
<body>
	<div id='center'>
	<h1>审核个人请假单</h1>
	<p>你的角色是${sessionScope.LOGON_KPIUSER.roleName}</p>
	<form  id="holiday_form"   onsubmit="return false;">
	<table style="text-align:left" >
			<tr>
			<td>用户ID</td>
			<td>${j.memberId}</td>
			</tr>

			<tr>
			<td>姓名</td>
			<td>${j.memberName}</td>
			</tr>
			
			<tr>
			<td>部门</td>
			<td>${j.memberPart}</td>
			</tr>
			
			<tr>
			<td>请假原因</td>
			<td>
			<c:if test="${j.reason=='1' }">事假</c:if>
			<c:if test="${j.reason=='2' }">病假</c:if>
			</td>
			</tr>
			
			<tr>
			<td>请假天数</td>
			<td>${j.days}</td>
			</tr>
			
			<tr>
			<td>请假起始时间</td>
			<td>${j.periodb}</td>
			</tr>
			
			<tr>
			<td>请假终止时间</td>
			<td>${j.periode}</td>
			</tr>
			
			<tr>
			<td>其他说明</td>
			</tr>
			<c:if test="${!empty j.link1}">
			<tr>
			<td>附件</td>
			<td>下载<a href="${baseURL}/jinhan/holiday/jinhanholidaysave/downholiday.do?id=${j.id}&link=1">${j.link1}</a></td>
			</tr>
			</c:if>
			<c:if test="${!empty j.link2}">
			<tr>
			<td>附件</td>
<td>下载<a href="${baseURL}/jinhan/holiday/jinhanholidaysave/downholiday.do?id=${j.id}&link=2">${j.link1}</a></td>
			</tr>
			</c:if>
			<c:if test="${!empty j.link3}">
			<tr>
			<td>附件</td>
<td>下载<a href="${baseURL}/jinhan/holiday/jinhanholidaysave/downholiday.do?id=${j.id}&link=3">${j.link1}</a></td>
			</tr>
			</c:if>
			<c:if test="${sessionScope.LOGON_KPIUSER.roleName=='HR'}">
			<tr>
			<td>HR审核意见</td>
			<td><textarea rows="10" cols="20" name="agreeAdviceh" >${j.agreeAdviceh}</textarea></td>
				<tr>
			<td>经理审核意见</td>
			<td>${j.agreeAdvicej}</td>
			</tr>
			</c:if>
			<c:if test="${sessionScope.LOGON_KPIUSER.roleName=='经理'}">
			<tr>
			<td>HR审核意见</td>
			<td>${j.agreeAdviceh}</td>
			<tr>
			<tr>			
			<td>经理审核意见</td>
			<td><textarea rows="10" cols="20" name="agreeAdvicej">${j.agreeAdvicej}</textarea></td>
			</tr>
			</c:if>
			<c:if test="${sessionScope.LOGON_KPIUSER.roleName=='码农'}">
			<tr>
			<td>HR审核意见</td>
			<td>${j.agreeAdviceh}</td>
			<tr>
			<tr>			
			<td>经理审核意见</td>
			<td>${j.agreeAdvicej}</td>
			</tr>
			</c:if>
			<tr>
			<td>审核结果</td>
			<td>
			<c:if test="${j.agreeFlag=='0' }">审核中</c:if>	
			<c:if test="${j.agreeFlag=='1' }">已审核</c:if>
			</td>
			</tr>
	</table>
	<c:if test="${sessionScope.LOGON_KPIUSER.roleName!='码农'}">
	<button  onclick="update()">进行审核或修改意见</button>
	</c:if>
				
	<p>说明：审核请假单，只有权限高的人才可以审核</p>
	
	<input type="hidden" name="id"  value="${j.id}" />
	</form>
	
	
	</div>

	<script type="text/javascript">
	function update(){
		var holiday_form=$("#holiday_form");
		var url = "${baseURL}/jinhan/holiday/jinhanholidayedit/agree.do";
/*		$.post(url,holiday_form.serialize(),function(data){
		alert(data);
			if(data=="good"){
				alert("审核成功");
				window.location = "${baseURL}/jinhan/holiday/jinhanholidaylist/list.do";
			}else if(data=="notbad"){
				alert("你是HR且该员工请假天数大于3天，等待经理审核");		
				window.location = "${baseURL}/jinhan/holiday/jinhanholidaylist/list.do";
			}else if(data=="null"){
				alert("HR审核意见不能为空");	
			}else{
				alert(data);
			}
		});*/
		$.ajax({
		    type: 'post',
		    url: url,
	//	    asyc:false,
		    data: holiday_form.serialize(),
		   success: function(data) {
				if(data=="good"){
					alert("审核成功");
		window.location = "${baseURL}/jinhan/holiday/jinhanholidaylist/list.do";
				}else if(data=="notbad"){
					alert("你是HR且该员工请假天数大于3天，等待经理审核");		
		window.location = "${baseURL}/jinhan/holiday/jinhanholidaylist/list.do";
					close();
				}else if(data=="null"){
					alert("要先经过人力资源审核");	
				}else{
					alert("不需要你审核");
				}
		    },
		    error:function(data){alert("审核失败");}
		});
		

	}
	</script>
	</body>
</html>