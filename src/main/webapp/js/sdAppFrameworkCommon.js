/*
 * jQuery app 应用公共方法
 * xiangsf 2012-3-12
 * 1、提供打开窗口window.open方法
 * 2、checkbox复选框的值以逗号分隔组成字符号
 * 3、一个判断空值的公共方法,传入节点或字符串或数组或对象本身的属性等，返回节点的value属性是否为空，字符串是否为空，数据是否空
 **/
jQuery.openWindow = function(options){
	//* 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'
	var s = $.extend({
		height    : 'auto',
		width	  : 'auto',
		top		  : 'auto',
		left	  : 'auto',
		toolbar	  : false,
		menubar	  : false,
		scrollbars: 'auto',
		resizable : true,
		location  : false,
		status	  : true,
		showCenter: true,
		name      : '',
		url 	  : null
	},options);
	s.height = s.height == 'auto' ? screen.height : s.height;
	s.width = s.width == 'auto' ? screen.width : s.width;
	s.top = s.showCenter || s.top == 'auto' ? (screen.height-s.height)/2 : s.top;
	s.left = s.showCenter || s.left == 'auto' ? (screen.left-s.left)/2 : s.left;
	s.height = (s.height == screen.height) ? s.height - 100 : s.height;
	s.width = s.width == screen.width ? s.width - 20 : s.width;
	window.open(s.url, s.name, 'height='+s.height+', width='+s.width+', top='+s.top+', left='+s.left
		+', toolbar='+(s.toolbar?1:0)+', menubar='+(s.menubar?1:0)+', scrollbars='+(s.scrollbars?1:0)+
		', resizable='+(s.resizable?1:0)+',location='+(s.location?1:0)+', status='+(s.status?1:0));
};
jQuery.isEmpty = function(ele){
	
	if(ele == null || ele == undefined) return true;

	if(jQuery.type(ele) === 'string'){
		return jQuery.trim(ele) === '';
	}else if(jQuery.type(ele) === 'array'){
		return ele.length == 0;	
	}else if(jQuery.type(ele) === 'object' && ele.value){
		return jQuery.trim(ele.value) === '';
	}else{
		return jQuery.isEmptyObject(ele);
	}
	return false;
};

/**
 * 格式化金额的数值显示，每隔3位加一个逗号
 * @param args
 * @returns
 */
jQuery.formatMoney = function(args) {
	
	if ($.isEmpty(args))
		return args;
	var temp = args + "";
	var point = temp.indexOf(".");
	var integer = temp;
	var decimal = "";
	if (point >= 0) {
		integer = temp.substring(0, point);
		decimal = temp.substring(point);
	}
	
	var formatValue = "";
	var commaIdx = integer.length % 3;
	for (var i = 0; i < integer.length; i++) {
		if (commaIdx == i) {
			if (commaIdx != 0)
				formatValue += ",";
			commaIdx += 3;
		}
		formatValue += integer.charAt(i);
	}
	formatValue += decimal;
	return formatValue;
};

(function($){
	$.fn.openWindow = function(options){
		var s = $.extend({},options);
		s.url = this.action || this.href || this.src;
		s.url += (s.url.indexOf('?')>0 ? $(this).serialize() : '?'+$(this).serialize());
		$.openWindow(s);
	},	
	$.fn.splitValue = function(symbol, attribute){
		symbol = symbol || ',';
		var strArray = [];
		$(this).each(function(idx, ele){
			if(this.tagName && this.tagName === "INPUT"){
				if(this.type=='checkbox' || this.type == 'radio'){
					if(this.checked)
						strArray.push(attribute ? $(this).attr(attribute) : $(this).val());
				}else{
					strArray.push(attribute ? $(this).attr(attribute) : $(this).val());
				}
			}else if(this.tagName && this.tagName === 'SELECT'){
				strArray.push(attribute ? $(this).attr(attribute) : $(this).val());
			}
		});
		return strArray.join(symbol);
	}
})(jQuery);