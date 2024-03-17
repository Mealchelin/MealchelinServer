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
			<h3>리뷰 작성</h3>
            <div id="re_maindiv">
                <form action="${ path }/review/reviewAddComplete" method="post" enctype="multipart/form-data">
                    <div id="re_innerdivMain">
                        <img id="re_img" src="../img/product/${ memberProdutOrderList.image }" alt="">
                        <div id="re_foodInfo">
                            <p id="re_foodName">${ memberProdutOrderList.productName }</p>
                            <p id="re_memberName">${ memberProdutOrderList.memberId }</p>
                            <input type="hidden" name="prdNo" value="${ memberProdutOrderList.prdNo }">
                            <div name="rated" class="re_star">
                                <span name="rated" data-value="1" class="starR">★</span>
                                <span name="rated" data-value="2" class="starR">★</span>
                                <span name="rated" data-value="3" class="starR">★</span>
                                <span name="rated" data-value="4" class="starR">★</span>
                                <span name="rated" data-value="5" class="starR">★</span>
                                <input id="ratedInput" type="hidden" name="rated" value="0" />
                            </div>
                        </div>
                        <p id="re_titleAndDetailReview" >제목</p>
                        <textarea maxlength="30" name="name" id="re_inputTitle" cols="3" rows="1" placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요."></textarea>
                        <p id="re_textCount"><span id="re_nowTextCount1">0</span>/30</p>
                        <p id="re_titleAndDetailReview">상세리뷰</p>
                        <textarea maxlength="300" name="content" id="re_detailReview" cols="30" rows="10"></textarea>
                        <p id="re_textCount"><span id="re_nowTextCount2">0</span>/300</p>
                        <input id="re_imgadd" name="upfile" type="file" accept="image/jpeg,image/png,image/gif" value="사진 첨부">
                        <label id="re_imgAttachBtn" for="re_imgadd">사진 첨부</label>
                        <span id="re_imgSizeMsg">사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 1장까지 첨부 가능합니다.</span>
                        <div id="re_SubmitAndCancelBtn">
                            <input id="re_subMitBtn" type="submit" value="등록">
                            <a href="${ path }/mypage/writableReview"><input id="re_cancelBtn" type="button" value="취소"></a>
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
	
	    <script type="text/javascript" src="${ path }/js/review/reviewWrite.js"></script>
</body>

</html>