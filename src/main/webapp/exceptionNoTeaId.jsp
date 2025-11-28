<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>상품 없음</title>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron">
        <div class="container">
            <h2 class="display-4">해당 상품이 존재하지 않습니다.</h2>
        </div>
    </div>

    <div class="container">
        <p>
            요청하신 상품의 아이디(ID)를 찾을 수 없습니다.<br>
            상품 목록 페이지로 이동하여 다른 상품을 찾아보세요.
        </p>
        <p>
            <a href="teas.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
        </p>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>