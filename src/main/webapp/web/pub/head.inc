
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/kpi.tld" prefix="kpi" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/page-tool.tld" prefix="page" %>
<%  
  response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
  response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
  response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
  final String context = request.getContextPath();//qq 
  request.setAttribute("vEnter", "\n");
%>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/kpi.css"> 
<script type="text/javascript">
	var context = "${ROOT}";	
</script>
<script src="${ROOT}/js/Check.js"></script>
<script src="${ROOT}/js/common.js"></script>
<script src="${ROOT}/js/common1.js"></script>
<script src="${ROOT}/js/pub.js"></script>
<script src="${ROOT}/js/util.js"></script>
<script src="${ROOT}/js/ajax.js"></script>
<script src="${ROOT}/js/tip.js"></script>
<script src="${ROOT}/js/prototype.js"></script>
<script src="${ROOT}/js/query.js"></script>
<script src="${ROOT}/js/dataprocessor.js"></script>
<script src="${ROOT}/js/pub.js"></script>
<script src="${ROOT}/web/flow/js/flow.js"></script>
<script>


function fun_attachEvent(){
	var tables = Util.$_ECss(document,"table","list-box");
		if(tables.length > 0) {
			for(var i=0;i<tables.length;i++) {
				if (tables[i].highLight != "false") {
					TableUtil.enableHighlightTr(tables[i]);
				}
			}
		}
}

if (window.addEventListener) {
	window.addEventListener('DOMContentLoaded', fun_attachEvent, false); //firefox
	window.addEventListener('load', fun_attachEvent, false);
} else if (window.attachEvent) {
   window.attachEvent('onload', fun_attachEvent); //IE
   /*
   window.attachEvent("onload", function() {  //IE 仅支持IE的实现
		var tables = Util.$_ECss(document,"table","list-box");
		if(tables.length > 0) {
			for(var i=0;i<tables.length;i++) {
				if (tables[i].highLight != "false") {
					TableUtil.enableHighlightTr(tables[i]);
				}
			}
		}
	}); */
}
; 



	
</script>