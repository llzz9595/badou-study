<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	${basePageTitle}
</title>
<%@ include file="/web/pub/head.inc"%>
</head>
<body >
	<div class="kpi">
		<div id="divTree" class="sidebar">
			<h3>组织架构</h3>
			<iframe id="ftree" src="${ROOT}/treeOrg.do1?jsFunc=list_group" scrolling="auto"  frameborder="0" name="ftree" width="100%" height="450px"></iframe>
		</div>
		<div id="divList" class="content2">
			<iframe src="${ROOT}/listGroup.do1" id="fbody" scrolling="no" frameborder="0" name="fbody" width="100%" height="450px"></iframe>
		</div>
		<div id="divForm" class="content2" style="width: 0" >
			<iframe src="about:blank" id="fform" scrolling="no" frameborder="0" name="fform" width="100%" height="450px"></iframe>
		</div>
	</div>
</body>
</html>
