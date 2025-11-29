<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM member WHERE id = ? AND password = ?";
        pstmt = conn.prepareStatement(sql); // conn이 null이면 에러 발생
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            session.setAttribute("sessionId", id);
            session.setAttribute("sessionName", name);
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login_failed.jsp");
        }
    } catch (SQLException ex) {
        out.println("로그인 처리 중 오류 발생: " + ex.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>