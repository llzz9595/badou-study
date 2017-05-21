/**
 * @description 区域选择树
 * @version 1.0
 * @author Lin
 */
function areatree(){
	var manager = $("#tree1").ligerGetTreeManager();
      		$("#tree1").ligerTree({
 					 url: '${baseURL}/custom/area/areatree/tree.do', 
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
		                    $("#contentFrame").attr("src", "${baseURL}/custom/area/arealist/list.do?pid="+nodeId);
		                 }
 					 });

 			

}