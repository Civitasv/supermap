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
            //�Զ������ͼ��
            baseLayers: [{
                enable: true,
                id: 'tile',
                name: '����ͼ',
                layer: new AMap.TileLayer()
            }, {
                id: 'satellite',
                name: '����ͼ',
                layer: new AMap.TileLayer.Satellite()
            }
            ],
            //�Զ��帲��ͼ��
            overlayLayers: [{
                enable: true,
                id: 'total_count',
                name: '����',
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
                // ��λ��
                unit: 'meter',
                style: {
                    // ������ΰ뾶
                    radius: 8000,
                    // �߶�Ϊ 0 ����������
                    height: {
                        key: 'absmean',
                        scale: 'linear',
                        value: [0, 80000]
                    },
                    // ������ɫ
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
            // ���� [-1, 1] ����
            curveness: 1,
            opacity: 0.8,
            color: '#5695F6'
        }
    });

    link_layer.render();
}