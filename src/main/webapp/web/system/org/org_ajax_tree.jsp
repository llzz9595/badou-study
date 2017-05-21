<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.system.org.service.IOrgService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.Org"/>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<% 
	String type = com.shengdai.kpi.util.ParamUtils.getParameter(request, "type", "0");
	IOrgService orgService = (IOrgService)SpringHelper.getBean("orgService");
	List orgList = orgService.listAdminRootOrg();
	String tmpIds="";
		for (int i=0;i<orgList.size();i++){
			if(!"".equals(tmpIds)){
				tmpIds+=";"+((Org)orgList.get(i)).getId();
			}else{
				tmpIds=((Org)orgList.get(i)).getId();
			}
			
		}
	
%>
<html>
<head>
<title>组织架构</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${ROOT}/component/xtree/xtree.css" rel="stylesheet" type="text/css" />
<script src="${ROOT}/js/pub.js"></script>
<script>
var context = '${ROOT}';
var rootId = '<%=Globals.ROOT_ID%>';
function openRight(id) {
	var appcontext = "";
	var targetTypeID = rootId;
	if(id != '0') {
		targetTypeID = id;
	}
	url="${ROOT}/orgOptions.do1?id="+targetTypeID+"&type=<%=type%>&"+Math.random();
	parent.parent.fbody.fbody.location.href = url;	
	

}
	ie4 = (document.all) ? true : false; 
	function keyDown(e){ 

		if(ie4){ 
			var realkey=String.fromCharCode(event.keyCode); 
			if(event.keyCode==27){
				//window.close();
				parent.parent.fbody.saveSelectedValue();
			} 
		} 
	} 
	document.onkeydown = keyDown; 
</script>
<script type="text/javascript">
				//组织列表
				function list_org(id) {
					var targetTypeID = rootId;
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listOrg.do1?id='+targetTypeID);
				}

						
				//岗位列表
				function list_position(id){
					var targetTypeID = rootId;
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listPosition.do1?id='+targetTypeID);
				}
				
				//员工列表
				function list_user(id){
					var targetTypeID = rootId;
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listUserByOrg.do1?orgId='+targetTypeID);
				}
				
				//流程管理
				//组织考核流程
				function listFlowByDDCL(id) {
					if(id=='0') id = rootId;
					parent.fbody.location.href='${ROOT}/listFlowByOrg.do1?orgId='+id+"&busiId=DDCL";
				}
				
</script>	
<script src="${ROOT}/component/xtree/xtree.js"></script>
<script src="${ROOT}/component/xtree/xloadtree.js"></script>
<script src="${ROOT}/component/xtree/xmlextras.js"></script>
<script src="${ROOT}/js/util.js"></script>
</head>
<body style="margin-top:0px;margin-left: 0px;background-color:#fff;" class="scroll-net">
<input type="hidden" name="scope" id="scope" value="<%=tmpIds%>">
<script type="text/javascript">
	var tree = new WebFXLoadTree("${ROOTNAME}", "${ROOT}/treeAdminScopeRootOrg.do1?js=${jsFunc}&nocache="+Math.random());
	tree.action="javascript:${jsFunc}('0');";
	document.write(tree);
	tree.expand();
</script>
</body>
</html>