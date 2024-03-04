<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
	<title>밀슐랭</title>
    <!--default css-->
    <link rel="stylesheet" href="${ path }/css/common.css">
    <!-- 필요한 css -->
    <link rel="stylesheet" href="${ path }/css/cscenter/noticeView.css">
    
    <!-- jquery -->
    <script src="${ path }/js/jquery-3.7.1.js"></script>
</head>

<body>
	<!-- 플로팅 배너(TOP버튼)-->
    <div class="top" id="topBtn">
    </div>
    
    <!-- 네비게이션 헤더 -->
    <header id="header">
    	<jsp:include page="./../layout/header.jsp" />
    </header>
    
    <!-- 내용 넣기 -->
    <main>
        <!-- 카테고리, 제목, 작성자, 작성일 -->
        <section id="cs-section1">
            <h3>공지사항</h3>
            <div class="cs-notice-head">
                <div class="cs-notice-top">
                    <div class="cs-notice-column">제목</div>
<<<<<<< HEAD
                    <div class="cs-notice-data">${ support.sname }</div>
                </div>
                <div class="cs-notice-top">
                    <div class="cs-notice-column">작성자</div>
                    <div class="cs-notice-data">${ support.mname }</div>
                </div>
                <div class="cs-notice-top">
                    <div class="cs-notice-column">작성일</div>
                    <div class="cs-notice-data"><fmt:formatDate value="${ support.rgstrDate }" pattern="yyyy.MM.dd"/></div>
=======
                    <div class="cs-notice-data">밀슐랭 회원님들에게</div>
                </div>
                <div class="cs-notice-top">
                    <div class="cs-notice-column">작성자</div>
                    <div class="cs-notice-data">밀슐랭</div>
                </div>
                <div class="cs-notice-top">
                    <div class="cs-notice-column">작성일</div>
                    <div class="cs-notice-data">2024.02.09</div>
>>>>>>> origin/feature/pay_sy
                </div>
            </div>
        </section>

        <!-- 내용 -->
        <section id="cs-section2">
            <div class="cs-notice-content">
<<<<<<< HEAD
                ${ support.content }
=======
                안녕하세요, 밀슐랭 회원 여러분!
                <br><br>
                우리 사이트에 오신 것을 환영합니다. 이 공지사항을 통해 여러분께 중요한 소식과 정보를 알려드리고자 합니다.
                <br><br>
                1. 신규 상품 출시: 우리는 항상 고객님들의 다양한 요구와 취향을 고려하여 새로운 밀키트 상품을 출시하고 있습니다. 매주 새로운 메뉴와 특별한 프로모션을 확인해보세요!
                <br>
                2. 할인 이벤트 안내: 다양한 이벤트와 할인 혜택을 통해 고객님들에게 더욱 특별한 혜택을 제공하고자 합니다. 할인 코드나 이벤트 참여 방법에 대한 자세한 내용은 홈페이지를 확인해주세요.
                <br>
                3. 배송 안내: 주문하신 상품은 최대한 신속하고 안전하게 배송됩니다. 배송 관련 문의사항이나 요청 사항이 있으시면 언제든지 고객센터로 연락주세요.
                <br>
                4. 리뷰 이벤트: 고객님들의 소중한 의견을 더욱 활용하기 위해 리뷰 이벤트를 진행하고 있습니다. 리뷰를 작성하시면 특별한 혜택을 제공해드립니다. 많은 참여 부탁드립니다.
                <br>
                5. 고객센터 안내: 언제든지 고객센터로 문의나 불편사항을 남겨주시면 최선을 다해 도와드리겠습니다. 우리 사이트를 이용하시는 동안 불편함이 없도록 최선을 다하겠습니다.
                <br><br>
                감사합니다. 여러분의 많은 이용과 관심 부탁드립니다.
                <br><br>
                밀슐랭 운영자 일동
>>>>>>> origin/feature/pay_sy
            </div>
        </section>

        <!-- 버튼 -->
        <section id="cs-section3">
            <button class="cs-location-to-list" onclick="location.href='${ path }/cscenter/notice'">목록</button>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
</body>

</html>