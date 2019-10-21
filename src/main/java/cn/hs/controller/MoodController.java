package cn.hs.controller;


import cn.hs.utils.MoodUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/mood/*")
public class MoodController {

    @RequestMapping("baidu_mood")
    public ModelAndView baidu_mmod(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("GBK");
        String name = request.getParameter("name");
        JSONObject mood = MoodUtil.getMood(name);
        PrintWriter out = response.getWriter();
        out.println(mood);
        return null;
    }

}
