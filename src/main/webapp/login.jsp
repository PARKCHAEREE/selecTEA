<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>로그인</title>
</head>
<body>
    <jsp:include page="menu.jsp" />

        <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">회원 로그인</h1>
            <p class="lead" style="margin-top: 20px;">Membership Login</p>
        </div>
    </div>

    <div class="container col-md-4">
        <div class="text-center mt-5 mb-5">
            <h3 class="form-signin-heading">Please sign in</h3>
            <%
                // 로그인 실패 시 에러 메시지 표시
                String error = request.getParameter("error");
                if (error != null) {
                    out.println("<div class='alert alert-danger'>아이디와 비밀번호를 확인해 주세요</div>");
                }
            %>
            <form class="form-signin" action="processLogin.jsp" method="post">
                <div class="form-group mb-3">
                    
                    <input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
                </div>
                <div class="form-group mb-3">
                    
                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                </div>
                <button class="btn btn-lg btn-success btn-block w-100" type="submit">로그인</button>
            </form>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>