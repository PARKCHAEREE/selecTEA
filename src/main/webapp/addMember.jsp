<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
<style>
    .bg-brown { background-color: #6f4e37; color: white; }
    .text-brown { color: #6f4e37; }
</style>
<script type="text/javascript">
    function checkForm() {
        if (!document.newMember.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!document.newMember.password.value) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (document.newMember.password.value != document.newMember.password_confirm.value) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">회원 가입</h1>
            <p class="lead" style="margin-top: 20px;">Membership Joining</p>
        </div>
    </div>

    <div class="container py-5">
        <form name="newMember" class="form-horizontal" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">아이디</label>
                <div class="col-sm-3">
                    <input name="id" type="text" class="form-control" placeholder="id">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-3">
                    <input name="password" type="password" class="form-control" placeholder="password">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">비밀번호 확인</label>
                <div class="col-sm-3">
                    <input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">성명</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" placeholder="name">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">성별</label>
                <div class="col-sm-10 d-flex align-items-center">
                    <div class="form-check form-check-inline">
                        <input name="gender" type="radio" value="남" class="form-check-input" id="genderM" checked>
                        <label class="form-check-label" for="genderM">남</label>
                    </div>
                    <div class="form-check form-check-inline ms-3">
                        <input name="gender" type="radio" value="여" class="form-check-input" id="genderF">
                        <label class="form-check-label" for="genderF">여</label>
                    </div>
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">생일</label>
                <div class="col-sm-3">
                    <input name="birth" type="text" class="form-control" placeholder="YYYY/MM/DD">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-5"> <input name="mail" type="text" class="form-control" placeholder="name@example.com">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">전화번호</label>
                <div class="col-sm-3">
                    <input name="phone" type="text" class="form-control" placeholder="010-xxxx-xxxx">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">주소</label>
                <div class="col-sm-8"> <input name="address" type="text" class="form-control" placeholder="주소 입력">
                </div>
            </div>
            
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록"> 
                    <input type="reset" class="btn btn-warning ms-2" value="취소">
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>