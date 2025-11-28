<%@ page contentType="text/html; charset=utf-8"%>
<%
    // 1. 세션에 저장된 'sessionId' 삭제 
    session.removeAttribute("sessionId");
    session.removeAttribute("sessionName");
    
    // 2. 세션 전체 무효화 
    session.invalidate();
    
    // 3. 메인 페이지로 이동
    response.sendRedirect("welcome.jsp");
%>