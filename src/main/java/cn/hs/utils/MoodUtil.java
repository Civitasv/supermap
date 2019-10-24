package cn.hs.utils;

import com.baidu.aip.nlp.AipNlp;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


public class MoodUtil {
    private static final String APP_ID = "17081433";
    private static final String API_KEY = "ZDMmw88yjmeYVTeVLjH45Iuw";
    private static final String SECRET_KEY = "NwwaVlu6HPnShA5rRnkj8Ib2zQ1Vs2iQ";

    public static void main(String[] args) {
        getMood("上海市浦东新区纳贤路701号百度上海研发中心 F4A000 张三");
    }

    public static JSONObject getMood(String text) {
        AipNlp client = new AipNlp(APP_ID, API_KEY, SECRET_KEY);

        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);

        JSONObject res_stm = client.sentimentClassify(text, null);
        JSONObject res_smy = client.newsSummary(text, 300, null);
        JSONObject stm = res_stm.getJSONArray("items").getJSONObject(0);
        JSONObject out_put = new JSONObject();

        out_put.put("sentiment", stm.get("sentiment"));
        out_put.put("confidence", stm.get("confidence"));
        out_put.put("positive_prob", stm.get("positive_prob"));
        out_put.put("negative_prob", stm.get("negative_prob"));
        out_put.put("summary", res_smy.get("summary"));
        System.out.println(out_put);
        String token = "";
        String txt_prov="unknown";
        String txt_city="unknown";
        try {
            CloseableHttpClient token_client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost("https://aip.baidubce.com/oauth/2.0/token");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("grant_type", "client_credentials"));
            params.add(new BasicNameValuePair("client_id", "ZDMmw88yjmeYVTeVLjH45Iuw"));
            params.add(new BasicNameValuePair("client_secret", "NwwaVlu6HPnShA5rRnkj8Ib2zQ1Vs2iQ"));
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            CloseableHttpResponse res = token_client.execute(httpPost);
            if(res.getStatusLine().getStatusCode() == HttpStatus.OK.value()){
                HttpEntity entity = res.getEntity();
                String json = EntityUtils.toString(entity, StandardCharsets.UTF_8);
                JSONObject jsonObject = new JSONObject(json);
                token = jsonObject.getString("access_token");
            }
            token_client.close();

            CloseableHttpClient geo_client = HttpClients.createDefault();
            String adr_url = "https://aip.baidubce.com/rpc/2.0/nlp/v1/address?" + "access_token=" + token + "&charset=UTF-8";
            HttpPost geo_post = new HttpPost(adr_url);
            geo_post.addHeader("Content-Type", "application/json");
            JSONObject post_obj = new JSONObject();
            post_obj.put("text",text);
            String post_str = post_obj.toString();
            StringEntity geo_entity = new StringEntity(post_str,"UTF-8");
            geo_post.setEntity(geo_entity);
            CloseableHttpResponse geo_res = geo_client.execute(geo_post);
            if(geo_res.getStatusLine().getStatusCode() == HttpStatus.OK.value()){
                HttpEntity back_entity = geo_res.getEntity();
                String geo_json = EntityUtils.toString(back_entity, StandardCharsets.UTF_8);
                System.out.println(geo_json);
                JSONObject jsonObject = new JSONObject(geo_json);
                txt_prov = jsonObject.getString("province");
                txt_city = jsonObject.getString("city");
                if (txt_prov.equals("")){
                    txt_prov="unknown";
                }
                if (txt_city.equals("")){
                    txt_city="unknown";
                }
            }
            geo_client.close();
        }catch (Exception e){
            System.out.println(e.toString());
        }
        out_put.put("province",txt_prov);
        out_put.put("city",txt_city);
        return out_put;
    }

}
