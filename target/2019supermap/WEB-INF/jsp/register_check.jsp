<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.sql.Connection"%>
<%@ page import="cn.hs.dao.JDBCOperation" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	String email = request.getParameter("email");
	String password1 = request.getParameter("password");
	String password2 = request.getParameter("confirmpassword");
	JDBCOperation JDBC = new JDBCOperation();
	if (email == null || "".equals(email.trim()) || password1 == null || "".equals(password1.trim())
			|| password2 == null || "".equals(password2.trim())) {
		//out.write("用户名或密码不能为空！");  
		System.out.println("邮箱或密码不能为空！");
		response.sendRedirect("${path}/pages/register.action");
		return;
	}
	if (!password1.equals(password2)) {
		//out.write("用户名或密码不能为空！");  
		System.out.println("两次密码不一致！");
		response.sendRedirect("${path}/pages/register.action");
		return;
		//request.getRequestDispatcher("login.jsp").forward(request, response);  
	}
	boolean isValid = false;
	Connection conn = null;// 创建一个数据库连接  
	PreparedStatement pre = null;// 创建预编译语句对象，一般都是用这个而不用Statement  
	ResultSet result = null;// 创建一个结果集对象  
	try {
		JDBC = new JDBCOperation();
		conn = JDBC.getConn();
		String sql = "select * from public.\"userInfo\" where email=?";// 预编译语句，“？”代表参数  
		pre = conn.prepareStatement(sql);// 实例化预编译语句  
		pre.setString(1, email);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引  
		result = pre.executeQuery();// 执行查询，注意括号中不需要再加参数  
		if (!result.next()) {
			System.out.println("开始写入！");
			sql = "insert into public.\"userInfo\"(email,password) values(?,?)";// 预编译语句，“？”代表参数  
			pre = (PreparedStatement) conn.prepareStatement(sql);// 实例化预编译语句  
			pre.setString(1, email);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引  
			pre.setString(2, password1);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引  
			pre.executeUpdate();// 执行  
			isValid = true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			// 逐一将上面的几个对象关闭，因为不关闭的话会影响性能、并且占用资源  
			// 注意关闭的顺序，最后使用的最先关闭  
			if (result != null)
				result.close();
			if (pre != null)
				pre.close();
			if (conn != null)
				conn.close();
			//System.out.println("数据库连接已关闭！");  
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	if (isValid) {
		System.out.println("注册成功，请登录！");
		response.sendRedirect(basePath+"pages/login.action");
	} else {
		System.out.println("用户名已存在！");
		response.sendRedirect(basePath+"pages/register.action");
	}
%>
