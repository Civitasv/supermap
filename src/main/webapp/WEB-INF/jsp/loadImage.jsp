<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*"%> 
<%@ page import="java.sql.*, javax.sql.*" %> 
<%@ page import="java.math.*"%> 
<%@ page import ="cn.hs.dao.JDBCOperation"%>
<% 

   
   String std_id=new String(request.getParameter("STD_ID").toString().getBytes("ISO-8859-1"), "utf-8");
   JDBCOperation op=new JDBCOperation();
   Connection conn=op.getConn();
   OutputStream os = null;
   String sql = "SELECT image FROM stationinfo WHERE gid = "+ "\'" + std_id + "\'"; 
   PreparedStatement psta=conn.prepareStatement(sql); 
   try{ 
      ResultSet rs = psta.executeQuery();
      while(rs.next()) 
      {  
         InputStream in = rs.getBinaryStream("image"); 
         in.skip(0); 
         response.reset(); 
         response.setContentType("image/*");  
         byte[] b = new byte[1024];
         int len;  
         while((len=in.read(b)) >0){  
            os = response.getOutputStream();   
            os.write(b,0,len);
            out.clear(); 
            out=pageContext.pushBody();
         } 
         //os.close();
         in.close();
         return;
         //out.clear(); 
      }
      rs.close();
   }catch(Exception e) {
      e.printStackTrace(); 
   }finally{
     if(os!=null)
        os.close();
     if(psta!=null)
        psta.close();
     if(conn!=null)
        conn.close();
   }
%> 
