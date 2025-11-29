<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>
<%@ page errorPage="exceptionNoTeaId.jsp"%>

<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
    function addToCart() {
        var msg = document.addForm.messageCard.value;
        if (msg.length > 100) {
            alert("선물 메시지는 100자 이내로 작성해주세요.");
            document.addForm.messageCard.focus();
            return;
        }

        if (confirm("해당 상품을 장바구니에 담으시겠습니까?")) {
            document.addForm.submit();
        } else {
            document.addForm.reset();
        }
    }
</script>
<style>
    .bg-brown { background-color: #6f4e37; color: white; }
    .text-brown { color: #6f4e37; }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3">상품 상세 정보</h1>
            <p class="lead" style="margin-top: 20px;">Product details</p>
        </div>
    </div>

    <div class="container py-5">
        <%
            String id = request.getParameter("id");
            
            TeaRepository dao = TeaRepository.getInstance();
            Tea tea = dao.getTeaById(id);

            if (tea != null) {
                
                // (쿠키 설정) 최근 본 상품 이름 저장
                Cookie recentCookie = new Cookie("recentTea", URLEncoder.encode(tea.getName(), "utf-8"));
                recentCookie.setMaxAge(24 * 60 * 60); // 1일 유지
                recentCookie.setPath("/"); 
                response.addCookie(recentCookie);
        %>
        <div class="row">
            <div class="col-md-5">
                <img src="./resources/images/<%=tea.getFilename()%>" style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
            </div>

            <div class="col-md-6">
                <h2 class="mb-3"><%=tea.getName()%></h2>
                <p class="text-muted lead"><%=tea.getDescription()%></p>
                
                <p>
                    <b>상품 코드 : </b> <span class="badge bg-danger"><%=tea.getTeaId()%></span>
                </p>
                <p>
                    <b>원산지 : </b> <span class="badge bg-success badge-custom"><%=tea.getCountry()%></span>
                </p>
                <p>
                    <b>분류 : </b> <span class="badge bg-info text-dark badge-custom"><%=tea.getCategory()%></span>
                </p>
                <p>
                    <b>포장 타입 : </b> <%=tea.getPackaging()%>
                </p>
                <p>
                    <b>재고 수 : </b> <%=tea.getUnitsInStock()%>개
                </p>
                <h3 class="text-danger my-4"><%=tea.getUnitPrice()%>원</h3>
                
                <hr>

                <form name="addForm" action="./addCart.jsp?id=<%=tea.getTeaId()%>" method="post">
                    
                    <div class="mb-3">
                        <label for="messageCard" class="form-label">💌 <b>선물 메시지 카드 (Option)</b></label>
                        <textarea name="messageCard" id="messageCard" class="form-control" rows="3" placeholder="소중한 분께 전할 메시지를 입력하세요 (100자 이내)"></textarea>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-block">
                        <a href="#" class="btn btn-info btn-lg" onclick="addToCart()"> 상품 주문 &raquo;</a> 
                        <a href="./cart.jsp" class="btn btn-warning btn-lg"> 장바구니 &raquo;</a> 
                        <a href="./teas.jsp" class="btn btn-secondary btn-lg"> 상품 목록 &raquo;</a>
                    </div>
                </form>
            </div>
        </div>
        <%
            } 
        %>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>