<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Tea"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>장바구니</title>
<style>
    .bg-brown { background-color: #6f4e37; color: white; }
    .text-brown { color: #6f4e37; }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <%
        int sum = 0;
        ArrayList<Tea> cartList = (ArrayList<Tea>) session.getAttribute("cartlist");
        
        if (cartList == null) {
            cartList = new ArrayList<Tea>();
        }
    %>

    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">장바구니</h1>
            <p class="lead" style="margin-top: 20px;">Shopping Cart</p>
        </div>
    </div>

    <div class="container" style="padding-top: 50px">
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left">
                        <a href="./deleteCart.jsp?cartId=<%=session.getId()%>" class="btn btn-danger">삭제하기</a>
                    </td>
                    <td align="right">
                        <% 
                            boolean cartIsEmpty = (cartList == null || cartList.isEmpty());
                            
                            if (cartIsEmpty) { 
                        %>
                            <a href="#" class="btn btn-success disabled" onclick="alert('장바구니가 비어있습니다.'); return false;">주문하기</a>
                        <% } else { %>
                            <a href="./shippingInfo.jsp?cartId=<%=session.getId()%>" class="btn btn-success">주문하기</a>
                        <% } %>
                    </td>
                </tr>
            </table>
        </div>

        <div style="padding-top: 50px">
            <table class="table table-hover">
                <thead class="bg-light">
                    <tr>
                        <th>상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < cartList.size(); i++) { 
                            Tea tea = cartList.get(i);
                            int total = tea.getUnitPrice() * tea.getQuantity();
                            sum = sum + total;
                    %>
                    <tr>
                        <td><%=tea.getTeaId()%> - <%=tea.getName()%></td>
                        <td><%=tea.getUnitPrice()%></td>
                        <td><%=tea.getQuantity()%></td>
                        <td><%=total%></td>
                        <td>
                            <a href="./removeCart.jsp?id=<%=tea.getTeaId()%>" class="badge badge-danger">삭제</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>총액</th>
                        <th><%=sum%></th> <th></th>
                    </tr>
                </tfoot>
            </table>
            
            <a href="./teas.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>