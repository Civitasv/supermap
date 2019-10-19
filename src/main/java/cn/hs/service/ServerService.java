package cn.hs.service;

import cn.hs.vo.Point;
import net.sf.json.JSONObject;

import java.util.List;

public interface ServerService {
    JSONObject queryRoadByName(String name, Point point);

    double calcuDistanceByPoint(String polylineJSON, Point point);

    List<Double> calcuDistanceArrayByPoint(List<String> polylineJSONArray, Point point);

    JSONObject getNearestPointOfGeometry(String geometryJSON, Point point);
}
