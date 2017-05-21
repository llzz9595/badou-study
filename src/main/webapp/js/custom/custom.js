  	 /**
  	  * 客户选择弹出框
  	  * @return {TypeName} 确定后返回选定的客户集合
  	  */
 	  function custom_open(options)
        {    
	 		 options = $.extend(true, {
				 multi : 1, //单选为1,多选为n,具体数字的话则为不超过该值选择，默认只能单选
				 onReturn : undefined
				}, options);
	 		   var custom_result = [];
	           $.ligerDialog.open({title: "客户选择", url: baseURL+'/custom/dialog/cusdialog/query.do?multi=' + options.multi, height: 500, width: 870, buttons: [
	                { text: '确定', onclick: function (item, dialog) {               
		                var grid1 = dialog.frame.grid1;
		                var data = grid1.getData(); //作为已选框，框中所选数据即为用户想要数据，不需要二次再选择
			                if(data && data.length > 0){
				                if(options.multi == 1 && data.length>1){
				               		 alert("只能选择一个客户!");
				               		 return false;
				                }else{
				                	//TODO 多选时要循环push值
				                		custom_result.push({name:data[0].name , id:data[0].id , area:data[0].areaName , unit:data[0].unit,
				                		receiver: data[0].receiver, sendAddress : data[0].sendAddress, tel:data[0].tel,
				                		receiverTel : data[0].receiverTel, receiverMobile :data[0].receiverMobile });
				                }
			                }
			             if(options.onReturn){
							 options.onReturn(custom_result);
						 }
			             dialog.close(); 
			             return false;
	               }
	                  },
	                { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
	             ], isResize: true
	            });
          }
          
		  
		  
//		 var str = '[{"uname":"王强","day":"2010/06/17"},{"uname":"王海云","day":"2010/06/11"}]';  
//　　for(var i=0;i<jsonList.length;i++){ 
//
//　　　　for(var key in jsonList[i]){ 
//　　alert("key："+key+",value："+jsonList[i][key]); 
//} 
//　　} 
		  
		  
 	   	/**
 	   	 * 客户地址弹出选择框 
 	   	 * @param {Object} customId
 	   	 */
       function cusaddress_open(options){
        	options = $.extend(true, {
				 multi : 1, //单选为1,多选为n,具体数字的话则为不超过该值选择，默认只能单选
				 customId : undefined,
				 onReturn : undefined
				}, options);
	 		   var custom_result = [];
	 		if(!options.customId){//必须有客户ID
	 			alert("传入客户ID为空!");
	 			return false;
	 		}
            $.ligerDialog.open({title: "客户送货地址选择", 
            	url: baseURL+'/custom/dialog/cusaddress/query.do?customId='+options.customId, height: 500, width: 650, buttons: [
            		{ text: '确定', onclick: function (item, dialog) {               
		                var grid = dialog.frame.grid;
		                var data = grid.getSelecteds();
		                if(options.multi == 1 && data.length > 1){
		               		 alert("只能选择一个送货地址!");
		                	return false;
		                }else{
		                	//多选时要循环push值
		                	if(data && data[0]){
			                	custom_result.push({receiver : data[0].receiver,
			                			 sendAddress:data[0].sendAddress , receiverTel : data[0].receiverTel});
		                	}else{
		                		alert("请选择一个送货地址!");
		                		return false;
		                	}
		                }
		                if(options.onReturn){
							 options.onReturn(custom_result);
						 }
			             dialog.close(); 
			             return false;
	               }
                },
                { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
             ], isResize: true
            });
          }