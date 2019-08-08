<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手交易系统-统计分析页面</title>
<head>
<!-- 引入 shine 主题 -->
<script src="${pageContext.request.contextPath}/js/echart/js/shine.js"> </script>
<script src="${pageContext.request.contextPath}/js/echart/js/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/echart/js/china.js"></script>
<script src="${pageContext.request.contextPath}/js/echart/js/gansu.js"></script>

<style type="text/css">
	#main{
		float: left;
	}
	#main1{
		float: left;
	}
	#main2{
		float: left;
	}
	#main3{
		float: left;
	}
	#main4{
		float: left;
	}
	#main5{
		float: left;
	}
	#main6{
		float: left;
	}
	#main7{
		float: left;
	}
	#main8{
		float: left;
	}
</style>
</head>
<body>
 <!--   JavaScript 引入示例 -->
 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	  <div id="main"  style="width: 650px;height:400px;"></div>
	  <div id="main2" style="width: 650px;height:400px;"></div>
	  <div id="main3" style="width: 650px;height:400px;"></div>
	  <div id="main1" style="width: 650px;height:400px;"></div>
	  <div id="main4" style="width: 650px;height:400px;"></div>
	  <div id="main5" style="width: 650px;height:400px;"></div>
	  <div id="main6" style="width: 650px;height:400px;"></div>
	  <div id="main7" style="width: 650px;height:400px;"></div>
	  <div id="main8" style="width: 650px;height:400px;"></div>
  
	<script type="text/javascript">
		var chart = echarts.init(document.getElementById('main1'));
		chart.setOption({
		    series: [{
		        type: 'map',
		        map: 'gansu'
		    }]
		});
	</script>
	<script type="text/javascript">
			var chart = echarts.init(document.getElementById('main3'));
			chart.setOption({
			    series: [{
			        type: 'map',
			        map: 'china'
			    }]
			});
	</script>
	
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var a=10;
        var b=12;
        var c = ['兰州市','嘉峪关市','武威市','酒泉市','平凉市','天水市','白银市','定西市','张掖市','庆阳市','陇南市'];
        var myChart = echarts.init(document.getElementById('main'));

        option = {
        	    title : {
        	        text: '用户注册地域分布数据',
        	        subtext: '虚拟数据',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: c
        	    },
        	    series : [
        	        {
        	        	name: '数据',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
	                            {value:10, name:'兰州市'},
	                            {value:10, name:'嘉峪关市'},
	                            {value:10, name:'武威市'},
	                            {value:10, name:'酒泉市'},
	                            {value:10, name:'平凉市'},
	                            {value:10, name:'天水市'},
	                            {value:10, name:'白银市'},
	                            {value:10, name:'定西市'},
	                            {value:10, name:'张掖市'},
	                            {value:10, name:'庆阳市'},
	                            {value:10, name:'陇南市'},
	                        ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};
        myChart.setOption(option);
        // 指定图表的配置项和数据
    </script>
	
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main2'));
		// 显示标题，图例和空的坐标轴
		var option = {
					    color: ['#3398DB'],
					    title: {
			                text: '甘肃省各地区GDP'
			            },
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
					    legend: {
			                data:['GDP']
			            },
			            xAxis : [
			                     {
			                         type : 'category',
			                         data : ['兰州', '嘉峪关' , '酒泉', '武威', '定西', '白银', '天水', '张掖', '平凉', '庆阳', '陇南'],
			                         axisTick: {
			                             alignWithLabel: true
			                         }
			                     }
			                 ],
			                 yAxis : [
			                     {
			                         type : 'value'
			                     }
			                 ],
			                 series : [
			                     {
			                         name:'GDP',
			                         type:'bar',
			                         barWidth: '60%',
			                         data: [51,44,30,36,40,21,35,23,25,20,18]
			                     }
			                 ]
			             };
		
		
		
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	
		/* 	var myChart = echarts.init(document.getElementById('main'));
			// 显示标题，图例和空的坐标轴
			myChart.setOption({
			    title: {
			        text: '异步数据加载示例'
			    },
			    tooltip: {},
			    legend: {
			        data:['销量']
			    },
			    xAxis: {
			        data: []
			    },
			    yAxis: {},
			    series: [{
			        name: '销量',
			        type: 'bar',
			        data: []
			    }]
			});
			
			// 异步加载数据
			$.get('data.json').done(function (data) {
			    // 填入数据
			    myChart.setOption({
			        xAxis: {
			            data: data.categories
			        },
			        series: [{
			            // 根据名字对应到相应的系列
			            name: '销量',
			            data: data.data
			        }]
			    });
			});
		
		
		myChart.showLoading();
		$.get('data.json').done(function (data) {
		    myChart.hideLoading();
		    myChart.setOption(...);
		});
		
		
		*/
	</script>

	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main4'));
	// 显示标题，图例和空的坐标轴
		var option = {
			color: ['#3398DB'],
	        title: {
	            text: '各省份GDP'
	        },
	        tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
	        legend: {
	            data:['GDP']
	        },
	        yAxis: {},
	        series: [{
	            name: 'GDP',
	            type: 'bar',
	            data: [35, 33,20, 36, 30, 20, 31]
	        }],
	        xAxis: {
	        	data: ["甘肃","新疆","青海","四川","内蒙古","宁夏","陕西"]
	        }
	    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

	</script>
	
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main5'));
	// 显示标题，图例和空的坐标轴
		option = {
		    title: {
		        text: '甘肃省'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#6a7985'
		            }
		        }
		    },
		    legend: {
		        data:['兰州市','酒泉市','武威市','天水市','定西市','庆阳市']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    /* toolbox: {
		        feature: {
		            saveAsImage: {}
		        }    将本图下载为图片 
		    }, */
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['2010','2011','2012','2013','2014','2015','2016']
		    },
		    yAxis : [
		             {
		                 type : 'value'
		             }
		         ],
		    series: [
		        {
		            name:'兰州市',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[410, 432, 471, 534, 610, 671, 620]
		        },
		        {
		            name:'酒泉市',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[221, 185, 191, 232, 292, 312, 310]
		        },
		        {
		            name:'武威市',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[153, 232, 204, 184, 190, 164, 211]
		        },
		        {
		            name:'天水市',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[222, 232, 245, 317, 342, 331, 321]
		        },
		        {
		            name:'定西市',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[251, 231, 303, 183, 199, 230, 216]
		        },
		        {
		            name:'庆阳市',
		            type:'line',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'top'
		                }
		            },
		            areaStyle: {normal: {}},
		            data:[226, 131, 120, 146, 193, 230, 210]
		        }
		    ]
		};
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    </script>
    
    <script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main6'));
	// 显示标题，图例和空的坐标轴
		option = {
		    title: {
		        text: '各省数据'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#6a7985'
		            }
		        }
		    },
		    legend: {
		        data:['甘肃省','新疆省','青海省','陕西省','内蒙古省','四川省','宁夏回族自治州']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    /* toolbox: {
		        feature: {
		            saveAsImage: {}
		        }    将本图下载为图片 
		    }, */
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['2010','2011','2012','2013','2014','2015','2016']
		    },
		    yAxis : [
		             {
		                 type : 'value'
		             }
		         ],
		    series: [
		        {
		            name:'甘肃省',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[410, 432, 471, 534, 610, 671, 620]
		        },
		        {
		            name:'新疆省',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[221, 185, 191, 232, 292, 312, 310]
		        },
		        {
		            name:'青海省',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[153, 232, 204, 184, 190, 164, 211]
		        },
		        {
		            name:'内蒙古省',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[222, 232, 245, 317, 342, 331, 321]
		        },
		        {
		            name:'陕西省',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[251, 231, 303, 183, 199, 230, 216]
		        },
		        {
		            name:'宁夏回族自治州',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[151, 131, 103, 183, 199, 130, 116]
		        },
		        {
		            name:'四川省',
		            type:'line',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'top'
		                }
		            },
		            areaStyle: {normal: {}},
		            data:[226, 131, 120, 146, 193, 230, 210]
		        }
		    ]
		};
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    </script>
    
    <script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main7'));
    
	function randomData() {
	    return Math.round(Math.random() * 1000);
	}

	var data = [{
	    name: '北京',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '天津',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '上海',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '重庆',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '河北',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '河南',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '云南',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '辽宁',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '黑龙江',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '湖南',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '安徽',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '山东',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '新疆',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '江苏',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '浙江',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '江西',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '湖北',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '广西',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '甘肃',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '山西',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '内蒙古',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '陕西',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '吉林',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '福建',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '贵州',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '广东',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '青海',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '西藏',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '四川',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '宁夏',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '海南',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '台湾',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '香港',
	    value1: randomData(),
	    value2: randomData(),
	}, {
	    name: '澳门',
	    value1: randomData(),
	    value2: randomData(),
	}];

	var resultdata0 = [];
	var resultdata1 = [];
	var resultdata2 = [];
	var sum0 = 0;
	var sum1 = 0;
	var sum2 = 0;
	var titledata = [];
	for (var i = 0; i < data.length; i++) {
	    var d0 = {
	        name: data[i].name,
	        value: data[i].value1 + data[i].value2
	    };
	    var d1 = {
	        name: data[i].name,
	        value: data[i].value1
	    };
	    var d2 = {
	        name: data[i].name,
	        value: data[i].value2
	    };
	    titledata.push(data[i].name)
	    resultdata0.push(d0);
	    resultdata1.push(d1);
	    resultdata2.push(d2);
	    sum0 += data[i].value1 + data[i].value2;
	    sum1 += data[i].value1;
	    sum2 += data[i].value2;
	}

	function NumDescSort(a,b){
	    return a.value-b.value;
	}

	resultdata0.sort(NumDescSort);
	resultdata1.sort(NumDescSort);
	resultdata2.sort(NumDescSort);

	option = {
	    title: [{
	        text: '数据统计',
	        subtext: '纯属虚构',
	        left: 'center'
	    },{
	        text: '全部: ' +sum0,
	        right: 120,
	        top: 40,
	        width: 100,
	        textStyle: {
	            color: '#fff',
	            fontSize: 16
	        }
	    },{
	        text: "人口: " +sum1,
	        right: 120,
	        top: 40,
	        width: 100,
	        textStyle: {
	            color: '#fff',
	            fontSize: 16
	        }
	    },{
	        text: "经济: "+sum2,
	        right: 120,
	        top: 40,
	        width: 100,
	        textStyle: {
	            color: '#fff',
	            fontSize: 16
	        }
	    },],
	    tooltip: {
	        trigger: 'item'
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: ['全部', '人口', '经济'],
	        selectedMode: 'single',
	    },
	    visualMap: {
	        min: 0,
	        max: 2500,
	        left: 'left',
	        top: 'bottom',
	        text: ['高', '低'],
	        calculable: true,
	        colorLightness: [0.2, 100],
	        color: ['#c05050','#e5cf0d','#5ab1ef'],
	        dimension: 0
	    },
	    toolbox: {
	        show: true,
	        orient: 'vertical',
	        left: 'right',
	        top: 'center',
	        feature: {
	            dataView: {
	                readOnly: false
	            },               //数据视图
	            restore: {},     // 还原
	            saveAsImage: {} //  保存图片
	        }
	    },
	    grid: {
	        right: 40,
	        top: 100,
	        bottom: 40,
	        width: '30%'
	    },
	    xAxis: [{
	        position: 'top',
	        type: 'value',
	        boundaryGap: false,
	        splitLine: {
	            show: false
	        },
	        axisLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	    }],
	    yAxis: [{
	        type: 'category',
	        data: titledata,
	        axisTick: {
	            alignWithLabel: true
	        }
	    }],
	    series: [{
	        z: 1,
	        name: '全部',
	        type: 'map',
	        map: 'china',
	        left: '20',
	        right: '39%',
	        top: 100,
	        bottom: "8%",
	        zoom: 0.90,
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        //roam: true,
	        data: resultdata0
	    }, {
	        z: 1,
	        name: '人口',
	        type: 'map',
	        map: 'china',
	        left: '10',
	        right: '35%',
	        top: 100,
	        bottom: "35%",
	        zoom: 0.75,
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        //roam: true,
	        data: resultdata1
	    }, {
	        z: 1,
	        name: '经济',
	        type: 'map',
	        map: 'china',
	        left: '10',
	        right: '35%',
	        top: 100,
	        bottom: "35%",
	        zoom: 0.85,
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        //roam: true,
	        data: resultdata2
	    }, {
	        name: '全部',
	        z: 2,
	        type: 'bar',
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true,
	            }
	        },
	        itemStyle: {
	            emphasis: {
	                color: "rgb(254,153,78)"
	            }
	        },
	        data: resultdata0
	    }, {
	        name: '人口',
	        z: 2,
	        type: 'bar',
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        itemStyle: {
	            emphasis: {
	                color: "rgb(254,153,78)"
	            }
	        },
	        data: resultdata1
	    }, {
	        name: '经济',
	        z: 2,
	        type: 'bar',
	        label: {
	            normal: {
	                show: true
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        itemStyle: {
	            emphasis: {
	                color: "rgb(254,153,78)"
	            }
	        },
	        data: resultdata2
	    },]
	};
	myChart.setOption(option);
    </script>
    
    <script type="text/javascript">
 	var myChart = echarts.init(document.getElementById('main8'));
			// 显示标题，图例和空的坐标轴
			myChart.setOption({
			    title: {
			        text: '异步数据加载示例'
			    },
			    tooltip: {},
			    legend: {
			        data:['销量']
			    },
			    xAxis: {
			        data: []
			    },
			    yAxis: {},
			    series: [{
			        name: '销量',
			        type: 'bar',
			        data: []
			    }]
			});
			
			myChart.showLoading();
			// 异步加载数据
			$.get('data.json').done(function (data) {
			    // 填入数据
			    myChart.hideLoading();
			    myChart.setOption({
			        xAxis: {
			            data: data.categories
			        },
			        series: [{
			            // 根据名字对应到相应的系列
			            name: '销量',
			            data: data.data
			        }]
			    });
			});
		
		
		/* myChart.showLoading();
		$.get('data.json').done(function (data) {
		    myChart.hideLoading();
		    myChart.setOption(...);
		}); */
		
		
	</script>
    
    
</body>
</html>
</head>
<body>

</body>
</html>