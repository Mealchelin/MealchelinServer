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
    <link rel="stylesheet" href="${ path }/css/cscenter/inquiryView.css">
    
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
        <!-- 카테고리 -->
        <section id="cs-section1">
            <h3>1:1 문의</h3>
        </section>

        <!-- 제목, 내용, 답변 -->
        <!-- textarea 개행문자: &#10;  -->
        <section id="cs-section2">
            <div class="cs-inquiry-wrap">
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">제목</div>
                    <div class="cs-inquiry-title">${ inquiry.iname }</div>
                </div>
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">내용</div>
                    <div class="cs-inquiry-text">${ inquiry.inquiryContent }</div>
                </div>
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">답변</div>
                    <div class="cs-inquiry-text">${ inquiry.answerContent }</div>
                </div>
            </div>
        </section>

        <!-- 버튼 -->
        <section id="cs-section3">
            <button class="cs-location-to-list" onclick="location.href='${ path }/cscenter/inquiry'">목록</button>
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