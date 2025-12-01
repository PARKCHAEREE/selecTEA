🍵 selecTEA - 세계 각국의 프리미엄 티(Tea) 쇼핑몰

1. 프로젝트 개요
JSP와 Servlet을 활용하여 구축한 프리미엄 차 판매 웹 쇼핑몰입니다.
기존 북마켓(BookMarket) 실습을 응용하여, 시간대별 추천 시스템과 다국어 처리, 실제 파일 업로드 기능 등을 추가 구현하였습니다.

2. 개발 환경 (Tech Stack)
* OS: Windows 10 / macOS
* Web Server:Apache Tomcat 10.1 (Jakarta EE 규격)
* Language:Java (JDK 17 이상 권장), JSP, HTML5, CSS3, JavaScript
* Database: MySQL 8.0
* Library:
    * Jakarta Standard Tag Library (JSTL) 2.0
    * MySQL Connector/J 8.0.33
    * cos.jar (파일 업로드)
    * Bootstrap 5.3

 3. 주요 기능
* 메인: 접속 시간(아침/오후/저녁)에 따른 동적 인사말 및 메뉴 추천
* 상품: 상품 목록 조회, 상세 보기, 상품 등록(이미지 업로드 포함, 유효성 검사)
* 회원: 로그인/로그아웃 (세션 관리), 회원가입
* 주문: 장바구니 담기, 주문 정보 입력, 주문 완료 프로세스
* 기타: 다국어(한국어/영어) 지원

4. 실행 방법 (Installation & Run)

4-1. 데이터베이스 설정
MySQL에 접속하여 `selecteaDB` 스키마를 생성하고, 제공된 SQL 파일을 순서대로 실행합니다.

1.  DB 생성:`CREATE DATABASE selecteaDB;`
2.  테이블 생성 및 기초 데이터 입력:
    * `/resources/sql/member.sql` 실행 (회원 테이블 및 관리자 계정)
    * `/resources/sql/tea.sql` 실행 (상품 테이블 및 초기 상품 데이터)
      
4-2. 프로젝트 설정 (Eclipse)
1.  Eclipse IDE 실행 후 `Import` -> `Existing Projects into Workspace` 선택
2.  `selecTEA` 폴더 선택하여 import
3.  DB 연결 정보 확인:
    * `src/main/java/dao/TeaRepository.java`
    * `src/main/webapp/dbconn.jsp`
    * 위 파일들에서 본인의 MySQL `root` 비밀번호가 맞는지 확인 및 수정 (기본 설정: `root` / `1234`)

4-3. 서버 실행
1.  Tomcat 10.1 서버에 프로젝트를 Add 합니다.
2.  서버 시작 후 브라우저에서 `http://localhost:8080/selecTEA/welcome.jsp` 접속

5. 테스트 계정 정보
* 관리자 아이디: `admin`
* 관리자 비밀번호: `1234`
