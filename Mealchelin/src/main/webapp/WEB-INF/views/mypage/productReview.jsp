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
<link rel="stylesheet"
	href="${ path }/css/review/MypageProductReview.css" />
<link rel="stylesheet"
	href="${ path }/css/review/MypageWrittenReviewEmpty.css">
<link rel="stylesheet" href="${ path }/css/mypage/mypageHeaderBox.css">

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
		<jsp:include page="./../mypage/mypageHeaderBox.jsp" />
		<section>
			<h3>나의 리뷰</h3>
			<a href="${ path }/mypage/productReview"><span id="re_writtenReview">작성한 리뷰</span></a>
            <a href="${ path }/mypage/writableReview"><span id="re_writableReview">작성 가능한 리뷰</span></a>
			<select name="period"
				id="re_periodDropBox">
				<option value="">기간</option>
				<option value="3">3개월</option>
				<option value="6">6개월</option>
				<option value="12">12개월</option>
			</select>
			<hr />

			<c:if test="${ empty list }">
				<p id="re_emptyReview">작성한 구매후기가 없습니다.</p>
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="review" items="${ list }">
					<div id="re_mainDiv1">
						<div id="re_review1">
							<a href="./reviewDetail.html">
								<div id="re_foodImgAndName">
									<img src="../img/new_01.jpg" alt="" id="re_foodImg" />
								</div>
								<div id="re_reviewInfo">
									<p id="re_foodName">안동식 순살 찜닭(제목을 이미지 밑에말고 이렇게 하는게 더 나은 거
										같습니다.)</p>
									<p id="re_reviewTitle">${ review.name }</p>
									<p id="re_reviewContent">${ review.content }</p>

									<c:choose>
										<c:when test="${ review.rated == 0}">
											<span class="starR">★★★★★</span>
										</c:when>
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
											<span class="starR">실행되지 않을 코드입니다.</span> 
										</c:otherwise>
									</c:choose>
								</div>
							</a>
							<div id="re_editDeleteBtn">
								<p id="re_companyName">업체이름</p>
								<input class="re_deleteAndEditBtn" type="button" value="삭제하기" />
								<br /> <a href="${ path }/review/reviewEdit "><input
									class="re_deleteAndEditBtn" type="button" value="수정하기" /></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>

				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='${ path }/board/list?page=${ pageInfo.prevPage }'">&lt;</button>

				<!--  10개 페이지 목록 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">
							<button disabled>${ current }</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='${ path }/board/list?page=${ current }'">${ current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>

				<!-- 맨 끝으로 -->
				<button
					onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>

			<div id="re_bottomPageNumbers">
				<span>&lt;</span> <span>1</span> <span>2</span> <span>3</span> <span>4</span>
				<span>5</span> <span>&gt;</span>
			</div>
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