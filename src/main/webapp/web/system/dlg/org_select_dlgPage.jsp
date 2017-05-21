<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!-- Use Internet Explorer 9 Standards mode -->
 <meta http-equiv="x-ua-compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	我的地址本
</title>
</head>
<frameset id="frame" name="frame" cols="200,*" framespacing="0" frameborder="no" border="0">
  	<frame src="<%=request.getContextPath()%>/org_tree.do1?type=${param.type}&jsFunc=select_org_by_type&manage=${param.manage}&oids=${param.oids}" name="ftree" id="ftree" scrolling="no" noresize >
 	<frame src="<%=request.getContextPath()%>/orgSelecteForm.do1?multi=${param.multi}&manage=${param.manage}&type=${param.type}&oids=${param.oids}" name="fbody" id="fbody" scrolling="no">		
</frameset>
</html>
