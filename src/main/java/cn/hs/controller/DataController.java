package cn.hs.controller;

import cn.hs.pojo.News;
import cn.hs.service.JDBCService;
import cn.hs.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        String CLASS = request.getParameter("class");
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
        String id = request.getParameter("NAME");
        String location = request.getParameter("ADDRESS");
        String comment = request.getParameter("PHONE");
        String time = request.getParameter("TIME");
        String negative = request.getParameter("PRICE");
        Double lng = Double.parseDouble(request.getParameter("LONGITUDE"));
        Double lat = Double.parseDouble(request.getParameter("LATITUDE"));
        int type = Integer.parseInt(request.getParameter("CLASS"));
        News news = new News(id,comment,location,Integer.parseInt(time),0,0,Double.parseDouble(negative),type,lat,lng);
        newsService.addData(news);
        PrintWriter out = response.getWriter();
        out.println(id);
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