import cn.hs.pojo.Chart;
import cn.hs.utils.MoodUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
        String comment = "我很开心";
        System.out.println(MoodUtil.getMood(comment));
    }
}
