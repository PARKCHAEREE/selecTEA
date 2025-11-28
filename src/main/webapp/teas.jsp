<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>Tea Collections</title>
<style>
    .card-img-top {
        width: 100%;
        height: 250px; 
        object-fit: cover; 
    }
 
    .text-truncate-multiline {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        height: 3em; 
    }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="jumbotron text-center" style="background-color:#8d6e63; color:white;">
        <div class="container">
            <h1 class="display-3">selecTEA Collections</h1>
            <p class="lead">전 세계의 프리미엄 티를 만나보세요.</p>
        </div>
    </div>

    <%@ include file="dbconn.jsp" %>

    <div class="container py-5">
        <div class="row">
            <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                // 1. 모든 차(Tea) 데이터를 가져오는 쿼리 작성
                String sql = "SELECT * FROM tea";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                // 2. 데이터가 있는지 반복문으로 확인하며 카드 출력
                while (rs.next()) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="./resources/images/<%=rs.getString("t_fileName")%>" class="card-img-top" alt="<%=rs.getString("t_name")%>">
                    
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title"><%=rs.getString("t_name")%></h4>
                        
                        <p class="card-text text-muted text-truncate-multiline"><%=rs.getString("t_description")%></p>
                        
                        <div class="mb-3">
                            <span class="badge bg-success"><%=rs.getString("t_country")%></span>
                            <span class="badge bg-info text-dark"><%=rs.getString("t_category")%></span>
                            <span class="badge bg-secondary"><%=rs.getString("t_packaging")%></span>
                        </div>
                        
                        <div class="mt-auto">
                            <h5 class="text-danger fw-bold"><%=rs.getString("t_unitPrice")%>원</h5>
                            <div class="d-grid">
                                <a href="./tea.jsp?id=<%=rs.getString("t_id")%>" class="btn btn-outline-secondary">
                                    상세 정보 &raquo;
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                } // while문 끝
                
                // 3. 자원 해제 (깔끔하게!)
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            %>
        </div> <hr>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>