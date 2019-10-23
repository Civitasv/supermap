import cn.hs.pojo.News;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml"})
public class NewsTest {
    @Resource
    SqlSessionFactory sqlSessionFactory;

    @Test
    public void testSession() throws Exception{
        List<News> newsList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.NewsMapper.getNews");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type","FeatureCollection");
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<1;i++){
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
            jsonObject3.put("std_id",i);
            jsonObject3.put("id",news.getNews_id());
            jsonObject3.put("location",news.getLocation());
            jsonObject3.put("class",news.getType());
            jsonObject3.put("comment",news.getComment());
            jsonObject3.put("time",news.getTime());
            jsonObject3.put("negative",news.getNegative());
            jsonObject1.put("properties",jsonObject3);
            jsonArray.put(jsonObject1);
        }
        jsonObject.put("features",jsonArray);
        System.out.println(jsonObject.toString());
    }
}
