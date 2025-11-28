<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>

<%
    // 1. 한글 깨짐 방지 처리
    request.setCharacterEncoding("UTF-8");

    // 2. 폼에서 넘어온 배송 정보 받기
    // (쿠키는 문자열만 저장 가능하므로, 한글은 인코딩이 필수입니다)
    String cartId = request.getParameter("cartId");
    String name = request.getParameter("name");
    String shippingDate = request.getParameter("shippingDate");
    String country = request.getParameter("country");
    String zipCode = request.getParameter("zipCode");
    String addressName = request.getParameter("addressName");

    // 3. 쿠키 생성 (이름, 값)
    // 한글 데이터는 URLEncoder.encode()로 변환해야 에러가 안 납니다.
    Cookie cartIdCookie = new Cookie("Shipping_cartId", URLEncoder.encode(cartId, "utf-8"));
    Cookie nameCookie = new Cookie("Shipping_name", URLEncoder.encode(name, "utf-8"));
    Cookie shippingDateCookie = new Cookie("Shipping_shippingDate", URLEncoder.encode(shippingDate, "utf-8"));
    Cookie countryCookie = new Cookie("Shipping_country", URLEncoder.encode(country, "utf-8"));
    Cookie zipCodeCookie = new Cookie("Shipping_zipCode", URLEncoder.encode(zipCode, "utf-8"));
    Cookie addressNameCookie = new Cookie("Shipping_addressName", URLEncoder.encode(addressName, "utf-8"));

    // 4. 쿠키 유효 시간 설정 (24시간)
    cartIdCookie.setMaxAge(24 * 60 * 60);
    nameCookie.setMaxAge(24 * 60 * 60);
    shippingDateCookie.setMaxAge(24 * 60 * 60);
    countryCookie.setMaxAge(24 * 60 * 60);
    zipCodeCookie.setMaxAge(24 * 60 * 60);
    addressNameCookie.setMaxAge(24 * 60 * 60);

    // 5. 응답 헤더에 쿠키 추가 (클라이언트에게 저장 지시)
    response.addCookie(cartIdCookie);
    response.addCookie(nameCookie);
    response.addCookie(shippingDateCookie);
    response.addCookie(countryCookie);
    response.addCookie(zipCodeCookie);
    response.addCookie(addressNameCookie);

    // 6. 주문 확인 페이지로 이동
    response.sendRedirect("orderConfirmation.jsp");
%>