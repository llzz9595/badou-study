var Financial = {
	year :[],
    income :[],
    notIncome :[],
    total :[],
	getChart : function(y){
		 $.ajax({
            cache: false,
            async: false,
            url: baseURL+"/report/report/financiallist/list.do",
            data: "F=2&Y="+y,
            dataType: 'json', type: 'post',
            success: function (result){
                if(result && result.hasOk){
                	this.year = eval(result.bean.year);
					this.income = eval(result.bean.income);
					this.notIncome = eval(result.bean.notIncome);
					this.total = eval(result.bean.total);
					$('#container').highcharts({
			            chart: {
			                type: 'column',
			                marginRight: 30,
			                marginBottom: 60,
			                backgroundColor:'#F5F5F5',
			            	borderColor:'#CCCCCC',
			            	borderWidth:1
			            },
			            title: {
			                text: '应收款项统计表'
			            },
			           
			            //这个是横坐标的标注，需要我们根据查询范围，动态的去生产
			            xAxis: {
			                categories:this.year
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: '金额 (元)'
			                }
			            },
			            tooltip: {
			                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                    '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
			                footerFormat: '</table>',
			                shared: true,
			                useHTML: true
			            },
			            plotOptions: {
			                column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			            series: [{
			                name: '应收款',
			                color:'#8bbc21',
			                data: this.total
			    
			            }, {
			                name: '实收款',
			                color:'#2f7ed8',
			                data: this.income
			    
			            }, {
			                name: '未收款',
			                color:'#910000',
			                data: this.notIncome
			    
			            }]
			        });
                }else{
                	alert(result.message);
                	//if(result.tip == 'FAIL') window.close();
                }
            }
        });
	},
	selectYear : function(obj){
		//alert(obj.value);
		$("#form1").attr("action",baseURL+"/report/report/financiallist/list.do?Y="+obj.value);
		$("#form1").submit();
	}
};
