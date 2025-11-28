<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>주문 완료</title>
<style>
    .btn-brown { background-color: #6f4e37; color: white; border: none; }
    .btn-brown:hover { background-color: #5a3e2b; color: white; }
</style>
</head>
<body>
    <%
        String shipping_cartId = "";
        String shipping_name = "";
        String shipping_shippingDate = "";
        String shipping_country = "";
        String shipping_zipCode = "";
        String shipping_addressName = "";

        Cookie[] cookies = request.getCookies();

        // 쿠키 정보 읽기 (화면에 보여주기 위함)
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie thisCookie = cookies[i];
                String n = thisCookie.getName();
                if (n.equals("Shipping_cartId")) shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
                if (n.equals("Shipping_shippingDate")) shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            }
        }

        // ★ 중요: 주문이 완료되었으니 세션(장바구니) 삭제
        session.removeAttribute("cartlist");

        // ★ 중요: 쿠키(배송 정보)도 삭제 (유효시간을 0으로 설정해서 재전송)
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie thisCookie = cookies[i];
                String n = thisCookie.getName();
                if (n.equals("Shipping_cartId") || n.equals("Shipping_name") || 
                    n.equals("Shipping_shippingDate") || n.equals("Shipping_country") || 
                    n.equals("Shipping_zipCode") || n.equals("Shipping_addressName")) {
                    
                    thisCookie.setMaxAge(0); // 즉시 삭제
                    thisCookie.setPath("/");
                    response.addCookie(thisCookie);
                }
            }
        }
    %>

    <jsp:include page="menu.jsp" />

    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">주문 완료</h1>
            <p class="lead" style="margin-top: 20px;">Thank you for your order!</p>
        </div>
    </div>

    <div class="container">
        <div class="alert alert-success text-center" role="alert">
            <h4 class="alert-heading">주문해주셔서 감사합니다! 🍵</h4>
            <p>고객님의 주문이 성공적으로 접수되었습니다.</p>
        </div>
        
        <div class="text-center py-5">
            <p class="lead">주문하신 상품은 <strong><%=shipping_shippingDate%></strong> 에 배송될 예정입니다.</p>
            <p class="text-muted">주문 번호: <%=shipping_cartId%></p>
        </div>
        
        <div class="text-center mb-5">
            <a href="./teas.jsp" class="btn btn-secondary btn-lg"> &laquo; 상품 목록 </a>
            <a href="./welcome.jsp" class="btn btn-brown btn-lg"> 홈으로 가기 &raquo;</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>