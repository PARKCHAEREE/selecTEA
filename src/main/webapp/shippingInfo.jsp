<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>배송 정보 입력</title>
<style>
    .btn-brown { background-color: #6f4e37; color: white; border: none; }
    .btn-brown:hover { background-color: #5a3e2b; color: white; }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">배송 정보</h1>
            <p class="lead" style="margin-top: 20px;">Shipping Information</p>
        </div>
    </div>

    <div class="container">
        <form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
            <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">

            <div class="form-group row">
                <label class="col-sm-2">성명</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" placeholder="받으시는 분 성함" required>
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2">배송일</label>
                <div class="col-sm-3">
                    <input name="shippingDate" type="date" class="form-control" required>
                </div>
                <div class="col-sm-2 text-muted" style="padding-top:7px;">(yyyy/mm/dd)</div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2">국가명</label>
                <div class="col-sm-3">
                    <input name="country" type="text" class="form-control" value="Korea">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2">우편번호</label>
                <div class="col-sm-3">
                    <input name="zipCode" type="text" class="form-control">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2">주소</label>
                <div class="col-sm-5">
                    <input name="addressName" type="text" class="form-control" placeholder="상세 주소를 입력하세요">
                </div>
            </div>

            <div class="form-group row mt-5">
                <div class="col-sm-offset-2 col-sm-10">
                    <a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
                    <input type="submit" class="btn btn-brown" value="등록" />
                    <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
                </div>
            </div>
        </form>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>