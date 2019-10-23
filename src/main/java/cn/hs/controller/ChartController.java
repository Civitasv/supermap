package cn.hs.controller;

import cn.hs.service.NewsService;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/chart/*")
public class ChartController {
    @Resource
    private NewsService newsService;
    @RequestMapping("loadChart")
    public ModelAndView loadChart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        //创建DAO
        //从数据库里取数据
        String chartArr = newsService.queryChartData();

        //ArrayList对象转化为JSON对象
        JSONArray json = new JSONArray(chartArr);
        //控制台显示JSON
        System.out.println(json.toString());
        //返回到JSP
        PrintWriter writer = response.getWriter();
        writer.println(json);
        writer.flush();
        //关闭输出流
        writer.close();
        return null;
    }
}
