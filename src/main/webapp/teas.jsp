<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Tea"%>
<%@ page import="dao.TeaRepository"%>
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
    
    <div class="container py-5">
        <div class="row">
            <%
                TeaRepository dao = TeaRepository.getInstance();
                
                ArrayList<Tea> listOfTeas = dao.getAllTeas();
                
                for (int i = 0; i < listOfTeas.size(); i++) {
                    Tea tea = listOfTeas.get(i);
            %>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="./resources/images/<%=tea.getFilename()%>" class="card-img-top" alt="<%=tea.getName()%>">
                    
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title"><%=tea.getName()%></h4>
                        
                        <p class="card-text text-muted text-truncate-multiline"><%=tea.getDescription()%></p>
                        
                        <div class="mb-3">
                            <span class="badge bg-success"><%=tea.getCountry()%></span>
                            <span class="badge bg-info text-dark"><%=tea.getCategory()%></span>
                            <span class="badge bg-secondary"><%=tea.getPackaging()%></span>
                        </div>
                        
                        <div class="mt-auto">
                            <h5 class="text-danger fw-bold"><%=tea.getUnitPrice()%>원</h5>
                            <div class="d-grid">
                                <a href="./tea.jsp?id=<%=tea.getTeaId()%>" class="btn btn-outline-secondary">
                                    상세 정보 &raquo;
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                } 
            %>
        </div> <hr>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>