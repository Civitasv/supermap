// Schema:
// date,AQIindex,PM2.5,PM10,CO,NO2,SO2
var dataWY = [
    [88,76,78,68,92,73]
];

var dataZJ = [
    [84,68,62,45,79,64]
];

var lineStyle = {
    normal: {
        width: 1,
        opacity: 0.5
    }
};

option = {
    tooltip:{},
    backgroundColor: '#f5f5f5',
    title: {
        text: '综合评价',
        subtext:'豆瓣评分：6.9',
        textStyle: {
            fontSize: 23,
            color: '#050505'
        },
        subtextStyle:{
            fontSize:14,
            color:'#050505'
        }
    },
    legend: {
        bottom: 10,
        data: ['网友评价', '专家意见'],
        itemGap: 40,
        textStyle: {
            color: '#050505',
            fontSize: 17
        },
        selectedMode: 'single'
        //inactiveColor:'#A1A1A1'
    },

    radar: {
        indicator: [
            {name: '新奇指数', max: 100},
            {name: '画面感', max: 100},
            {name: '故事性', max: 100},
            {name: '思考性', max: 100},
            {name: '演员演技', max: 100},
            {name: '导演水平', max: 100}
        ],
        shape: 'circle',
        splitNumber: 5,
        name: {
            //formatter:'【{data}】',
            textStyle: {
                fontSize:15,
                color: 'rgb(70, 70, 70)'
            }
        },
        splitLine: {
            lineStyle: {
                width: 4,
                color: [
                    'rgba(200, 200, 200, 0.2)',
                    'rgba(200, 200, 200, 0.4)', 'rgba(200, 200, 200, 0.6)',
                    'rgba(200, 200, 200, 0.8)', 'rgba(200, 200, 200, 1)'
                ].reverse()
            }
        },
        splitArea: {
            show: false
        },
        axisLine: {
            lineStyle: {
                color: 'rgba(170, 170, 170, 0.6)'
            }
        }
    },
    series: [
        {
            name: '网友评价',
            type: 'radar',
            lineStyle: lineStyle,
            data: dataWY,
            symbol: 'none',
            itemStyle: {
                normal: {
                    color: '#f98b28'
                }
            },
            areaStyle: {
                normal: {
                    opacity: 0.4
                }
            },
            label:{
                normal:{
                    show:true,
                    formatter:function (params) {
                        return params.data.value;
                    }
                }
            }
        },
        {
            name: '专家意见',
            type: 'radar',
            lineStyle: lineStyle,
            data: dataZJ,
            symbol: 'none',
            itemStyle: {
                normal: {
                    color: '#e44535'
                }
            },
            areaStyle: {
                normal: {
                    opacity: 0.4
                }
            }
        },
    ]
};

function CreatRadar(mychart,option) {
    if(option &&typeof option ==="object") {
        mychart.setOption(option);
        window.onresize = myChart.resize;
        //mychart.resize();
    }
}