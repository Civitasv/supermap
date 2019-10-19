package cn.hs.utils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/*超图iserver服务工具*/
public class IserverUtil {

    /**
     * @param name 查询道路名字
     * @return iserver的json,注意:这里success为0代表失败，1为成功,取值的时候请先检查
     */
    public static JSONObject queryRoadByName(String name){
        JSONObject result = new JSONObject();

        // 获得Http客户端(可以理解为:你得先有一个浏览器;注意:实际上HttpClient与浏览器是不一样的)
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        // 参数
        JSONObject params = new JSONObject();
        params.put("getFeatureMode", "SQL");
        params.put("datasetNames", "[\"Road:road\"]");
        params.put("maxFeatures", 1000);
        JSONObject queryParameter = new JSONObject();
        String sqlTemplate = "路名=\"roadName\" OR 曾用名=\"roadName\"";
        String sqlStatement = sqlTemplate.replace("roadName", name);
        queryParameter.put("attributeFilter", sqlStatement);
        params.put("queryParameter", queryParameter);
        StringEntity se = new StringEntity(params.toString(), "UTF-8");
        // 创建Post请求
        HttpPost httpPost = new HttpPost("http://47.103.23.188:8090/iserver/services/data-BeiJingRoad/rest/data/featureResults.json?returnContent=true");
        httpPost.setEntity(se);
        // 响应模型
        CloseableHttpResponse response = null;
        try {
            // 由客户端执行(发送)Post请求
            response = httpClient.execute(httpPost);
            // 从响应模型中获取响应实体
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {

                result = JSONObject.fromObject(EntityUtils.toString(responseEntity));
                if(result.getJSONArray("features").size() == 0){
                    result.put("success", 0);
                    return result;
                }
                result.put("success", 1);
                return result;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", 0);
            return result;
        } finally {
            try {
                // 释放资源
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        result.put("success", 0);
        return result;
    }

    /**
     * 将iserver的geometry转为geojson
     * @param geometry iserver的geometry
     * @return geojson
     */
    public static JSONObject sJson2GeoJson(JSONObject geometry){
        JSONObject geoJson = new JSONObject();
        geoJson.put("type", geometry.getString("type").replace("LINE", "LineString"));
        // 处理points
        JSONArray coordinatesArray = new JSONArray();
        JSONArray pointsArray = geometry.getJSONArray("points");
        for(int j=0;j<pointsArray.size();j++){
            JSONArray coordinate = new JSONArray();
            coordinate.add(pointsArray.getJSONObject(j).getDouble("x"));
            coordinate.add(pointsArray.getJSONObject(j).getDouble("y"));
            coordinatesArray.add(coordinate);
        }
        geoJson.put("coordinates", coordinatesArray);
        return geoJson;
    }




}
