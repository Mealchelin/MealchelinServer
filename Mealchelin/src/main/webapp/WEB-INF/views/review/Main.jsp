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
				<a href="../review/reviewWrite.html"><input id="re_reviewBtn"
					type="button" value="리뷰 작성" /></a>
			</div>
			<div class="mainDiv">
				<a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a> <a href="../review/reviewDetail.html">
					<div class="re_imgDiv">
						<img class="re_img" src="../img/new_01.jpg" alt="" />
						<div class="re_innerimgDiv">
							<p class="re_foodName">안동식 순살 찜닭</p>
							<p class="re_brandName">마이셰프</p>
							<br>
							<br>
							<p class="re_reviewTitle">리뷰 제목이 들어갑니다.</p>
							<br>
							<p>제품 2번째 구매인데,만족스럽네요.정말 빠른 배송, 포장상태 모두 만족스럽습니다.</p>
							<br>
							<p class="re_star">★★★★★</p>
						</div>
					</div>
				</a>
			</div>

			<!-- 하단 검색창 -->
			<form action="../review/reviewEmpty.html"></form>

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
</body>

</html>