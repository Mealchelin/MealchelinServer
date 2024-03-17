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
                    <img id="re_img" src="../img/review/${ review.renamedFilename }" alt="">
                    <div id="re_foodInfo">
                        <p id="re_foodName">${ review.productName }</p>
                        
                        <c:choose>
                        	<c:when test="${ review.rated == 0}">
								<p class="starR"><span id="re_star" ></span>★★★★★</p>
							</c:when>
							<c:when test="${ review.rated == 1}">
								<p class="starR"><span id="re_star" >★</span>★★★★</p>
							</c:when>
							<c:when test="${ review.rated == 2}">
								<p class="starR"><span id="re_star" >★★</span>★★★</p>
							</c:when>
							<c:when test="${ review.rated == 3}">
								<p class="starR"><span id="re_star" >★★★</span>★★</p>
							</c:when>
							<c:when test="${ review.rated == 4}">
								<p class="starR"><span id="re_star" >★★★★</span>★</p>
							</c:when>
							<c:when test="${ review.rated == 5}">
								<p class="starR"><span id="re_star" >★★★★★</span></p>
							</c:when>
                        	<c:otherwise> 
								<p class="re_star"><span id="re_star4" >실행되지 않을 코드</span></p>
							</c:otherwise>
                        </c:choose>
                    </div>
                    <br>
                    <p id="re_titleAndDetailReview" >제목</p>
                    <textarea maxlength="30" name="name" id="re_titleContent" cols="3" rows="1" readonly>${ review.name }</textarea>
                    <p id="re_titleAndDetailReview">상세리뷰</p>
                    <textarea maxlength="300" name="content" id="re_detailReviewContent" cols="30" rows="10" readonly>${ review.content }</textarea>
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