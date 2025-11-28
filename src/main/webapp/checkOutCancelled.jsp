<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>주문 취소</title>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">주문 취소</h1>
            <p class="lead" style="margin-top: 20px;">Checkout Cancelled</p>
        </div>
    </div>

    <div class="container">
        <h2 class="text-center alert alert-danger">주문이 취소되었습니다.</h2>
        <p class="text-center text-muted">
            장바구니에 담긴 상품은 그대로 유지됩니다.<br>
            언제든지 다시 주문하실 수 있습니다.
        </p>
        
        <div class="text-center mt-5">
             <a href="./teas.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
             <a href="./cart.jsp" class="btn btn-success"> 장바구니 가기 &raquo;</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>