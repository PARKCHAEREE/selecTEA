<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>

<%
    String id = request.getParameter("id");

    if (id == null || id.trim().equals("")) {
        response.sendRedirect("teas.jsp");
        return;
    }

    TeaRepository dao = TeaRepository.getInstance();
    Tea tea = dao.getTeaById(id);
    
    if (tea == null) {
        response.sendRedirect("exceptionNoTeaId.jsp");
        return;
    }

    ArrayList<Tea> cartList = (ArrayList<Tea>) session.getAttribute("cartlist");
    
    //장바구니가 비어있거나 세션이 만료된 경우 처리
    if (cartList == null) {
        response.sendRedirect("cart.jsp");
    } else {

        for (int i = 0; i < cartList.size(); i++) {
            Tea t = cartList.get(i);
            if (t.getTeaId().equals(id)) {
                cartList.remove(t); 
                break; 
            }
        }
    }

    response.sendRedirect("cart.jsp");
%>