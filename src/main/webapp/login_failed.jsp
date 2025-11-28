<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>로그인 실패</title>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron" style="background-color: #d9534f; color: white;">
        <div class="container">
            <h1 class="display-3">로그인 실패</h1>
        </div>
    </div>

    <div class="container text-center py-5">
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">입력하신 정보가 일치하지 않습니다!</h4>
            <p>아이디와 비밀번호를 다시 한 번 확인해 주세요.</p>
        </div>
        <hr>
        <a href="login.jsp" class="btn btn-secondary btn-lg">다시 로그인 하기 &raquo;</a>
        <a href="welcome.jsp" class="btn btn-outline-secondary btn-lg">메인으로 돌아가기 &raquo;</a>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>