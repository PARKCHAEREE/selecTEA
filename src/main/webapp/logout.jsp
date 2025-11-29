<%@ page contentType="text/html; charset=utf-8"%>
<%
    session.removeAttribute("sessionId");
    session.removeAttribute("sessionName");
    //세션 전체 무효화 
    session.invalidate();
    
    response.sendRedirect("welcome.jsp");
%>