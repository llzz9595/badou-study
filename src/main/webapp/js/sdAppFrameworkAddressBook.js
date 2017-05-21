//地址本弹出选择框，针对原KPI系统的组织架构
//@auth xiangsf 2013-3-15
(function ($)
{
	 $.fn.sdAddressBook = function (options)
    {
		 options = options || {};
		 options = $.extend(true, {
			 type : 20, //可以选择的数据类型，对应OrgType整型值
			 multi : 'n', //单选为1,多选为n,数字为不超过该值选择
			 manage : 3, //弹出的地址本内数据类型，比如全组织，我的部门，我的可管理部门，角色，群组等，由业务定义，3代表“我的可管理部门”
			 targetTextId : 'targetTextId',
			 targetValueId : 'targetValueId',
			 onReturn : undefined,
			 orgids : undefined
			}, options);
		 var datas = {};
		 var url = baseURL+"/web/system/dlg/org_select_dlgPage.jsp?type="+options.type+"&manage="+options.manage+"&multi="+options.multi+"&oids="+options.orgids;
		 
		 var ttext = $("#"+options.targetTextId);
		 if(!ttext){
			 alert('没有设置textID');
			return;
		 }
		 var tvalue = $("#"+options.targetValueId);
		 if(!tvalue){
			 alert('没有设置valueID');
			return;
		 }
		 var selectedText = ttext.val() || ttext.html();
		 var selectedValue = tvalue.val() || tvalue.html();
		 
		 var args = {targetTypeText:selectedText,targetTypeValue:selectedValue};
		 
		 var result = window.showModalDialog(url,args,"dialogWidth:900px; dialogHeight:560px");

		 if(options.onReturn){
			 options.onReturn(result);
		 }
		 //有返回值，说明是确定的，则赋值到指定域中
		 if(result){
			 if(ttext.val){
				 ttext.val(result.outputText);
			 } else{
				 ttext.html(result.outputText);
			 }
				 
			  if(tvalue.val){
				  tvalue.val(result.outputValue);
			  }else{
				  tvalue.html(result.outputValue);
			  }
			 if(result.outputDatas)
				 datas = eval('(' + result.outputDatas + ')');
		 }
        return datas;
    };
    
    
})(jQuery);