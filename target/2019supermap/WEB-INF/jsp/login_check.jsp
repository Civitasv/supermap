<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>  
<%@ page language="java" import="java.sql.Connection" %>
<%@ page import="cn.hs.dao.JDBCOperation" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%   

  String email = request.getParameter("email"); 
  System.out.print(email); 
  String password = request.getParameter("password");  
  JDBCOperation JDBC=new JDBCOperation();

  boolean isValid = false;  
  Connection conn = null;// 创建一个数据库连接  
  PreparedStatement pre = null;// 创建预编译语句对象，一般都是用这个而不用Statement  
  ResultSet result = null;// 创建一个结果集对象  
  try  
  {  
       
	  JDBC=new JDBCOperation();      
	  conn = JDBC.getConn();  
      String sql = "select * from public.\"userInfo\" where email=? and password=?";// 预编译语句，“？”代表参数  
      pre = conn.prepareStatement(sql);// 实例化预编译语句  
      pre.setString(1, email);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引  
      pre.setString(2, password);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引  
      result = pre.executeQuery();// 执行查询，注意括号中不需要再加参数  
      if (result.next()){  
          isValid = true;
          System.out.println("登陆成功！");  
      }  
  }  
  catch (Exception e)  
  {  
      e.printStackTrace();  
  }  
  finally  
  {  
      try  
      {  
          // 逐一将上面的几个对象关闭，因为不关闭的话会影响性能、并且占用资源  
          // 注意关闭的顺序，最后使用的最先关闭  
          if (result != null)  
              result.close();  
          if (pre != null)  
              pre.close();  
          if (conn != null)  
              conn.close();  
      }  
      catch (Exception e)  
      {  
          e.printStackTrace();  
      }  
  }  
  if(isValid){  
      System.out.println("登录成功！");
      session.setAttribute("email", email);  
      response.sendRedirect(basePath+"pages/index.action");
  }else{  
      System.out.println("登录失败！");
      response.sendRedirect(basePath+"pages/login.action");
  }  
  %>  
