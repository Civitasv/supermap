package cn.hs.controller;

import cn.hs.dao.JDBCOperation;
import cn.hs.service.JDBCService;
import org.apache.tomcat.util.http.fileupload.RequestContext;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

@Controller
@RequestMapping("/image/*")
public class ImageController {
    @Resource
    private JDBCService jdbcService;

    @RequestMapping("updateImage")
    public ModelAndView ajax_updateImage(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");


        String std_id="";


        DiskFileItemFactory  factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        JDBCOperation op=new JDBCOperation();
        try{
            // 解析请求的内容提取文件数据
            List<FileItem> formItems = upload.parseRequest(request);
            InputStream inputImg=null;
            for (FileItem item : formItems) {
                // 处理在表单中的字段
                if (item.isFormField()) {
                    String name = item.getFieldName(); // 获取name属性的值
                    //*****这里非常重要！！！！！！！！！涉及到中文乱码的问题
                    String value = item.getString("UTF-8"); // 获取value属性的值

                    if(name.equals("std_id"))
                    {
                        std_id = value;
                        System.out.print(std_id);
                    }

                }else{

                    inputImg = item.getInputStream();
                }

            }
            Connection conn = op.getConn();

            //String sql = "UPDATE photos set photo =? where city='"+city+"'";


            String sql = "UPDATE public.stationinfo SET image = ? WHERE gid = '"+std_id+"'";
            PreparedStatement preStatement = conn.prepareStatement(sql);

            preStatement.setBinaryStream(1, inputImg, inputImg.available());

            if(inputImg.available()!=0)
            {
                preStatement.execute();
            }

            PrintWriter out = response.getWriter();
            out.write("上传成功");
            out.close();

        }catch(Exception e){
            e.printStackTrace();

        }
        return null;
    }
}
