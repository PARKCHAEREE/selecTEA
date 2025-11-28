<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500;700&display=swap" rel="stylesheet">

<style>
    body { font-family: 'Noto Serif KR', serif; }

    .jumbotron {
        background-color: #6f4e37 !important; 
        color: white !important;              
        padding-top: 60px !important;         
        padding-bottom: 60px !important;      
        margin-bottom: 50px !important;       
        border-radius: 0 !important;          
    }
    
    
    .jumbotron h1 {
        font-size: 3.5rem !important;
        font-weight: bold !important;
    }
    
    
    .jumbotron p {
        font-size: 1.5rem !important;
        opacity: 0.9;
    }
</style>

<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #5D4037;">
    <div class="container">
        <a class="navbar-brand font-weight-bold" href="./welcome.jsp" style="font-size: 1.5rem;">
            🍵 selecTEA
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="./teas.jsp">상품 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="./addTea.jsp">상품 등록</a></li>
                <li class="nav-item"><a class="nav-link" href="./cart.jsp">장바구니</a></li>
                
                <c:choose>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item"><a class="nav-link" href="./login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="./addMember.jsp">회원가입</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item text-light align-self-center mx-2">
                            [<%= sessionId %>님]
                        </li>
                        <li class="nav-item"><a class="nav-link" href="./logout.jsp">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>