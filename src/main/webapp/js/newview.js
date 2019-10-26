function loadTotalMap(){
    AMapUI.loadUI(['control/BasicControl'], function (BasicControl) {
        var map = new AMap.Map('totalMapContainer', {
            features: ['bg', 'road'],
            mapStyle: 'amap://styles/midnight',
            center: [110, 31],
            pitch: 50,
            zoom: 5,
            viewMode: '3D',
        });
        var layer = new Loca.HeatmapLayer({
            map: map,
        });
        $.ajax({
            type: 'GET',
            url: path+'/data/df_byid_located_loged.csv',
            success: function (data) {
                layer.setData(data, {
                    type: 'csv',
                    lnglat: 'lnglat',
                    value: 'logcount'
                });
                layer.setOptions({
                    style: {
                        radius: 40,
                        color: {
                            0.5: '#2c7bb6',
                            0.65: '#abd9e9',
                            0.7: '#ffffbf',
                            0.9: '#fde468',
                            1.0: '#d7191c'
                        }
                    }
                });
                layer.render();
            },
        });

        var layerCtrl = new BasicControl.LayerSwitcher({
            theme: 'light',
            //自定义基础图层
            baseLayers: [{
                enable: true,
                id: 'tile',
                name: '基础图',
                layer: new AMap.TileLayer()
            }, {
                id: 'satellite',
                name: '卫星图',
                layer: new AMap.TileLayer.Satellite()
            }
            ],
            //自定义覆盖图层
            overlayLayers: [{
                enable: true,
                id: 'total_count',
                name: '总数',
                layer: layer
            }]
        });
        layers = layerCtrl.getEnabledLayers();
        map.setLayers(layers);
        map.addControl(layerCtrl);
    });
}

function loadAveMap(){
    var ave_map = new AMap.Map('aveMapContainer', {
        features: ['bg', 'road'],
        mapStyle: 'amap://styles/midnight',
        center: [110, 31],
        pitch: 50,
        zoom: 5,
        viewMode: '3D'
    });

    var layer = new Loca.ScatterPointLayer({
        map: ave_map,
    });

    $.ajax({
        type: 'GET',
        url: path+'/data/df_byid_located_loged_absed.csv',
        success: function (data) {
            layer.setData(data, {
                type: 'csv',
                lnglat: 'lnglat'
            });
            var colors = [
                '#2c7bb6',
                '#ffffff',
                '#d7191c'
            ];
            layer.setOptions({
                // 单位米
                unit: 'meter',
                style: {
                    // 正多边形半径
                    radius: 8000,
                    // 高度为 0 即可贴地面
                    height: {
                        key: 'absmean',
                        scale: 'linear',
                        value: [0, 80000]
                    },
                    // 顶面颜色
                    color: {
                        key: 'mean',
                        scale: 'quantile',
                        value: colors
                    },
                    opacity: 0.85
                }
            });
            layer.render();
        },
    });
}

function loadLinkMap(){
    var link_map = new AMap.Map('linkMapContainer', {
        mapStyle: 'amap://styles/midnight',
        features: ['bg', 'road'],
        center: [110, 31],
        pitch: 50,
        zoom: 5,
        viewMode: '3D'
    });
    var link_layer = new Loca.LinkLayer({
        map: link_map
    });

    link_layer.setData(city_line, {
        lnglat: 'line'
    });

    link_layer.setOptions({
        style: {
            // 曲率 [-1, 1] 区间
            curveness: 1,
            opacity: 0.8,
            color: '#5695F6'
        }
    });

    var link_layer2 = new Loca.LinkLayer({
        map: link_map
    });

    link_layer2.setData(city_line2, {
        lnglat: 'line'
    });

    link_layer2.setOptions({
        style: {
            // 曲率 [-1, 1] 区间
            curveness: 1,
            opacity: 0.8,
            color: '#569506'
        }
    });

    var link_layer3 = new Loca.LinkLayer({
        map: link_map
    });

    link_layer3.setData(city_line3, {
        lnglat: 'line'
    });

    link_layer3.setOptions({
        style: {
            // 曲率 [-1, 1] 区间
            curveness: 1,
            opacity: 0.8,
            color: '#f7be7f'
        }
    });

    var link_layer4 = new Loca.LinkLayer({
        map: link_map
    });

    link_layer4.setData(city_line4, {
        lnglat: 'line'
    });

    link_layer4.setOptions({
        style: {
            // 曲率 [-1, 1] 区间
            curveness: 1,
            opacity: 0.8,
            color: '#f85f73'
        }
    });

    link_layer.render();
    link_layer2.render();
    link_layer3.render();
    link_layer4.render();
}