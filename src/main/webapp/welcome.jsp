<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date" %>
<html>
<head>
<title>Welcome to selecTEA</title>
<style>
    /* 차(Tea) 느낌이 나는 은은한 배경색 */
    body {
        background-color: #fdfbf7; 
        font-family: 'Arial', sans-serif;
    }
    
    /* 점보트론(배너) 커스텀 스타일 */
    .jumbotron {
        background-color: #6f4e37; /* 짙은 갈색 (홍차 색상) */
        color: white;
        padding: 60px 0;
        margin-bottom: 30px;
        border-radius: 0 0 20px 20px; /* 하단 모서리만 둥글게 */
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    /* 🔥 [핵심] 검은 화면(모달 백드롭) 강제 제거 코드 🔥 */
    .modal-backdrop {
        display: none !important;
        width: 0 !important;
        height: 0 !important;
        position: static !important;
    }
</style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <div class="jumbotron text-center">
        <div class="container">
            <h1 class="display-3">🍵 selecTEA</h1>
            <p class="lead">세계 각국의 프리미엄 티(Tea)를 만나보세요.</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                
                <% 
                    //현재 시간에 따라 인사말과 추천 메뉴 변경
                    Date now = new Date();
                    int hour = now.getHours();
                    String greeting = "";
                    String recommendation = "";

                    if (hour >= 6 && hour < 11) {
                        greeting = "Good Morning ☀️";
                        recommendation = "상쾌한 아침을 깨우는 <b>'잉글리쉬 브렉퍼스트'</b> 어떠세요?";
                    } else if (hour >= 11 && hour < 17) {
                        greeting = "Good Afternoon ☕";
                        recommendation = "나른한 오후, 향긋한 <b>'얼그레이'</b> 한 잔의 여유를 즐겨보세요.";
                    } else {
                        greeting = "Good Evening 🌙";
                        recommendation = "하루를 마무리하는 시간, 카페인 없는 <b>'허브티'</b>를 추천합니다.";
                    }
                %>

                <div class="alert alert-secondary shadow-sm" role="alert" style="border-left: 5px solid #6f4e37;">
                    <h4 class="alert-heading"><%= greeting %></h4>
                    <hr>
                    <p class="mb-0" style="font-size: 1.2rem;"><%= recommendation %></p>
                    <p class="text-muted mt-2" style="font-size: 0.9rem;">
                        현재 서버 시간: <%= String.format("%tF %tT", now, now) %>
                    </p>
                </div>

                <div class="mt-5">
                    <a href="./teas.jsp" class="btn btn-lg btn-outline-dark" style="border-width: 2px;">
                        상품 둘러보기 &raquo;
                    </a>
                </div>

            </div>
        </div>
        <hr class="my-5">
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>