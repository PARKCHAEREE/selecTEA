<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String db_url = "jdbc:mysql://localhost:3307/selecteaDB?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=utf8";
        String db_id = "root";  
        String db_pw = "1234";  

        
        conn = DriverManager.getConnection(db_url, db_id, db_pw);
        
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<h3>DB 연결 실패</h3>");
        out.println(e.getMessage());
    }
%>