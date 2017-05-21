  	 /**
  	  * 产品选择弹出框
  	  * @return {TypeName} 确定后返回选定的产品集合
  	  */
 	  function produce_open(options)
        {    
	 		 options = $.extend(true, {
				 multi : 1, //单选为1,多选为n,具体数字的话则为不超过该值选择，默认只能单选
				 onReturn : undefined
				}, options);
	 		   var produce_result = [];
	           $.ligerDialog.open({title: "产品选择", url: baseURL+'/testproddemo/dialog/proddialog/query.do?multi=' + options.multi, height: 500, width: 870, buttons: [
	                { text: '确定', onclick: function (item, dialog) {               
			                var grid1 = dialog.frame.grid1;
			                var data = grid1.getData(); //作为已选框，框中所选数据即为用户想要数据，不需要二次再选择
				                if(data && data.length > 0){
					                if(options.multi == 1 && data.length>1){
					               		 alert("只能选择一个产品!");
					               		 return false;
					                }else{
					                	//TODO 多选时要循环push值
					                	produce_result.push({typeId:data[0].typeId , name:data[0].name , decription:data[0].decription , store:data[0].store,
					                		cost: data[0].cost, price: data[0].price, weight:data[0].weight,
					                		prodDATE: data[0].prodDATE, expiDATE:data[0].expiDATE });
					                }
				                }
				             if(options.onReturn){
								 options.onReturn(produce_result);
							 }
				             dialog.close(); 
				             return false;
		               }
		                  },
		                { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
		             ], isResize: true
		            });
	          }