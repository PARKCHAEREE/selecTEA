<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./dbconn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birth = request.getParameter("birth"); 
    String mail = request.getParameter("mail");   
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
    String regist_day = formatter.format(new java.util.Date());

    String sql = "INSERT INTO member (id, password, name, gender, birth, mail, phone, address, regist_day) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
    	PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, gender);
        pstmt.setString(5, birth);
        pstmt.setString(6, mail);
        pstmt.setString(7, phone);
        pstmt.setString(8, address);
        pstmt.setString(9, regist_day);
        
        pstmt.executeUpdate();


        response.sendRedirect("login.jsp");

    } catch (SQLException ex) {
        out.println("가입 실패: " + ex.getMessage());
    } finally {
        if (conn != null) conn.close();
    }
%>