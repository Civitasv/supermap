package cn.hs.service.impl;

import cn.hs.pojo.Chart;
import cn.hs.pojo.News;
import cn.hs.service.NewsService;
import com.google.gson.Gson;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class INewsServiceImpl implements NewsService {

    @Resource
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public String getNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type","FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<newsList.size();i++){
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type","Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type","Point");
            double []coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates",coordinates);
            jsonObject1.put("geometry",jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id",news.getNews_id());
            jsonObject3.put("comment_id",news.getComment_id());
            jsonObject3.put("location",news.getLocation());
            jsonObject3.put("class",news.getType());
            jsonObject3.put("comment",news.getComment());
            jsonObject3.put("time",news.getTime());
            jsonObject3.put("negative",news.getNegative());
            jsonObject1.put("properties",jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features",jsonArray);
        return jsonObject.toString();
    }

    @Override
    public String getColdNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type","FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<newsList.size();i++){
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type","Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type","Point");
            double []coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates",coordinates);
            jsonObject1.put("geometry",jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id",news.getNews_id());
            jsonObject3.put("comment_id",news.getComment_id());
            jsonObject3.put("location",news.getLocation());
            jsonObject3.put("class",news.getType());
            jsonObject3.put("comment",news.getComment());
            jsonObject3.put("time",news.getTime());
            jsonObject3.put("negative",news.getNegative());
            jsonObject1.put("properties",jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features",jsonArray);

        return jsonObject.toString();
    }

    @Override
    public String getWarmNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getWarmNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type","FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<newsList.size();i++){
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type","Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type","Point");
            double []coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates",coordinates);
            jsonObject1.put("geometry",jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id",news.getNews_id());
            jsonObject3.put("comment_id",news.getComment_id());
            jsonObject3.put("location",news.getLocation());
            jsonObject3.put("class",news.getType());
            jsonObject3.put("comment",news.getComment());
            jsonObject3.put("time",news.getTime());
            jsonObject3.put("negative",news.getNegative());
            jsonObject1.put("properties",jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features",jsonArray);
        return jsonObject.toString();
    }

    @Override
    public void addData(News news) {
        SqlSession session = sqlSessionFactory.openSession();
        Map<String, Object> addMap = new HashMap<>();
        addMap.put("news_id",news.getNews_id());
        addMap.put("comment",news.getComment());
        addMap.put("location",news.getLocation());
        addMap.put("time",news.getTime());
        addMap.put("confidence",news.getConfidence());
        addMap.put("positive",news.getPositive());
        addMap.put("negative",news.getNegative());
        addMap.put("type",news.getType());
        addMap.put("lat",news.getLat());
        addMap.put("lon",news.getLon());
        session.update("cn.hs.mapper.NewsMapper.addData",addMap);
    }

    @Override
    public void deleteData(String comment_id) {
        SqlSession session = sqlSessionFactory.openSession();
        session.delete("cn.hs.mapper.NewsMapper.deleteData",Integer.parseInt(comment_id));
    }

    @Override
    public String queryChartData() {
        List<Chart> chartList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.queryChartData");
        Gson gson = new Gson();
        String str = gson.toJson(chartList);
        return str;
    }

}
