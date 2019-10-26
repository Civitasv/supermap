package cn.hs.service.impl;

import cn.hs.pojo.Chart;
import cn.hs.pojo.News;
import cn.hs.pojo.WordCloud;
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
    public String getAllForPoint() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            double[] coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", news.getNews_id());
            jsonObject.put("center", coordinates);
            jsonArray.put(jsonObject);
        }
        return jsonArray.toString();
    }

    @Override
    public String getAllForLine() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            double[] coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonArray.put(coordinates);
        }
        jsonObject.put("line", jsonArray);
        JSONArray jsonArray2 = new JSONArray();
        jsonArray2.put(jsonObject);
        return jsonArray2.toString();
    }

    @Override
    public String getNewsForEcharts() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getTenNews");

        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            String url = sqlSessionFactory.openSession().selectOne("cn.hs.mapper.NewsMapper.getNewsUrl", news.getNews_id());
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", news.getNews_id());
            jsonObject.put("url", url);
            jsonObject.put("value", 1);
            if (news.getType() == -1) {
                jsonObject.put("category", 1);
                jsonObject.put("symbolSize", news.getNegative() * 100);
            } else {
                jsonObject.put("category", 2);
                jsonObject.put("symbolSize", news.getPositive() * 100);
            }

            jsonArray.put(jsonObject);
        }
        return jsonArray.toString();
    }

    @Override
    public String getProvinceMap() {
        String[] provinceArr = {"青海省", "新疆维吾尔自治区", "湖北省", "香港特别行政区", "山西省", "云南省", "河北省", "广西壮族自治区", "海南省", "辽宁省", "上海市", "福建省", "陕西省", "四川省", "贵州省", "广东省", "北京市", "澳门特别行政区", "黑龙江省", "江苏省", "天津市", "重庆市", "山东省", "内蒙古自治区", "浙江省", "宁夏回族自治区", "西藏自治区", "吉林省", "安徽省", "江西省", "河南省", "甘肃省", "湖南省", "台湾省"};
        JSONArray jsonArray = new JSONArray();
        SqlSession session = sqlSessionFactory.openSession();
        for(int i=0;i<provinceArr.length;i++) {
            List<News> newsList = session.selectList("cn.hs.mapper.NewsMapper.getProvinceNews",provinceArr[i]);
            for (int j = 0; j < newsList.size(); j++) {
                News news = newsList.get(j);
                JSONObject jsonObject2 = new JSONObject();
                String url = session.selectOne("cn.hs.mapper.NewsMapper.getNewsUrl", news.getNews_id());
                jsonObject2.put("news_id",news.getNews_id());
                jsonObject2.put("url", url);
                jsonObject2.put("value", 1);
                if (news.getType() == -1) {
                    jsonObject2.put("type","消极新闻");
                    jsonObject2.put("category", i+1);
                    jsonObject2.put("symbolSize", news.getNegative() * 50);
                } else {
                    jsonObject2.put("type","积极新闻");
                    jsonObject2.put("category", i+1);
                    jsonObject2.put("symbolSize", news.getPositive() * 50);
                }
                jsonArray.put(jsonObject2);
            }
        }

        return jsonArray.toString();
    }

    @Override
    public String getHotNews() {
        List<WordCloud>  wordClouds = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getHotNews");

        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < wordClouds.size(); i++) {
            WordCloud wordC = wordClouds.get(i);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("value",wordC.getTop_count());
            jsonObject.put("comment_url",wordC.getComment_url());
            jsonObject.put("news_url",wordC.getNews_url());
            jsonObject.put("news_id",wordC.getNews_id());
            jsonObject.put("name",wordC.getTitle().substring(0,10));
            jsonObject.put("title",wordC.getTitle());
            jsonArray.put(jsonObject);
        }
        return jsonArray.toString();
    }

    @Override
    public String getNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type", "FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type", "Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type", "Point");
            double[] coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates", coordinates);
            jsonObject1.put("geometry", jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id", news.getNews_id());
            jsonObject3.put("comment_id", news.getComment_id());
            jsonObject3.put("location", news.getLocation());
            jsonObject3.put("type", news.getType());
            jsonObject3.put("comment", news.getComment());
            jsonObject3.put("time", news.getTime());
            jsonObject3.put("negative", news.getNegative());
            jsonObject3.put("positive", news.getPositive());
            jsonObject1.put("properties", jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features", jsonArray);
        return jsonObject.toString();
    }

    @Override
    public String getColdNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getColdNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type", "FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type", "Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type", "Point");
            double[] coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates", coordinates);
            jsonObject1.put("geometry", jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id", news.getNews_id());
            jsonObject3.put("comment_id", news.getComment_id());
            jsonObject3.put("location", news.getLocation());
            jsonObject3.put("type", news.getType());
            jsonObject3.put("comment", news.getComment());
            jsonObject3.put("time", news.getTime());
            jsonObject3.put("negative", news.getNegative());
            jsonObject3.put("positive", news.getPositive());
            jsonObject1.put("properties", jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features", jsonArray);

        return jsonObject.toString();
    }

    @Override
    public String getWarmNews() {
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getWarmNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type", "FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < newsList.size(); i++) {
            News news = newsList.get(i);
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("type", "Feature");
            JSONObject jsonObject2 = new JSONObject();
            jsonObject2.put("type", "Point");
            double[] coordinates = new double[2];
            coordinates[0] = news.getLon();
            coordinates[1] = news.getLat();
            jsonObject2.put("coordinates", coordinates);
            jsonObject1.put("geometry", jsonObject2);
            JSONObject jsonObject3 = new JSONObject();
            jsonObject3.put("news_id", news.getNews_id());
            jsonObject3.put("comment_id", news.getComment_id());
            jsonObject3.put("location", news.getLocation());
            jsonObject3.put("type", news.getType());
            jsonObject3.put("comment", news.getComment());
            jsonObject3.put("time", news.getTime());
            jsonObject3.put("negative", news.getNegative());
            jsonObject3.put("positive", news.getPositive());
            jsonObject1.put("properties", jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features", jsonArray);
        return jsonObject.toString();
    }

    @Override
    public void addData(News news) {
        SqlSession session = sqlSessionFactory.openSession();
        Map<String, Object> addMap = new HashMap<>();
        addMap.put("news_id", news.getNews_id());
        addMap.put("comment", news.getComment());
        addMap.put("location", news.getLocation());
        addMap.put("time", news.getTime());
        addMap.put("confidence", news.getConfidence());
        addMap.put("positive", news.getPositive());
        addMap.put("negative", news.getNegative());
        addMap.put("type", news.getType());
        addMap.put("lat", news.getLat());
        addMap.put("lon", news.getLon());
        session.update("cn.hs.mapper.NewsMapper.addData", addMap);
    }

    @Override
    public void deleteData(String comment_id) {
        SqlSession session = sqlSessionFactory.openSession();
        session.delete("cn.hs.mapper.NewsMapper.deleteData", Integer.parseInt(comment_id));
    }

    @Override
    public String queryChartData() {
        List<Chart> chartList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.queryChartData");
        Gson gson = new Gson();
        String str = gson.toJson(chartList);
        return str;
    }

}
