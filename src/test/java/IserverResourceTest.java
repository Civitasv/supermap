import cn.hs.service.ServerService;
import cn.hs.utils.IserverUtil;
import cn.hs.vo.Point;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class IserverResourceTest {

    @Resource(name = "iserverServiceImpl")
    private ServerService iserverService;
    @Test
    public void testGetResourceJson() {
        JSONObject jsonObject = IserverUtil.queryRoadByName("小屯路");
        System.out.println(jsonObject);
    }


    // 本机测试
    @Test
    public void testGetMinDistancePolyline(){
        JSONObject jsonObject = iserverService.queryRoadByName("小屯路", new Point(116.23068196400004, 39.87451197200005));
        System.out.println(jsonObject);
    }

}
