$(function(){
	pieChar();
	barChar([80,60,82,60]);
	linchar();
	barschar();
	radarchar();
	progress1char();
	progress2char();
	mapchar();
});
window.onresize = function(){
    pieChart.resize();
    barChart.resize();    //若有多个图表变动，可多写
    linchart.resize();
    barschart.resize();
    radarchart.resize();
    progress1chart.resize();
	 progress2chart.resize();
	 mapchart.resize()

}
//饼状图
var pieChart="";
function pieChar(){
	pieChart= echarts.init(document.getElementById("pie-chart"));
	option = {
		color:["#4f8bf9","#fea31e","#959595"],
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    series: [
	        {
	            name:'Index',
	            type:'pie',
	            selectedMode: 'single',
	            radius: [0, '60%'],
				center:["50%","42%"],
	           label: {
	                normal: {
	                    position: 'outside',
	                    formatter: "{b}:{d}%"    
	                }
	            }, 
	            data:[
	                {value:6.3, name:'negative'},
	                {value:5.2, name:'positive',selected:true},
	                {value:4.8, name:'neutral'}
	            ]
	        }
	    ]
	};
	pieChart.setOption(option);
}
//柱状图
var barChart="";
function barChar(data){
	barChart= echarts.init(document.getElementById("bar-chart"));
	 option = {
	 	tooltip: {
	        formatter:'{b}:{c}'
	    },
	 	grid: {
	        left: '15%',
	        right: '15%',
	        bottom: '20%',
	        top: '20%',
	        containLabel: true,
	        z: 22
	    },
	    xAxis: {
	        data: ["北京","上海","广州","深圳"],       //横坐标
	        axisLabel:{
	            textStyle: {
	                color:'#fff',
	                 fontSize:12,
	            }
	        },
	        axisLine: {
	            lineStyle: {
	                type: 'solid',
	                color:'#24214e',
	                width:'1  ',                                                //坐标线的宽度
	            }
	        },
	    },
	    yAxis: {
	    	name: "Percent",
	    	nameTextStyle:{
	    		color:"#fff"
	    	},
	    	nameLocation:"center",
	    	nameGap:30,
	    	nameRotate:-270,
	        axisLabel: {
	            textStyle: {
	                color: '#fff',
	                 fontSize:12,//坐标值得具体的颜色
	            }
	        },
	        axisLine: {
	             lineStyle: {
	                type: 'solid',
	                color:'#24214e',
	                width:'1  ',                                                //坐标线的宽度
	              
	            }
	        },
	        splitLine: {
	            lineStyle: {
	                color: "#24214e",
	            }
	        }
	    },
	    series: [{
	        type: 'bar',
	        barWidth:20,
	        data:data,
	        /*label: {
                normal: {
                    show: true,
                    position: "top",
                    textStyle: {
                        color: "#fffff",
                        fontSize: 12
                    }
                }
            },*/
	        itemStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(
	                    0, 0, 0, 1,
	                    [
	                        {offset: 0, color: '#4f92fa'},                   //柱图渐变色
	                        {offset: 0.5, color: '#565cf8'},                 //柱图渐变色
	                        {offset: 1, color: '#5d29f7'},                   //柱图渐变色
	                    ]
	                )
	            }
	        },
	    }]
	};
