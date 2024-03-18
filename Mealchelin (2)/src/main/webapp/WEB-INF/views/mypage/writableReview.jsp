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
<link rel="stylesheet"href="${ path }/css/mypage/mypageHeaderBox.css">
<link rel="stylesheet"href="${ path }/css/review/reviewWrite.css">
<link rel="stylesheet"href="${ path }/css/cscenter/cscenterListCommon.css">

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
			<h3 class="re_headerName">나의 리뷰</h3>
                <a href="${ path }/mypage/mypageProductReview"><span id="re_writtenReview">작성한 리뷰</span></a>
                <a href="${ path }/mypage/writableReview"><span id="re_writableReview">작성 가능한 리뷰</span></a>
                <hr />
                
                <c:if test="${ empty list }">
					<p id="re_emptyReview">작성한 가능한 리뷰가 없습니다.</p>
				</c:if>
				
				<c:if test="${ not empty list }">
				<c:forEach var="memberProdutOrderList" items="${ list }">
                <div id="re_mainDiv1">
                    <div id="re_review1">
                        <div id="re_foodImg">
                            <img src="../img/product/${ memberProdutOrderList.image }" alt="" id="re_foodImg" />
                        </div>
                        <div id="re_reviewInfo">
                            <p id="re_foodName">${ memberProdutOrderList.productName }</p>
                            <p id="re_purchaseDate">구매일 : <span>${ memberProdutOrderList.orderDate }</span></p>
                            <p id="re_companyName">${ memberProdutOrderList.brand }</p>
                        </div>
                        <div id="re_reviewBtnDiv">
                            <!-- 취소 누르면 뒤로 이동하게끔 해야함. reviewWrite페이지에서 취소 누르면 reviewMain으로 이동함.-->
                            <a href="${ path }/review/reviewWrite?orderNo=${ memberProdutOrderList.orderNo }&prdNo=${ memberProdutOrderList.prdNo }"><input class="re_reviewBtn" type="button" value="리뷰쓰기" /></a>
                            <p id="re_reviewEndDate">작성기한 : <span>${ memberProdutOrderList.reviewAndDate }</span></p>
                        </div>
                    </div>
                </div>
                </c:forEach>
			</c:if>
		</section>
		<c:if test="${ not empty list }">
	      <section id="cs-section3">
	         <div class="cs-paging">
	            <button
	               onclick="location.href='${ path }/mypage/writableReview?page=${ pageInfo.prevPage }'">&lt;</button>
	            <c:forEach var="current" begin="${ pageInfo.startPage }"
	               end="${ pageInfo.endPage }">
	               <c:choose>
	                  <c:when test="${ current == pageInfo.currentPage }">
	                     <button disabled>${ current }</button>
	                  </c:when>
	                  <c:otherwise>
	                     <button
	                        onclick="location.href='${ path }/mypage/writableReview?page=${ current }'">${ current }</button>
	                  </c:otherwise>
	               </c:choose>
	            </c:forEach>
	            <button
	               onclick="location.href='${ path }/mypage/writableReview?page=${ pageInfo.nextPage }'">&gt;</button>
	         </div>
	      </section>
      	</c:if>
		
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