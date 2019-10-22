package cn.hs.utils;

import com.baidu.aip.nlp.AipNlp;
import org.json.JSONObject;

public class MoodUtil {
    private static final String APP_ID = "17081433";
    private static final String API_KEY = "ZDMmw88yjmeYVTeVLjH45Iuw";
    private static final String SECRET_KEY = "NwwaVlu6HPnShA5rRnkj8Ib2zQ1Vs2iQ";

    public static JSONObject getMood(String text) {
        AipNlp client = new AipNlp(APP_ID, API_KEY, SECRET_KEY);

        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);


        JSONObject res = client.sentimentClassify(text, null);
        System.out.println(res.toString(2));

        return res;
    }

}
