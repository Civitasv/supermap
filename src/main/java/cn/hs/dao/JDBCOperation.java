package cn.hs.dao;


import java.sql.*;

public class JDBCOperation {

    public Connection getConn() {
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://47.102.110.65:5432/tesla_station";
        String username = "postgres";
        String password = "256618";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}