barChart.setOption(option)	
	
}
//折线图
var linchart="";
function linchar(){
	linchart= echarts.init(document.getElementById("line-chart"));
	option = {
		tooltip: {
	        formatter:'{b}&nbsp; {c}'
	    },
		grid: {
	        left: '15%',
	        right: '15%',
	        bottom: '20%',
	        top: '20%',
	       
	        containLabel: true,
	        z: 22
	    },
	    xAxis: {
	        data: ['1', '2', '3', '4','5'],
	        axisLabel:{
	            textStyle: {
	                color:'#fff',
	                 fontSize:12,
	            }
	        },
	        axisLine: {
	            lineStyle: {
	                type: 'solid',
	                color:'#24214e',
	                width:'1',                                                //坐标线的宽度
	            }
	        },
	    },
	    yAxis: {
	    	name: "Mean Value",
	    	nameTextStyle:{
	    		color:"#fff"
	    	},
	    	nameLocation:"center",
	    	nameGap:30,
	    	nameRotate:-270,
	        axisLabel: {
	            textStyle: {
	                color: '#fff',
	                 fontSize:12,//坐标值得具体的颜色
	            }
	        },
	        axisLine: {
	             lineStyle: {
	                type: 'solid',
	                color:'#24214e',
	                width:'1  ',                                                //坐标线的宽度
	              
	            }
	        },
	        splitLine: {
	            lineStyle: {
	                color: "#24214e",
	            }
	        }
	        
	    },
	    series: [{
	        type: 'line',
	        data:[0.13, -0.23, -0.12, -0.06, -0.2],
	        itemStyle : {
	            normal : {
	                lineStyle:{
	                    width:3,//折线宽度
	                },
	                 color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
	                    offset: 1,
	                    color: '#508ff6' // 0% 处的颜色
	                }, {
	                    offset: 0,
	                    color: '#2c137a' // 100% 处的颜色
	                }], false),
	                opacity: 0.4
	            }
	        },
	    }]
	};
	linchart.setOption(option)	
}
//柱状图2
var barschart=""
function barschar(){
     barschart = echarts.init(document.getElementById("bars-chart"));
     option = {
     	color:["#fd8f1e","#7cb5ec","#4280f1","#957bde"],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: { // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
   		grid: {
	        left: '10%',
	        right: '15%',
	        bottom: '20%',
	        top: '20%',
	        containLabel: true,
	        z: 22
	    },
   
	    legend: {
	        data: ['北', '上', '广', '深'],
	        textStyle: {
	            fontSize: 12,
	            color:"#fff"
	        },
	        icon:"rect",
	        itemWidth:10,
	        itemHeight:10,
	        bottom:"9%"
	    },
   
	    xAxis: {
	    	name:'Percent',
	    	nameTextStyle:{
	    		color:"#fff"
	    	},
	        axisLabel:{
	            textStyle: {
	                color:'#fff',
	                 fontSize:12,
	            }
	        },
	        splitLine: {
	            lineStyle: {
	                color: "#24214e",
	            }
	        },
			 axisLine: {
	            lineStyle: {
	                type: 'solid',
	                color:'#24214e',
	                width:'1  ',                                                //坐标线的宽度
	            }
	        }
	    },
	    yAxis: {
	        data: ['1', '2', '3', '4', '5'],
	        axisLabel: {
		            textStyle: {
		                color: '#fff',
		                 fontSize:12,//坐标值得具体的颜色
		            }
		        },
		        axisLine: {
		             lineStyle: {
		                type: 'solid',
		                color:'#24214e',
		                width:'1  ',                                                //坐标线的宽度
		              
		            }
		        },
	    },
	    series: [{
	            name: '北',
	            type: 'bar',
	            stack: '总量',
	            barWidth:20,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'insideRight'
	                }
	            },
	            data: [80, 82, 85, 82, 81]
	        }, {
	            name: '上',
	            type: 'bar',
	            barWidth:20,
	            stack: '总量',
	            label: {
	                normal: {
	                    show: false,
	                    position: 'insideRight'
	                }
	            },
	            data: [58, 62, 54, 56, 57]
	        }, {
	            name: '广',
	            type: 'bar',
	            stack: '总量',
	            barWidth:20,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'insideRight'
	                }
	            },
	            data: [56, 52, 62, 60, 58]
	        }, {
	            name: '深',
	            type: 'bar',
	            stack: '总量',
	            barWidth:20,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'insideRight'
	                }
	            },
	            data: [58, 56, 62, 58, 56]
	        },
	
	    ]
	    
	};
     barschart.setOption(option)	     
};
//雷达图
var radarchart="";
function radarchar(){
	radarchart = echarts.init(document.getElementById("radar-chart"));
	option = {
	    color: ['#623ad1', '#3383fc'],
	    tooltip: {},
	    radar: [{
	        indicator: [{
	                text: '北',
	                max: 100
	            },
	            {
	                text: '上',
	                max: 100
	            },
	            {
	                text: '广',
	                max: 100
	            },
	            {
	                text: '深',
	                max: 100
	            },
	            {
	                text: '蓉',
	                max: 100
	            }
	        ],
	        center: ['50%', '60%'],
	        radius: '65%',
	        startAngle: 90,
	        name: {
	            formatter: '{value}',
	            textStyle: {
	                fontSize: 12, //外圈标签字体大小
	                color: '#FFF' //外圈标签字体颜色
	            }
	        },
	        splitArea: { // 坐标轴在 grid 区域中的分隔区域，默认不显示。
	            show: true,
	            areaStyle: { // 分隔区域的样式设置。
	                color: [], // 分隔区域颜色。分隔区域会按数组中颜色的顺序依次循环设置颜色。默认是一个深浅的间隔色。
	            }
	        },
	        axisLine: { //指向外圈文本的分隔线样式
	            lineStyle: {
	                color: '#24214e'
	            }
	        },
	        splitLine: {
	            lineStyle: {
	                color: '#24214e', // 分隔线颜色
	                width: 1, // 分隔线线宽
	            }
	        }
	    }, ],
	    series: [{
	        name: '雷达图',
	        type: 'radar',
	        data: [
	        {
	            name: '1',
	            value: [85, 65, 55, 90, 82],
	            areaStyle: {
	                normal: { // 单项区域填充样式
	                    opacity: 1 // 区域透明度
	                }
	            },
	            symbolSize: 0, // 单个数据标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
	        }, {
	            name: '2',
	            value: [93.27,92.11,91.57,90.64,90.11],
	            symbolSize:0,
	            areaStyle: {
	                normal: { // 单项区域填充样式
	                    color: {
	                        type: 'linear',
	                        x: 0, //右
	                        y: 0, //下
	                        x2: 1, //左
	                        y2: 1, //上
	                        colorStops: [{
	                            offset: 0,
	                            color: '#3cd2f3'
	                        }, 
	                        {
	                            offset: 1,
	                            color: '#306eff'
	                        }],
	                        globalCoord: false
	                    },
	                    opacity: 1 // 区域透明度
	                    
	                }
	            },
	        }]
	    }]
	};
	radarchart.setOption(option)		
}
//进度条1
var progress1chart="";
function progress1char(){
	progress1chart = echarts.init(document.getElementById("progress1-chart"));
	var baifenbi = [0.18, 0.25, 0.3, 0.32, 0.44];
	var grayBar = [1, 1, 1, 1, 1, ];
	var paiming = [ 5, 4, 3, 2, 1];
	var xingm = [ '汉', '深', '广', '上','北'];
	option = {
	    title: {
	        text: '1',
	        left: '75%',
	        top:"20",
	        textStyle:{
	        	color:"#fff",
	        	fontSize:12
	        }
	    },
	     grid: {
	         left: '15%',  //如果离左边太远就用这个......
	         right: '15%',
	         bottom: '5%',
	         top: '20%',
	         containLabel: true
	     },
	    xAxis: [{
	            show: false,
	       },
	        {
	            show: false,
	        }
	    ],
	    yAxis: {
	        type: 'category',
	        axisLabel: {
	            show: true, //让Y轴数据不显示
	        },

	        axisTick: {
	            show: false, //隐藏Y轴刻度
	        },
	        axisLine: {
	            show: false, //隐藏Y轴线段
	        },
	    },
	    series: [
	        //背景色
	        {
	            show: true,
	            type: 'bar',
	            barGap: '-100%',
	            barWidth: '10%', //统计条宽度 
	            itemStyle: {
	                normal: {
	                    barBorderRadius: 50,
	                    color: 'rgba(41, 55, 94)'
	                },
	            },
	            z: 1,
	            data: grayBar,
	        },
	        //蓝条
	        {
	            show: true,
	            type: 'bar',
	            barGap: '-100%',
	            barWidth: '10%', //统计条宽度
	            itemStyle: {
	                normal: {
	                    barBorderRadius: 50, //统计条弧度
	                    color: {
	                        colorStops: [{
	                             offset: 0,
	                             color: '#5d29f7' // 0% 处的颜色
	                         }, {
	                             offset: 1,
	                             color: '#5093fb' // 100% 处的颜色
	                         }],
	                        globalCoord: false, // 缺省为 false
	
	                    }
	                },
	            },
	            max: 1,
	            label: {
	                normal: {
	                    show: true,
	                    textStyle: {
	                        color: '#fff', //百分比颜色
	                    },
	                    position: [0, '-35'],
	                    rich: { //富文本
	                        yellow: {
	                            color: '#FEC735',
	                        }
	                    },
	                    formatter: function(data) {
	                        //富文本固定格式{colorName|这里填你想要写的内容}
	                        if(paiming[data.dataIndex] == 1||paiming[data.dataIndex] == 2||paiming[data.dataIndex] == 3){
	                        	return '{yellow|' + paiming[data.dataIndex] + '  ' + xingm[data.dataIndex] + '}';
	                        }else{
	                        	return paiming[data.dataIndex] + '  ' + xingm[data.dataIndex] 
	                        }
	                       
	                    },
	                    
	                }
	            },
	          data: baifenbi,
	        },
	        
	    ]
	};
	
	progress1chart.setOption(option)
}
//点击切换数据
function DataSwitch(obj,num){
	$(obj).removeClass("Datasame");
	$(obj).siblings().addClass("Datasame")
	if(num==1){
		$(obj).parent().prev().addClass("Defaultgray");
		$(obj).parent().next().removeClass("Defaultgray");
		
		barChar([63.8,63.1,61,60.5])
		
		
	}else{
		barChar()
		$(obj).parent().prev().removeClass("Defaultgray");
		$(obj).parent().next().addClass("Defaultgray");
		barChar([65.95,60.01,59.07,56.51])
	}
		
	
}
