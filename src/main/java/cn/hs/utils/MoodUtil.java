package cn.hs.utils;

import com.baidu.aip.nlp.AipNlp;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;

import javax.servlet.jsp.JspException;
import java.io.UnsupportedEncodingException;
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
        try {
            text = new String(text.getBytes("gbk"), "gbk");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
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
        String txt_town = "unknown";
        String txt_county = "unknown";
        String txt_detail = "unknown";

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
                txt_town = jsonObject.getString("town");
                txt_county = jsonObject.getString("county");
                txt_detail = jsonObject.getString("detail");
            }
            geo_client.close();

            String query = txt_prov+txt_city+txt_town+txt_county+txt_detail;
            CloseableHttpClient geo_coder = HttpClients.createDefault();
            String coder_url = "http://api.map.baidu.com/geocoding/v3/?"+"address="+query+"&output=json&ak=r7hfQnBXT2gxsVFGlZ14PZiNwk7gTs4G&callback=showLocation";
            HttpGet get = new HttpGet(coder_url);
            CloseableHttpResponse coder_res = geo_coder.execute(get);
            if(coder_res.getStatusLine().getStatusCode() == HttpStatus.OK.value()){
                HttpEntity coder_entity = coder_res.getEntity();
                String coder_json = EntityUtils.toString(coder_entity, StandardCharsets.UTF_8);
                coder_json= coder_json.substring(27,coder_json.length()-1);
                System.out.println(coder_json);
                JSONObject loc_res = new JSONObject(coder_json);
                JSONObject loc_result = loc_res.getJSONObject("result");
                JSONObject location = loc_result .getJSONObject("location");
                out_put.put("lat",location.get("lat"));
                out_put.put("lon",location.get("lng"));
            }
            geo_coder.close();
        }catch (Exception e){
            txt_prov="unknown";
            txt_city="unknown";
            txt_town = "unknown";
            txt_county = "unknown";
            txt_detail = "unknown";
            out_put.put("lon",114.3);
            out_put.put("lat",30.6);
            System.out.println(e.toString());
        }
        out_put.put("province",txt_prov);
        out_put.put("city",txt_city);
        out_put.put("town",txt_town);
        out_put.put("county",txt_county);
        out_put.put("detail",txt_detail);
        return out_put;
    }

}
