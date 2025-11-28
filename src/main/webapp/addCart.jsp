<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Tea"%>
<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp" %>

<%
    // 1. 파라미터로 넘어온 상품 ID 확인
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("teas.jsp");
        return;
    }

    // 2. DB에서 상품 정보 조회
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Tea goods = null; // 장바구니에 담을 객체

    try {
        // ★ 중요: 테이블 컬럼명 t_id 확인
        String sql = "SELECT * FROM tea WHERE t_id = ?"; 
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 3. DTO(Tea) 객체에 DB 데이터 담기 (보내주신 Tea.java 기준)
            goods = new Tea();
            goods.setTeaId(rs.getString("t_id"));
            goods.setName(rs.getString("t_name"));
            goods.setUnitPrice(rs.getInt("t_unitPrice"));
            goods.setDescription(rs.getString("t_description"));
            goods.setCountry(rs.getString("t_country"));     // DTO 필드명에 맞춤
            goods.setCategory(rs.getString("t_category"));   // DTO 필드명에 맞춤
            goods.setPackaging(rs.getString("t_packaging")); // DTO 필드명에 맞춤
            goods.setUnitsInStock(rs.getLong("t_unitsInStock"));
            goods.setFilename(rs.getString("t_fileName"));
            goods.setQuantity(1); // 장바구니엔 기본 1개 담기
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        // conn은 dbconn.jsp에서 관리
    }

    // 상품이 DB에 없으면 에러 페이지로
    if (goods == null) {
        response.sendRedirect("exceptionNoTeaId.jsp");
        return;
    }

    // 4. 세션 장바구니에 담기 로직
    ArrayList<Tea> list = (ArrayList<Tea>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Tea>();
        session.setAttribute("cartlist", list);
    }

    // 이미 장바구니에 있는 상품인지 확인 (수량 증가)
    boolean found = false;
    for (Tea t : list) {
        if (t.getTeaId().equals(id)) {
            t.setQuantity(t.getQuantity() + 1);
            found = true;
            break;
        }
    }

    // 장바구니에 없는 새 상품이면 추가
    if (!found) {
        list.add(goods);
    }

    // 5. 상품 상세 페이지로 다시 돌아가기
    response.sendRedirect("tea.jsp?id=" + id);
%>