<!-- jsp 기본틀 지켜줘 -->

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
    <link rel="stylesheet" href="${ path }/css/pay/paySucces.css">
    
    
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
        <section>
            <div id="co_mainDiv">
                <img src="../img/all/logo5.png" alt="로고사진" class="memLogo">
                <p id="co_ment">
                    <span>백성연</span>님의 주문이 완료되었습니다.
                    <!-- <br>
                    <span>내일 아침</span>에 만나요!
                    <br>
                    <p>배송 예정일 : 02월 12일(월)</p> -->
                </p>
                <!-- <div id="co_addressAndOrderNumber">
                    <p id="co_order">서울 동작구 가로수길 109(00아파트) <br> 주문번호 216156146546</p>
                </div> -->
                <hr>
                <div id="co_paymentDiv">
                    <p id="co_paymentText">결제금액</p>
                    <p id="co_paymentMoney">47,500원</p>
                </div>
                <input id="co_goOrderList" type="button" onclick="location.href='/mypage/payInquiry'"  value="주문내역으로 이동">
                <input id="co_goHomeBtn" type="button" onclick="location.href='/'" value="홈으로 이동">
            </div>
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