import cn.hs.pojo.Chart;
import cn.hs.pojo.News;
import cn.hs.utils.MoodUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml"})
public class JDBCTest {
    @Resource
    SqlSessionFactory sqlSessionFactory;


    @Test
    public void testSession() throws Exception{
        String[] provinceArr = {"青海省", "新疆维吾尔自治区", "湖北省", "香港特别行政区", "山西省", "云南省", "河北省", "广西壮族自治区", "海南省", "辽宁省", "上海市", "福建省", "陕西省", "四川省", "贵州省", "广东省", "北京市", "澳门特别行政区", "黑龙江省", "江苏省", "天津市", "重庆市", "山东省", "内蒙古自治区", "浙江省", "宁夏回族自治区", "西藏自治区", "吉林省", "安徽省", "江西省", "河南省", "甘肃省", "湖南省", "台湾省"};
        JSONArray jsonArray = new JSONArray();
        SqlSession session = sqlSessionFactory.openSession();
        for(int i=0;i<provinceArr.length;i++) {
            List<News> newsList = session.selectList("cn.hs.mapper.NewsMapper.getProvinceNews",provinceArr[i]);
            for (int j = 0; j < newsList.size(); j++) {
                News news = newsList.get(j);
                JSONObject jsonObject2 = new JSONObject();
                String url = session.selectOne("cn.hs.mapper.NewsMapper.getNewsUrl", news.getNews_id());
                jsonObject2.put("name","");
                jsonObject2.put("url", url);
                jsonObject2.put("value", 1);
                if (news.getType() == -1) {
                    jsonObject2.put("category", i+1);
                    jsonObject2.put("symbolSize", news.getNegative() * 100);
                } else {
                    jsonObject2.put("category", i+1);
                    jsonObject2.put("symbolSize", news.getPositive() * 100);
                }
                jsonArray.put(jsonObject2);
            }
        }

        System.out.println(jsonArray.toString());
    }
}
