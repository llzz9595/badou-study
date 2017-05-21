<%-- 所有页面的公用头部  标签库--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>--%>
<%--<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>--%>
<%--<%@ taglib prefix="sjt" uri="/struts-jquery-tree-tags"%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!-- 自定义标签库 -->
<%@ taglib uri="/WEB-INF/tld/sd-frame.tld" prefix="sdframe" %>
<%@ taglib uri="/WEB-INF/tld/sd-ligerui-page.tld" prefix="sdpage" %>
<%@ taglib uri="/WEB-INF/tld/kpi.tld" prefix="kpi" %>
<%@ page isELIgnored="false"%>
<%  
  response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
  response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
  response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
  String baseURL = request.getContextPath();
%>
<%-- 全路径--%>
<c:set var="baseURL" value="http://${header.host}${pageContext.request.contextPath}" scope="request" /> 
 <script type="text/javascript">
 	var baseURL = "${baseURL}";
 </script>
<link rel="stylesheet" type="text/css" href="${baseURL}/jinhan/css/jinhanbase.css" />
<script src="${baseURL}/jinhan/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${baseURL}/jinhan/formvalidator4.1.3/formValidator-4.1.3.min.js" type="text/javascript"></script>
<script src="${baseURL}/jinhan/formvalidator4.1.3/formValidatorRegex.js" type="text/javascript"></script>