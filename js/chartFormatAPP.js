var option = {
			        title: {
			            text: '当月收入',
			            subtext: '单位：亿元',
			            textStyle:{
			            	fontSize:14
			            }
			        },
			        grid: {
			            left: '3%',   //图表距边框的距离
			            right: '4%',
			            bottom: '3%',
			            containLabel: true
			        },
			        legend: {
			            data:['2017年','2018年'],
			            x:'right'
			        },
			        tooltip : {
				        trigger: 'axis',
				        show: true
			        },
			        //x轴信息样式
			        xAxis: {
			            type: 'category',
			            boundaryGap: false,
			            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			            axisLabel : {
	                         interval: 0,
	                         textStyle:{
	                        	 fontSize:10
	                         }
	                     }
			        },
			        yAxis : [
			                 {
			                     type : 'value',
			                     axisLabel : {
			                         formatter: '{value}',
			                         interval: 0,
			                         textStyle:{
			                        	 fontSize:10
			                         }
			                     }
			                 }
			        ],
			        series: [
			            {
			                name:'2017年',
			                type:'line',        
			                data:[],
			              
			            },
			            {
			                name:'2018年',
			                type:'line',
			                data:[],
			                itemStyle: {
				            	normal:{
				            		color:'rgb(48,167,152)'
				            	}
				            }
			               
			            }
			        ]
			    };
			

			var optionTB = {
			        // 标题
			        title: {
			            text: '同比增幅',
			            subtext:'',
			            textStyle:{
			            	fontSize:14
			            }
			        },
			        grid: {
			            left: '3%',   //图表距边框的距离
			            right: '4%',
			            bottom: '3%',
			            containLabel: true
			        },
			        legend: {
			            data:['2017年','2018年'],
			            x:'right'
			        },
			        tooltip : {
				        trigger: 'axis',
				        show: true
			        },
			        //x轴信息样式
			        xAxis: {
			            type: 'category',
			            boundaryGap: false,
			            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			            axisLabel : {
	                         interval: 0,
	                         textStyle:{
	                        	 fontSize:10
	                         }
	                     }
			        },
			        yAxis : [
			                 {
			                     type : 'value',
			                     axisLabel : {
			                         formatter: '{value}%'
			                     }
			                 }
			        ],
			        series: [
			            {
			                name:'2017年',
			                type:'line',   
			                data:[],
			               
			       
			            },
			            {
			                name:'2018年',
			                type:'line',
			                data:[],
			                itemStyle: {
				            	normal:{
				            		color:'rgb(48,167,152)'
				            	}
				            }
			                
			            }
			        ]
			    };

		
var provinceOption = {
				    title : {
				        text: '各省收入对比',
				        subtext: '',
				        textStyle:{
				        	fontSize:14
			            }
				    },
				    grid:{
				    	left:'14%',
				    	bottom:50
				    },
				    legend: {
				        data:['当月收入', '同比增幅'],
				        x:'right'
				    },
				    tooltip : {
				        trigger: 'axis',
				        formatter: function(params) {
			                var res = params[0].name+'<br/>';  
			                var myseries = provinceOption.series;
			                for (var i = 0; i < myseries.length; i++) {  
			                    for(var j=0;j<myseries[i].data.length;j++){
			                        if(j == params[0].dataIndex){
			                        	if(i == 0) {
			                        		res+=myseries[i].name +' : '+myseries[i].data[j]+'<br>';
			                        	} else {
			                        		res+=myseries[i].name +' : '+myseries[i].data[j]+'%';
			                        	}
			                              
			                        }  
			                    }  
			                }  
			                return res;  
			            }  
				    },
				    xAxis : [
				             {
				                 type : 'category',
				                 data : ['北京','天津','河北','山西','内蒙古','辽宁','吉林','黑龙江','山东','河南','上海','江苏','浙江','安徽','福建','江西','湖北','湖南','广东','广西','海南','重庆','四川','贵州','云南','西藏','陕西','甘肃','青海','宁夏','新疆','总部及子公司'],
				             	  axisLabel:{
				             		interval: '0',
				             		formatter:function(params) {
                                        var newParamsName = "";
                                        var paramsNameNumber = params.length;
                                        var provideNumber = 1;  //一行显示几个字
                                        var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                                        if (paramsNameNumber > provideNumber) {
                                            for (var p = 0; p < rowNumber; p++) {
                                                var tempStr = "";
                                                var start = p * provideNumber;
                                                var end = start + provideNumber;
                                                if (p == rowNumber - 1) {
                                                    tempStr = params.substring(start, paramsNameNumber);
                                                } else {
                                                    tempStr = params.substring(start, end) + "\n";
                                                }
                                                newParamsName += tempStr;
                                            }
                                        } else {
                                            newParamsName = params;
                                        }
                                        return newParamsName
                                    },
                                    textStyle:{
		   	                        	 fontSize:10
		   	                        	 
		   	                        }
				             	  } 
				             }
				         ],
				         yAxis : [
					                 {
					                     type : 'value',
					                     axisLabel : {                   	 
					                         formatter: '{value}'
					                     }
					                 },
					                 {
					                     type : 'value',
					                     axisLabel : {
					                    	
					                         formatter: '{value}%'
					                     },
					                     max:function(value) {
					                    	 return parseFloat(value.max + 20).toFixed(0)
					                     },
					                     min:function(value) {
					                    	 return parseFloat(value.min - 20).toFixed(0)
					                     },
					                 	boundaryGap: [-2, 1]
					                 }
					        ],
				    series : [
				        {
				            name:'当月收入',
				            type:'bar',
				            data:[],
				            itemStyle: {
				            	normal:{
				            		color:'rgb(48,167,152)'
				            	}
				            }
				        },
				        {
				            name:'同比增幅',
				            yAxisIndex:1,
				            type:'line',
				            data:[],
				           
				        }
				    ]
				};
			