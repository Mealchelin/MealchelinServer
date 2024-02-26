<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>밀슐랭</title>
<!--default css-->
<link rel="stylesheet" href="${ path }/css/common.css">
<link rel="stylesheet" href="${ path }/css/review/reviewMain.css" />
<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/review/MypageWritableReviewEmpty.css">

<!-- jquery -->
<script src="${ path }/js/jquery-3.7.1.js"></script>
</head>

<body>
	<!-- 플로팅 배너(TOP버튼)-->
	<div class="top" id="topBtn"></div>

	<!-- 네비게이션 헤더 -->
	<header id="header">
		<jsp:include page="./../layout/header.jsp" />
	</header>

	<!-- 내용 넣기 -->
	<main>
		<section>
			<h3>나의 리뷰</h3>
            <a href="./MypageWrittenReviewEmpty.html"><span id="re_writtenReview" >작성한 리뷰</span></a>
            <a href="./MypageWritableReviewEmpty.html"><span id="re_writableReview" >작성 가능한 리뷰</span></a>
            <select name="period" id="re_periodDropBox">
                <option value="">기간</option>
                <option value="3">3개월</option>
                <option value="6">6개월</option>
                <option value="12">12개월</option>
            </select>
            <hr>
            <p id="re_emptyReview">작성 가능한 구매후기가 없습니다.</p>
		</section>
	</main>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="./../layout/footer.jsp" />
	</footer>

	<!-- 필요한 js 밑에 추가-->
	<script type="text/javascript" src="${ path }/js/index.js"></script>
	
	<script type="text/javascript" src="${ path }/js/review/reviewWrite.js"></script>
</body>

</html>