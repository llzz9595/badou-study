<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/pub/head.inc"%>
	<script src="${baseURL}/themes/plugin/ligerUI/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
	<title>示例3(树结构)框架</title>

	<script type="text/javascript">
            var tree = null;           
            var currentNodeId = "ROOT";
            $(function(){
                //布局
                $("#layoutFrame").ligerLayout({ leftWidth: 190, height: '100%',space:2});
				var height = $(".l-layout-center").height();
				 //Tab
                var tab = $("#framecenter").ligerTab({ height: height });
                //面板
                var accordion = $("#accordionFrame").ligerAccordion({ height: height - 5, speed: null });
                //使树结构的标头不显示
                $(".l-accordion-header").height("0px");
                //使左栏列表标头也不显示
                $("#framecenter .l-tab-links").height("0px");
 				 tree = $("#tree1").ligerTree({
 					 	url: '${baseURL}/moduledemo/fun3/fun3demotree/tree.do', 
 					 	checkbox: false,
 					 	idFieldName :'id',
            			parentIDFieldName :'pid',
            			textFieldName : "name",
            			attribute : ['id', 'name', 'pid'],
            			onSelect: function (node){	             
 					 		//获得节点ID值
		                    var nodeId = node.data.id;
 					 		//如果ID值为
		                    if(currentNodeId === nodeId) return false;
		                    //显示右边列表
		                    //contentFrame.FF_Reload(node.data);
		                    $("#contentFrame").attr("src", "${baseURL}/moduledemo/fun3/fun3demolist/list.do?pid="+nodeId);
		                 }
 					 });
                $("#pageloading").hide();
            });
	</script>
</head>
<body>
	<div id="pageloading"></div>
	<!-- BODY!!! -->
	<!-- 左边菜单!!! -->
	<div id="layoutFrame" style="width:99.2%; margin:0 auto;">
		<div position="left" title="示例3树结构" id="accordionFrame">
			<div title="(该标头隐藏不显示)" class="l-scroll">
				<ul id="tree1" style="margin-top:3px;"></ul><br/><br/>
			</div>                 
        </div>
		<!-- 右边内容!!! -->
		<div position="center" id="framecenter">
			<div tabid="tabContent" title="列表页面不显示标头" >
			<!-- 包含列表页面 -->
				<iframe frameborder="0" name="contentFrame" id="contentFrame" src="${baseURL}/moduledemo/fun3/fun3demolist/list.do"></iframe>
			</div>
		</div>
	</div>
</body>
</html>

