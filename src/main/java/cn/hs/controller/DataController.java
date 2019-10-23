package cn.hs.controller;

import cn.hs.pojo.News;
import cn.hs.service.NewsService;
import cn.hs.utils.MoodUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/data/*")
public class DataController {

    @Resource
    private NewsService newsService;

    @RequestMapping("loadData")
    public ModelAndView loadData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String CLASS = request.getParameter("type");
        System.out.println(CLASS);
        if (CLASS.equals("super")) {
            String geojson = newsService.getColdNews();
            PrintWriter out = response.getWriter();
            System.out.println("123");
            System.out.println("super");
            System.out.println(geojson);
            System.out.println("***************");
            out.println(geojson);
            out.close();
        } else if (CLASS.equals("destination")) {
            String geojson = newsService.getWarmNews();
            PrintWriter out = response.getWriter();
            System.out.println("123");
            System.out.println("destination");
            System.out.println(geojson);
            System.out.println("***************");
            out.println(geojson);
            out.close();

        } else {
            System.out.println("error");
        }
        return null;
    }

    @RequestMapping("addData")
    public ModelAndView addData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String news_id = request.getParameter("news_id");
        String location = request.getParameter("location");
        String comment = request.getParameter("comment");
        String time = request.getParameter("time");
        Double lng = Double.parseDouble(request.getParameter("lon"));
        Double lat = Double.parseDouble(request.getParameter("lat"));
        int type = Integer.parseInt(request.getParameter("type"));
        JSONObject jsonObject = MoodUtil.getMood(comment);
        JSONObject items = jsonObject.getJSONArray("items").getJSONObject(0);
        double confidence = items.getDouble("confidence");
        double positive = items.getDouble("positive_prob");
        double negative = items.getDouble("negative_prob");
        if(negative-positive<=0.1&&negative-positive>=-0.1)
            type = 0;
        else if(negative-positive>=0.3)
            type = -1;
        else
            type = 1;
        News news = new News(news_id,comment,location,Integer.parseInt(time),confidence,positive,negative,type,lat,lng);
        newsService.addData(news);
        PrintWriter out = response.getWriter();
        out.println(news_id);
        out.close();
        return null;
    }

    @RequestMapping("deleteData")
    public ModelAndView deleteData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String std_id = request.getParameter("ID");

        System.out.println(std_id);

        newsService.deleteData(std_id);
        PrintWriter out = response.getWriter();
        out.println(std_id);
        out.close();
        return null;
    }
}