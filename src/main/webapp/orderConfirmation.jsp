<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>

<%
    request.setCharacterEncoding("UTF-8");

    String cartId = session.getId();

    // 쿠키에 저장된 배송 정보 가져오기
    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_shippingDate = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_addressName = "";

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            // 한글 깨짐 방지를 위해 디코딩
            if (n.equals("Shipping_cartId")) shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            if (n.equals("Shipping_name")) shipping_name = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            if (n.equals("Shipping_shippingDate")) shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            if (n.equals("Shipping_country")) shipping_country = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            if (n.equals("Shipping_zipCode")) shipping_zipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
            if (n.equals("Shipping_addressName")) shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
        }
    }
%>

<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>주문 정보 확인</title>
<style>
    .btn-brown { background-color: #6f4e37; color: white; border: none; }
    .btn-brown:hover { background-color: #5a3e2b; color: white; }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">주문 정보 확인</h1>
            <p class="lead" style="margin-top: 20px;">Order Confirmation</p>
        </div>
    </div>

    <div class="container col-8 alert alert-info text-center">
        <h5 class="m-0">입력하신 정보가 맞는지 확인해주세요.</h5>
    </div>

    <div class="container col-8 align-center">
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-light">
                <h5 class="m-0">📦 배송지 정보</h5>
            </div>
            <div class="card-body">
                <p><strong>성명:</strong> <%=shipping_name%></p>
                <p><strong>배송일:</strong> <%=shipping_shippingDate%></p>
                <p><strong>우편번호:</strong> <%=shipping_zipCode%></p>
                <p><strong>주소:</strong> <%=shipping_addressName%> (<%=shipping_country%>)</p>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-header bg-light">
                <h5 class="m-0">🧾 주문 상품 목록</h5>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover m-0">
                    <thead class="text-center">
                        <tr>
                            <th>상품</th>
                            <th>수량</th>
                            <th>가격</th>
                            <th>소계</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <%
                            int sum = 0;
                            ArrayList<Tea> cartList = (ArrayList<Tea>) session.getAttribute("cartlist");
                            if (cartList == null) cartList = new ArrayList<Tea>();

                            for (int i = 0; i < cartList.size(); i++) {
                                Tea tea = cartList.get(i);
                                int total = tea.getUnitPrice() * tea.getQuantity();
                                sum = sum + total;
                        %>
                        <tr>
                            <td class="text-left pl-4"><%=tea.getName()%></td>
                            <td><%=tea.getQuantity()%></td>
                            <td><%=tea.getUnitPrice()%></td>
                            <td><%=total%></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr class="font-weight-bold" style="background-color: #fdfbf7;">
                            <td colspan="3" class="text-right pr-4" style="font-size: 1.2rem;">총 주문 금액</td>
                            <td style="font-size: 1.2rem; color: #d9534f;"><%=sum%> 원</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row justify-content-between mt-5 mb-5">
            <a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary btn-lg"> 이전 </a>
            <a href="./thankCustomer.jsp" class="btn btn-brown btn-lg"> 주문 완료 </a>
            <a href="./checkOutCancelled.jsp" class="btn btn-light btn-lg border"> 취소 </a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>