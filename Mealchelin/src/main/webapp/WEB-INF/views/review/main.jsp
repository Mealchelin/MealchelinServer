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
<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/review/reviewMain.css" />
<link rel="stylesheet"
	href="${ path }/css/cscenter/cscenterListCommon.css">

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
			<div id="re_reviewBtnDiv">
				<a href="${ path }/mypage/writableReview"><input
					id="re_reviewBtn" type="button" value="리뷰 작성" /></a>
			</div>

			<div class="mainDiv">
				<c:forEach var="review" items="${ list }">
					<a
						href="${ path }/review/reviewDetail?reviewNo=${ review.reviewNo }">
						<div class="re_imgDiv">
							<img class="re_img" src="../img/new_01.jpg" alt="" />
							<div class="re_innerimgDiv">
								<p class="re_foodName">안동식 순살 찜닭</p>
								<p class="re_brandName">마이셰프</p>
								<br> <br>
								<p class="re_reviewTitle">${ review.name }</p>
								<br>
								<p class="re_reviewContent">${ review.content }</p>
								<br>
								<c:choose>
									<c:when test="${ review.rated == 1}">
										<span class="starR"><span id="re_star">★</span>★★★★</span>
									</c:when>
									<c:when test="${ review.rated  == 2 }">
										<span class="starR"><span id="re_star">★★</span>★★★</span>
									</c:when>
									<c:when test="${ review.rated  == 3}">
										<span class="starR"><span id="re_star">★★★</span>★★</span>
									</c:when>
									<c:when test="${ review.rated  == 4}">
										<span class="starR"><span id="re_star">★★★★</span>★</span>
									</c:when>
									<c:when test="${ review.rated  == 5}">
										<span class="starR"><span id="re_star">★★★★★</span></span>
									</c:when>
									<c:otherwise> 
											<span class="starR"><span class="starR">★</span>★★★★</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>
		<section id="cs-section3">
			<div class="cs-paging">
				<button
					onclick="location.href='${ path }/review/main?page=${ pageInfo.prevPage }'">&lt;</button>
				<c:forEach var="current" begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">
							<button disabled>${ current }</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='${ path }/review/main?page=${ current }'">${ current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<button
					onclick="location.href='${ path }/review/main?page=${ pageInfo.nextPage }'">&gt;</button>
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