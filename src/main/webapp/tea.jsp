<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page errorPage="exceptionNoTeaId.jsp"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    <%@ include file="dbconn.jsp" %>

    <div class="container py-5">
        <%
            String id = request.getParameter("id");
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            // 1. DB에서 해당 ID의 상품 조회 (t_id 사용)
            String sql = "SELECT * FROM tea WHERE t_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            // 2. 데이터가 있으면 화면에 출력
            if (rs.next()) {
                
                // (쿠키 설정) 최근 본 상품 이름 저장
                // DB에서 가져온 t_name을 사용합니다.
                Cookie recentCookie = new Cookie("recentTea", URLEncoder.encode(rs.getString("t_name"), "utf-8"));
                recentCookie.setMaxAge(24 * 60 * 60); // 1일 유지
                recentCookie.setPath("/"); 
                response.addCookie(recentCookie);
        %>
        <div class="row">
            <div class="col-md-5">
                <img src="./resources/images/<%=rs.getString("t_fileName")%>" style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
            </div>

            <div class="col-md-6">
                <h2 class="mb-3"><%=rs.getString("t_name")%></h2>
                <p class="text-muted lead"><%=rs.getString("t_description")%></p>
                
                <p>
                    <b>상품 코드 : </b> <span class="badge bg-danger"><%=rs.getString("t_id")%></span>
                </p>
                <p>
                    <b>원산지 : </b> <span class="badge bg-success badge-custom"><%=rs.getString("t_country")%></span>
                </p>
                <p>
                    <b>분류 : </b> <span class="badge bg-info text-dark badge-custom"><%=rs.getString("t_category")%></span>
                </p>
                <p>
                    <b>포장 타입 : </b> <%=rs.getString("t_packaging")%>
                </p>
                <p>
                    <b>재고 수 : </b> <%=rs.getString("t_unitsInStock")%>개
                </p>
                <h3 class="text-danger my-4"><%=rs.getString("t_unitPrice")%>원</h3>
                
                <hr>

                <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("t_id")%>" method="post">
                    
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
            } // if(rs.next()) 끝
            
            // 3. 자원 해제
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        %>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>