<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/pub/head.inc"%>
<title>${basePageTitle}</title>

<script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = new Array();           
                   
            $(function ()
            {
                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();
                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });            
              	
                <c:forEach var="o" items="${menus}" varStatus="idx">
                	$("#tree${idx.count}").ligerTree({
		                    data : ${o.treeJson},
		                    checkbox: false,
		                    slide: false,
		                    nodeWidth: 120,
		                    attribute: ['id', 'pid', 'url'],
		                    onSelect: function (node)
		                    {	                    	
		                        if (!node.data.url || $.trim(node.data.url)=='') return;
		                        var tabid = node.data.id;
		                        
		                        f_addMenuTab(tabid, node.data.text);
		                    }
		                });
						tree.push($("#tree${idx.count}").ligerGetTreeManager());
                </c:forEach>          
                
                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
            
            function f_addMenuTab(tabid,text)
            { 
            	//通过后台组装地址转发
            	var f_url = "${baseURL}/frame/index/forward.do?menuId="+tabid;
            	if(tab.isTabItemExist(tabid)){
            		tab.selectTabItem(tabid);
            		tab.reload(tabid);
            	}else{
            		 tab.addTabItem({ tabid : tabid,text: text, url: f_url });
            	}
            } 
     </script>
</head>
<body>
	<div id="pageloading"></div>
	<!-- BODY!!! -->
	<!-- 左边菜单!!! -->
	<div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; ">
		<div position="left" title="运营支撑系统" id="accordion1">
		<c:forEach var="o" items="${menus}" varStatus="idx">
			<div title="${o.treeNodeName}" class="${idx.count==1 ? 'l-scroll' : ''}">
				<ul id="tree${idx.count}" style="margin-top:3px;"></ul>			
            </div>
		</c:forEach>                            
        </div>
		<!-- 右边内容!!! -->
		<div position="center" id="framecenter">
			<div tabid="home" title="我的桌面" style="height:300px">
				<iframe frameborder="0" name="home" id="home" src="${baseURL}${indexUrl}"></iframe>
			</div>
		</div>

	</div>
</body>
</html>

