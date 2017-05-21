<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
    <title>首页待办列表</title>
    <style>
    	a:link,a:visited{font-size: 12px;color: #000;}/*<!--默认链接开始*/
		a:hover,a:active {font-size: 12px;color: #1447CA;text-decoration:none;}/*默认链接结束--!>*/
    </style>
	<script type="text/javascript">
		$(function(){
			//待办更多
			$(".morelink a").click(function(){
				var status = $(this).attr("status");
				if(parent && parent.f_addTab){
					if(status == '1'){
						parent.f_addTab("undoList", '我的待处理事项', baseURL + "/process/gtasks/worklist/undolist.do");
					}else{
						parent.f_addTab("doneList", '我的已处理事项', baseURL + "/process/gtasks/worklist/donelist.do");
					}
				}else{
					if(status == '1'){
						windwo.location.href = baseURL + "/process/gtasks/worklist/undolist.do";
					}else{
						windwo.location.href = baseURL + "/process/gtasks/worklist/donelist.do";
					}
				}
				return false;
			});
			//待办列表打开待办事件
			$(".undo").click(function(e){
				var wid = $(this).attr("id");
				$.openWindow({url:"${baseURL}/process/gtasks/works/undo.do?worklistItemId="+wid+"&"+Math.random()});
			});
			//已办列表打开已办事件
			$(".done").click(function(e){
				var wid = $(this).attr("id");
				$.openWindow({url:"${baseURL}/process/gtasks/works/done.do?worklistItemId="+wid+"&"+Math.random()});
			});
		});
	</script>
</head>
<body>
<table width="99%" border="0" cellspacing="0" cellpadding="0" class="infbox-border">
        <tr>
          <td class="boxtitlebg">
          <div class="boxtitbg">待处理事项</div>
          <div class="morelink"><a href="#" status="1">更多</a></div></td>
        </tr>
        <tr>
          <td class="press">
          <table class="mainright" border="0" cellspacing="0" cellpadding="0">
              <tr>
  				<td width="5%" class="right-field">序号</td>
                <td width="45%" class="right-field">标题</td>
                <td width="20%" class="right-field">状态描述 </td>
                <td width="15%" class="right-field">到达时间</td>
                <td width="*" class="right-field"></td>
              </tr>
              <c:forEach var="o" items="${undoList}" varStatus="idx">
              		<tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" class="right-color${idx.count%2==1 ? '1' : '2'}">
	                      <td class="right-text">${o.id != null ? idx.count : ''}</td>
	                      <td class="right-text">
	                      <a href="#" class="undo" id="${o.id}">${o.title}</a></td>
	                      <td class="right-text">${o.nodeName}</td>
	                      <td class="right-text"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	                      <td class="right-text">&nbsp;</td>
	                </tr>
              </c:forEach>
          </table></td>
        </tr>
      </table>
      <br />
<table width="99%" border="0" cellspacing="0" cellpadding="0" class="infbox-border">
        <tr>
          <td class="boxtitlebg"><div class="boxtitbg">已处理事项</div>
              <div class="morelink"><a href="#" status="2">更多</a></div></td>
        </tr>
        <tr>
          <td class="press">
          <table class="mainright" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%" class="right-field">序号</td>
                <td width="45%" class="right-field">标题</td>
                <td width="20%" class="right-field">状态描述 </td>
                <td width="15%" class="right-field">到达时间</td>
                <td width="15%" class="right-field">处理时间</td>
              </tr>
                	<c:forEach var="o" items="${doneList}" varStatus="idx">
              		<tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''"
              				 class="right-color${idx.count%2==1 ? '1' : '2'}">
	                      <td class="right-text">${o.id != null ? idx.count : ''}</td>
	                      <td class="right-text">
	                      <a href="#" class="done" id="${o.id}">${o.title}</a></td>
	                      <td class="right-text">${o.nodeName}</td>
	                      <td class="right-text"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	                      <td class="right-text"><fmt:formatDate value="${o.finishDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	                </tr>
              </c:forEach>
          </table></td>
        </tr>
      </table>
    <br/>
</body>
</html>
