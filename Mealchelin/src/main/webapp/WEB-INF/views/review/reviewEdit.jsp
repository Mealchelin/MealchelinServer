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
			<h3>리뷰 수정</h3>
            <div id="re_maindiv">
                <form action="${ path }/review/reviewEditComplete" method="get">
                    <div id="re_innerdivMain">
                        <img id="re_img" src="../img/new_01.jpg" alt="">
                        <div id="re_foodInfo">
                            <p id="re_foodName">안동식 순살 찜닭</p>
                            <!-- 하기 re_emptySpace는 상품선택 버튼이 사라진 공간을 채우기 위해 사용함. -->
                            <p id="re_emptySpace" ></p>
                            <!-- <input id="re_productSelectBtn" type="button" value="상품 선택"> -->
                            <div class="re_star">
                                <!-- 편의 상 가장 첫번째의 별은 기본으로 class="on"이 되게 설정해주었습니다. -->
                                <span data-value="1" class="starR on">★</span>
                                <span data-value="2" class="starR">★</span>
                                <span data-value="3" class="starR">★</span>
                                <span data-value="4" class="starR">★</span>
                                <span data-value="5" class="starR">★</span>
                            </div>
                        </div>
                        <br>
                        <p id="re_titleAndDetailReview" >제목</p>
                        <textarea maxlength="30" id="re_titleContent" >제품 2번째 구매인데... 만족스럽네요</textarea>
                        <p id="re_titleAndDetailReview">상세리뷰</p>
                        <textarea maxlength="300" id="re_detailReviewContent" >정말 빠른 배송, 포장상태, 맛 다 만족입니다. 식감, 퀄리티 모두 좋아요</textarea>
                        <p id="re_textCount"><span id="re_nowTextCount">0</span>/300</p>
                        <!-- <input id="re_imgAttachBtn" type="button" value="사진 첨부"> -->
                        <input id="re_imgadd" type="file" accept="image/jpeg,image/png,image/gif" value="사진 첨부">
                        <label id="re_imgAttachBtn" for="re_imgadd">사진 첨부</label>
                        <span id="re_imgSizeMsg">안동찜닭.jpg</span>
                        <div id="re_SubmitAndCancelBtn">
                            <input id="re_subMitBtn" type="submit" value="수정">
                            <a href="${ path }/review/mypageProductReview"><input id="re_cancelBtn" type="button" value="취소"></a>
                        </div>
                    </div>
                </form>
            </div>
		</section>
	</main>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="./../layout/footer.jsp" />
	</footer>

	<!-- 필요한 js 밑에 추가-->
	<script type="text/javascript" src="${ path }/js/index.js"></script>
	
 	<script type="text/javascript" src="../js/review/reviewWrite.js"></script>
</body>

</html>