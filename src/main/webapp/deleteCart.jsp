<%@ page contentType="text/html; charset=utf-8"%>
<%
    // 1. 장바구니 ID(세션 ID)가 넘어왔는지 확인 (유효성 검사)
    String cartId = request.getParameter("cartId");

    if (cartId == null || cartId.trim().equals("")) {
        response.sendRedirect("cart.jsp");
        return;
    }

    // 2. 세션에서 장바구니 속성("cartlist")만 삭제
    // (주의: session.invalidate()를 쓰면 로그인까지 풀려버림)
    session.removeAttribute("cartlist");

    // 3. 다시 장바구니 페이지로 이동 (비어있는 상태 확인)
    response.sendRedirect("cart.jsp");
%>