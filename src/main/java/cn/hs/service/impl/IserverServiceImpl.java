package cn.hs.service.impl;

import cn.hs.service.ServerService;
import cn.hs.utils.IserverUtil;
import cn.hs.vo.Point;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class IserverServiceImpl implements ServerService {

    @Resource
    private SqlSessionFactory sqlSessionFactory;

    /**
     * 返回离当前用户最近的道路
     * @param name 查询道路名字
     * @param point 当前用户位置
     * @return 返回离当前用户最近的道路
     */
    @Override
    public JSONObject queryRoadByName(String name, Point point){
        JSONObject roads = IserverUtil.queryRoadByName(name);
        JSONObject resultJSON = new JSONObject();
        if(roads.getInt("success") == 0) {
            return null;
        }
        JSONArray features = roads.getJSONArray("features");
        JSONObject result = null;
        double minDistance = Double.MAX_VALUE;
        for (int i=0;i<features.size();i++){
            JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
            JSONObject geoJson = IserverUtil.sJson2GeoJson(geometry);
            Map<String, String> queryMap = new HashMap<>();
            queryMap.put("point", point.toGeoJsonStr());
            queryMap.put("polyline", geoJson.toString());
            double distance = sqlSessionFactory.openSession().selectOne("cn.esri.mapper.UtilsNS.getDistance", queryMap);
            if(distance < minDistance){
                minDistance = distance;
                result = geoJson;
            }
        }
        resultJSON.put("minDistance",minDistance);
        resultJSON.put("roadGeometry",result);
        return resultJSON;
    }

    @Override
    public double calcuDistanceByPoint(String polylineJSON, Point point) {
        Map<String, String> queryMap = new HashMap<>();
        queryMap.put("point", point.toGeoJsonStr());
        queryMap.put("polyline", polylineJSON);
        double distance = sqlSessionFactory.openSession().selectOne("cn.esri.mapper.UtilsNS.getDistance", queryMap);
        return distance;
    }

    @Override
    public List<Double> calcuDistanceArrayByPoint(List<String> polylineJSONArray, Point point) {
        List<Double> results = new ArrayList<Double>();
        for(int i = 0; i < polylineJSONArray.size(); i++){
            results.add( calcuDistanceByPoint(polylineJSONArray.get(i),point));
        }
        return results;
    }

    @Override
    public JSONObject getNearestPointOfGeometry(String geometryJSON, Point point) {
        Map<String, String> queryMap = new HashMap<>();
        queryMap.put("point", point.toGeoJsonStr());
        queryMap.put("geometry", geometryJSON);
        Map<String,Object> resultMap = sqlSessionFactory.openSession().selectOne("cn.esri.mapper.UtilsNS.getNearnestPoint", queryMap);
        JSONObject result = new JSONObject();
        Object closest_point = resultMap.get("closest_point");
        if(closest_point == null){
            return null;
        }
        return JSONObject.fromObject(closest_point);
    }
}
