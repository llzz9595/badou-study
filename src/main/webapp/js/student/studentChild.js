//财务交易记录JS 因为include：jsp 只能在页面加载完后才能执行
		$(function(){
			$("#transactionTypeSearch").ligerComboBox().setData(${transactionTypeItem});
		})
		
  		var baseUrl2 = '${baseURL}/account/transaction/transactionrecord';
      //List 
      var grid = $("#maingrid").ligerGrid({ 
          columns: [
        			{display:"交易号",name:"transactionNumber",width:150,type:"String",align:"center",isSort : true},
					{display:"交易类型",name:"transactionTypeShow",width:150,type:"Integer",align:"center",isSort : true},
					{display:"交易时间",name:"transactionTime",width:150,type:"String",align:"center",isSort : true},
        			{display:"交易金额",name:"transactionSum",width:150,type:"String",align:"center",isSort : true},
					{display:"交易方式",name:"transactionStatusShow",width:150,type:"String",align:"center",isSort : true}      	 		             
					        	 		             
   		  			],
          dataAction: 'server',
          url:  baseUrl2+'list/listJSON.do?id=${id}', sortName: 'code',
          width: '98%', height: '100%',heightDiff:-10, checkbox: true,
          pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
          rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
          sortorderParmName:"sortOrder",pageSize: ${pageSize}
      });

	  //搜索事件
      $("#btnSearch").click(function(e){
    	  var transactionTypeSearch = $("#transactionTypeSearch").ligerComboBox().getValue();
    	  $("#transactionType").val(transactionTypeSearch);
    	  var json = LG.bulidFilterParams($("#formsearch"));
          grid.set('parms', json);
            //采用原来的请求地址，带上参数加载数据
		  grid.loadData();
      });
  	  
  	   //重置事件
      $("#btnReset").click(function(e){
           grid.set('parms', null);
            //采用原来的请求地址，带上参数加载数据
		   grid.loadData();
      });
	  
	   $("#formsearch").ligerForm();
	  
	   
	 //财务交易记录JS 因为include：jsp 只能在页面加载完后才能执行 故而写在首页面
		$(function(){
			$("#integralTypeSearch").ligerComboBox().setData(${transactionTypeItem});
		})
		
 		var baseUrl3 = '${baseURL}/account/integral/integralrecord';
     //List 
     var gridintegral = $("#maingridintegral").ligerGrid({ 
         columns: [
       			{display:"交易号",name:"integralNumber",width:150,type:"String",align:"center",isSort : true},
					{display:"交易类型",name:"integralTypeShow",width:150,type:"Integer",align:"center",isSort : true},
					{display:"交易时间",name:"integralTime",width:150,type:"String",align:"center",isSort : true},
       			{display:"交易金额",name:"integralSum",width:150,type:"String",align:"center",isSort : true},
					{display:"交易方式",name:"integralStatusShow",width:150,type:"String",align:"center",isSort : true}      	 		             
					        	 		             
  		  			],
         dataAction: 'server',
         url:  baseUrl3+'list/listJSON.do?id=${id}', sortName: 'code',
         width: '98%', height: '100%',heightDiff:-10, checkbox: true,
         pageParmName:"pageNo",pageSizeOptions:[${pageOptions}],pagesizeParmName:"perPageSize",
         rowHeight:23,rownumbers:true,isScroll:true,sortnameParmName:"sortName",
         sortorderParmName:"sortOrder",pageSize: ${pageSize}
     });

	  //搜索事件
     $("#btnSearchintegral").click(function(e){
   	  var integralTypeSearch = $("#integralTypeSearch").ligerComboBox().getValue();
   	  $("#integralType").val(integralTypeSearch);
   	  var json = LG.bulidFilterParams($("#integralsearch"));
   	  gridintegral.set('parms', json);
           //采用原来的请求地址，带上参数加载数据
		  gridintegral.loadData();
     });
 	  
 	   //重置事件
     $("#btnResetintegral").click(function(e){
   	  gridintegral.set('parms', null);
           //采用原来的请求地址，带上参数加载数据
		   gridintegral.loadData();
     });
	  
	   $("#integralsearch").ligerForm();
	  