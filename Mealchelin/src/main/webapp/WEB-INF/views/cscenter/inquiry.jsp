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
     <link rel="stylesheet" href="${ path }/css/cscenter/cscenterListCommon.css">
    <link rel="stylesheet" href="${ path }/css/cscenter/inquiryList.css">
    
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
        <!-- 페이지명/페이지 이동버튼 섹션 -->
        <section id="cs-section1">
            <div class="cs-list-header">
                <div class="cs-inquiry-head">    
                    <h3>1:1 문의</h3>
                    <button class="cs-inquiry-writeBtn" onclick="location.href='${ path }/cscenter/inquiryWrite'">문의하기</button>
                </div>
                <div class="cs-list-btns">
                    <button class="cs-notice" onclick="location.href='${ path }/cscenter/notice'">공지사항</button>
                    <button class="cs-faq" onclick="location.href='${ path }/cscenter/faq'">자주 묻는 질문</button>
                    <button class="cs-inquiry active" onclick="location.href='${ path }/cscenter/inquiry'">1:1 문의</button>
                </div>
            </div>
        </section>
        <!-- 실 내용 섹션 -->
        <section id="cs-section2">
            <div class="cs-list-title">
                <div class="cs-inquiry-number">번호</div>
                <div class="cs-inquiry-title">제목</div>
                <div class="cs-inquiry-date">작성일</div>
                <div class="cs-inquiry-answer">답변상태</div>
            </div>
            <ul class="cs-list-ul">
                <li class="cs-list-content">
                    <div class="cs-inquiry-number">205</div>
                    <div class="cs-inquiry-title cs-list-ul-title"><a href="${ path }/cscenter/inquiryView">교환(반품) 진행 시 배송비가 부과 되나요?</a></div>
                    <div class="cs-inquiry-date">2024.11.09</div>
                    <div class="cs-inquiry-answer">대기중</div>
                </li>
                <li class="cs-list-content">
                    <div class="cs-inquiry-number">205</div>
                    <div class="cs-inquiry-title cs-list-ul-title"><a href="${ path }/cscenter/inquiryView">교환(반품) 진행 시 배송비가 부과 되나요?</a></div>
                    <div class="cs-inquiry-date">2024.02.09</div>
                    <div class="cs-inquiry-answer">대기중</div>
                </li>
                <li class="cs-list-content">
                    <div class="cs-inquiry-number">205</div>
                    <div class="cs-inquiry-title cs-list-ul-title"><a href="${ path }/cscenter/inquiryView">교환(반품) 진행 시 배송비가 부과 되나요?</a></div>
                    <div class="cs-inquiry-date">2024.02.09</div>
                    <div class="cs-inquiry-answer">대기중</div>
                </li>
            </ul>
            <!-- 게시글 없을 시 -->
            <!-- <div class="cs-inquiry-not">
                게시글이 없습니다.
            </div> -->
        </section>
        <!-- 페이징 버튼 섹션 -->
        <!-- 게시글 있을 때만 -->
        <section id="cs-section3">
            <div class="cs-paging">
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
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