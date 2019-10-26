
function getOption(graphInfo){
//给节点设置样式

//json 转为js
title=graphInfo['title'];
nodes=graphInfo['nodes'];
links=graphInfo['links'];
categories=graphInfo['categories'];


var option = {
    tooltip:{
        formatter:function (params, ticket, callback) {

            if(params.componentType === 'series' ){
                if(params.seriesType === 'graph'){
                    if (params.dataType === 'node'){
                        return '点击搜索，<br>如你所要！';
                    }
                }
            }
        }
    },
       legend: [{
           // selectedMode: 'single',
           data: categories.map(function (a) {

               return a.name;
           })
       }],
       color:['rgb(194,53,49)','rgb(128,144,137)','rgb(200,160,168)','rgb(100,100,168)','rgb(130,130,0)','rgb(0,150,150)'],
       series : [
           {
               type: 'graph',
               layout: 'force',
               //hoverAnimation:true,
               roam:true,
               //focusNodeAdjacency : true,
               //draggable:true,
               data:nodes.map(function (node, idx) {
                   node.id = 'node'+idx;
                   //console.log(node.id);
                   return node;
               }),


               edges: links,

               categories: categories,

               label: {

                   normal: {
                       show:true,
                       position: 'inside',
                       color:"black",
                       fontWeight:'bold',
                       fontSize:12
                   },
                   emphasis:{
                       lineStyle:{width:8}
                   }

               },

               itemStyle: {
                   normal: {
                       borderColor: '#fff',
                       borderWidth: 1,
                       shadowBlur: 10,
                       shadowColor: 'rgba(0, 0, 0, 0.3)'
                   }
               },

               lineStyle:{
                   width: 4,
                   color: 'source',
                   curveness: 0.3
               },

               force: {
                   edgeLength: [80,105],//连线的长度120
                   repulsion: 600, //子节点之间的间距

               },
               //focusNodeAdjacency : true
           }
       ]
   };
   return option;
}

function createGraph(myChart,mygraph){
//设置option样式
option=getOption(mygraph);
if (option && typeof option === "object") {
  myChart.setOption(option);

  window.onresize = myChart.resize;
}
//myChart.hideLoading();
}

function requestFullScreen(element) {

    var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;

    if (requestMethod) {

        requestMethod.call(element);

    } else if (typeof window.ActiveXObject !== "undefined") {

        var wscript = new ActiveXObject("WScript.Shell");

        if (wscript !== null) {

            wscript.SendKeys("{F11}");

        }

    }
}