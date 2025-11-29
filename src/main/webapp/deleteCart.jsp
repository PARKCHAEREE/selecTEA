<%@ page contentType="text/html; charset=utf-8"%>
<%
    
    String cartId = request.getParameter("cartId");

    if (cartId == null || cartId.trim().equals("")) {
        response.sendRedirect("cart.jsp");
        return;
    }

 // 세션 전체를 무효화하면 로그아웃되므로 , 장바구니만 삭제하여 로그인 상태 유지
    session.removeAttribute("cartlist");

    response.sendRedirect("cart.jsp");
%>