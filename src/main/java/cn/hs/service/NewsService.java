package cn.hs.service;

import cn.hs.pojo.News;

public interface NewsService {

    String getAllForPoint();

    String getAllForLine();

    String getNewsForEcharts();

    String getProvinceMap();

    String getHotNews();

    String getNews();

    String getColdNews();

    String getWarmNews();

    void addData(News news);

    void deleteData(String comment_id);

    String queryChartData();
}
