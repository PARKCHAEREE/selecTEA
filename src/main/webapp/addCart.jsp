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
    Tea goods = dao.getTeaById(id);

    // 에러 페이지로 이동
    if (goods == null) {
        response.sendRedirect("exceptionNoTeaId.jsp");
        return;
    }


    // 세션 장바구니에 담기 
    ArrayList<Tea> list = (ArrayList<Tea>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Tea>();
        session.setAttribute("cartlist", list);
    }

  
    boolean found = false;
    for (Tea t : list) {
        if (t.getTeaId().equals(id)) {
            t.setQuantity(t.getQuantity() + 1);
            found = true;
            break;
        }
    }

    if (!found) {
    	goods.setQuantity(1);
        list.add(goods);
    }

 
    response.sendRedirect("tea.jsp?id=" + id);
%>