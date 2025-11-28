<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>
<%
    // 1. 삭제할 상품 ID 받기
    String id = request.getParameter("id");

    // ID가 없으면 상품 목록으로 돌려보냄 (유효성 검사)
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("teas.jsp");
        return;
    }

    // 2. 상품이 실제 DB에 존재하는지 확인 (북마켓 예제 로직 반영)
    TeaRepository dao = TeaRepository.getInstance();
    Tea tea = dao.getTeaById(id);
    
    if (tea == null) {
        response.sendRedirect("exceptionNoTeaId.jsp");
        return;
    }

    // 3. 세션에서 장바구니 목록 가져오기
    ArrayList<Tea> cartList = (ArrayList<Tea>) session.getAttribute("cartlist");
    
    // 4. 장바구니 목록을 돌면서 ID가 일치하는 상품 찾아서 삭제
    Tea goodsQnt = new Tea();
    for (int i = 0; i < cartList.size(); i++) {
        goodsQnt = cartList.get(i);
        if (goodsQnt.getTeaId().equals(id)) {
            cartList.remove(goodsQnt); // 삭제 수행
            break; // 삭제했으면 반복문 종료
        }
    }

    // 5. 다시 장바구니 페이지로 이동
    response.sendRedirect("cart.jsp");
%>