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
<link rel="stylesheet" href="${ path }/css/review/reviewEdit.css">
<link rel="stylesheet" href="${ path }/css/review/reviewWrite.css">
<link rel="stylesheet" href="${ path }/css/review/reviewDetail.css">

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
			<h3>밀슐랭 상품 리뷰</h3>
            <div id="re_maindiv">
                <div id="re_innerdivMain">
                    <img id="re_img" src="../img/new_01.jpg" alt="">
                    <div id="re_foodInfo">
                        <p id="re_foodName">안동식 순살 찜닭</p>
                        <p class="re_star"><span id="re_star4" >★★★★★</span></p>
                    </div>
                    <br>
                    <p id="re_titleAndDetailReview" >제목</p>
                    <p id="re_titleContent" >제품 2번째 구매인데... 만족스럽네요</p>
                    <p id="re_titleAndDetailReview">상세리뷰</p>
                    <p id="re_detailReviewContent" >정말 빠른 배송, 포장상태, 맛 다 만족입니다. 식감, 퀄리티 모두 좋아요</p>
                    <div id="re_SubmitAndCancelBtn">
                        <a href="${ path }/review/main"><input id="re_goToListBtn"  type="button" value="목록"></a>
                    </div>
                </div>
            </div>
		</section>
	</main>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="./../layout/footer.jsp" />
	</footer>

	<!-- 필요한 js 밑에 추가-->
	<script type="text/javascript" src="${ path }/js/index.js"></script>
	
    <script type="text/javascript" src="${ path }/js/main.js"></script>
</body>

</html>