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
<link rel="stylesheet" href="${ path }/css/review/MypageWritableReview.css" />

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
                <a href="${ path }/review/mypageProductReview"><span id="re_writtenReview">작성한 리뷰</span></a>
                <a href="${ path }/review/mypageWritableReview"><span id="re_writableReview">작성 가능한 리뷰</span></a>
                <select name="period" id="re_periodDropBox">
                    <option value="">기간</option>
                    <option value="3">3개월</option>
                    <option value="6">6개월</option>
                    <option value="12">12개월</option>
                </select>
                <hr />
                <div id="re_mainDiv1">
                    <div id="re_review1">
                        <div id="re_foodImg">
                            <img src="../img/new_01.jpg" alt="" id="re_foodImg" />
                        </div>
                        <div id="re_reviewInfo">
                            <p id="re_foodName">안동식 순살 찜닭</p>
                            <p id="re_purchaseDate">구매일 : <span>2024.02.13</span></p>
                            <p id="re_companyName">업체이름</p>
                        </div>
                        <div id="re_reviewBtnDiv">
                            <!-- 취소 누르면 뒤로 이동하게끔 해야함. reviewWrite페이지에서 취소 누르면 reviewMain으로 이동함.-->
                            <a href="${ path }/review/reviewWrite"><input class="re_reviewBtn" type="button" value="리뷰쓰기" /></a>
                            <p id="re_reviewEndDate">작성기한 : <span>2024.03.13</span></p>
                        </div>
                    </div>
                </div>
                <div id="re_mainDiv1">
                    <div id="re_review1">
                        <div id="re_foodImg">
                            <img src="../img/new_01.jpg" alt="" id="re_foodImg" />
                        </div>
                        <div id="re_reviewInfo">
                            <p id="re_foodName">안동식 순살 찜닭</p>
                            <p id="re_purchaseDate">구매일 : <span>2024.02.13</span></p>
                            <p id="re_companyName">업체이름</p>
                        </div>
                        <div id="re_reviewBtnDiv">
                            <input class="re_reviewBtn" type="button" value="리뷰쓰기" />
                            <p id="re_reviewEndDate">작성기한 : <span>2024.03.13</span></p>
                        </div>
                    </div>
                </div>
                <div id="re_mainDiv1">
                    <div id="re_review1">
                        <div id="re_foodImg">
                            <img src="../img/new_01.jpg" alt="" id="re_foodImg" />
                        </div>
                        <div id="re_reviewInfo">
                            <p id="re_foodName">안동식 순살 찜닭</p>
                            <p id="re_purchaseDate">구매일 : <span>2024.02.13</span></p>
                            <p id="re_companyName">업체이름</p>
                        </div>
                        <div id="re_reviewBtnDiv">
                            <input class="re_reviewBtn" type="button" value="리뷰쓰기" />
                            <p id="re_reviewEndDate">작성기한 : <span>2024.03.13</span></p>
                        </div>
                    </div>
                </div>
                <div id="re_mainDiv1">
                    <div id="re_review1">
                        <div id="re_foodImg">
                            <img src="../img/new_01.jpg" alt="" id="re_foodImg" />
                        </div>
                        <div id="re_reviewInfo">
                            <p id="re_foodName">안동식 순살 찜닭</p>
                            <p id="re_purchaseDate">구매일 : <span>2024.02.13</span></p>
                            <p id="re_companyName">업체이름</p>
                        </div>
                        <div id="re_reviewBtnDiv">
                            <input class="re_reviewBtn" type="button" value="리뷰쓰기" />
                            <p id="re_reviewEndDate">작성기한 : <span>2024.03.13</span></p>
                        </div>
                    </div>
                </div>
                <div id="re_bottomPageNumbers">
                    <span>&lt;</span>
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>5</span>
                    <span>&gt;</span>
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