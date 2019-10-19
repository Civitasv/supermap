package cn.hs.controller;

import cn.hs.service.JDBCService;
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
    private JDBCService jdbcService;

    @RequestMapping("loadData")
    public ModelAndView loadData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String CLASS = request.getParameter("class");
        System.out.println(CLASS);
        if (CLASS.equals("super")) {
            String geojson = jdbcService.getSuperStation();
            PrintWriter out = response.getWriter();
            System.out.println("123");
            System.out.println("super");
            System.out.println(geojson);
            System.out.println("***************");
            out.println(geojson);
            out.close();
        } else if (CLASS.equals("destination")) {
            String geojson = jdbcService.getDestiStation();
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

    @RequestMapping(value = "editData")
    public ModelAndView editData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String std_id = request.getParameter("ID");
        String name = request.getParameter("NAME");
        String address = request.getParameter("ADDRESS");
        String phone = request.getParameter("PHONE");
        String time = request.getParameter("TIME");
        String price = request.getParameter("PRICE");
        String port = request.getParameter("PORT");
        System.out.println(name);
        jdbcService.updateData(std_id, name, address, phone, time, price, port);
        PrintWriter out = response.getWriter();
        out.println(name);
        out.close();
        return null;
    }

    @RequestMapping("addData")
    public ModelAndView addData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("NAME");
        String address = request.getParameter("ADDRESS");
        String phone = request.getParameter("PHONE");
        String time = request.getParameter("TIME");
        String price = request.getParameter("PRICE");
        String port = request.getParameter("PORT");
        Double lng = Double.parseDouble(request.getParameter("LONGITUDE"));
        Double lat = Double.parseDouble(request.getParameter("LATITUDE"));
        int sta_class = Integer.parseInt(request.getParameter("CLASS"));
        System.out.println(name);
        jdbcService.addData(name, address, phone, time, price, port, sta_class, lng, lat);
        PrintWriter out = response.getWriter();
        out.println(name);
        out.close();
        return null;
    }

    @RequestMapping("deleteData")
    public ModelAndView deleteData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String std_id = request.getParameter("ID");

        System.out.println(std_id);

        jdbcService.deleteData(std_id);
        PrintWriter out = response.getWriter();
        out.println(std_id);
        out.close();
        return null;
    }
}