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
                <form action="${ path }/review/reviewEditComplete" method="post" enctype="multipart/form-data">
                    <div id="re_innerdivMain">
                        <img id="re_img" src="../img/product/${ review.productimage }" alt="">
                        <div id="re_foodInfo">
                            <p id="re_foodName">${ review.productName }</p>
                            <c:choose>
                            	<c:when test="${ review.rated == 0}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR">★</span>
		                                <span name="rated" data-value="2" class="starR">★</span>
		                                <span name="rated" data-value="3" class="starR">★</span>
		                                <span name="rated" data-value="4" class="starR">★</span>
		                                <span name="rated" data-value="5" class="starR">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="0" />
		                            </div>
	                            </c:when>
	                            <c:when test="${ review.rated == 1}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR on">★</span>
		                                <span name="rated" data-value="2" class="starR">★</span>
		                                <span name="rated" data-value="3" class="starR">★</span>
		                                <span name="rated" data-value="4" class="starR">★</span>
		                                <span name="rated" data-value="5" class="starR">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="1" />
		                            </div>
	                            </c:when>
	                            <c:when test="${ review.rated == 2}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR on">★</span>
		                                <span name="rated" data-value="2" class="starR on">★</span>
		                                <span name="rated" data-value="3" class="starR">★</span>
		                                <span name="rated" data-value="4" class="starR">★</span>
		                                <span name="rated" data-value="5" class="starR">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="2" />
		                            </div>
	                            </c:when>
	                            <c:when test="${ review.rated == 3}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR on">★</span>
		                                <span name="rated" data-value="2" class="starR on">★</span>
		                                <span name="rated" data-value="3" class="starR on">★</span>
		                                <span name="rated" data-value="4" class="starR">★</span>
		                                <span name="rated" data-value="5" class="starR">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="3" />
		                            </div>
	                            </c:when>
	                            <c:when test="${ review.rated == 4}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR on">★</span>
		                                <span name="rated" data-value="2" class="starR on">★</span>
		                                <span name="rated" data-value="3" class="starR on">★</span>
		                                <span name="rated" data-value="4" class="starR on">★</span>
		                                <span name="rated" data-value="5" class="starR">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="4" />
		                            </div>
	                            </c:when>
	                            <c:when test="${ review.rated == 5}">
		                            <div name="rated" class="re_star">
		                                <span name="rated" data-value="1" class="starR on">★</span>
		                                <span name="rated" data-value="2" class="starR on">★</span>
		                                <span name="rated" data-value="3" class="starR on">★</span>
		                                <span name="rated" data-value="4" class="starR on">★</span>
		                                <span name="rated" data-value="5" class="starR on">★</span>
		                                <input id="ratedInput" type="hidden" name="rated" value="5" />
		                            </div>
	                            </c:when>
                            </c:choose>
                        </div>
                        <br>
                        <p id="re_titleAndDetailReview" >제목</p>
                        <textarea maxlength="30" id="re_titleContent" name="name">${ review.name }</textarea>
                        <p id="re_textCount"><span id="re_nowTextCount1">0</span>/30</p>
                        <p id="re_titleAndDetailReview">상세리뷰</p>
                        <textarea maxlength="300" id="re_detailReviewContent" name="content">${ review.content }</textarea>
                        <p id="re_textCount"><span id="re_nowTextCount2">0</span>/300</p>
                        <!-- <input id="re_imgAttachBtn" type="button" value="사진 첨부"> -->
                        <input id="re_imgadd"  type="file" name="upfile" accept="image/jpeg,image/png,image/gif" value="사진 첨부">
                        <label id="re_imgAttachBtn" for="re_imgadd">사진 첨부</label>
                        <span id="re_imgSizeMsg" >${ review.renamedFilename }</span>
                        <div id="re_SubmitAndCancelBtn">
                        <input id="re_subMitBtn" type="submit" value="수정">
                        
                            <a href="${ path }/mypage/mypageProductReview"><input id="re_cancelBtn" type="button" value="취소"></a>
                            
                        <input type="hidden" name="reviewNo" value="${ review.reviewNo }"/>
                        <input type="hidden" name="rstatus" value="${ review.rstatus }"/>
                        <input type="hidden" name="userNo" value="${ loginMember.memberNo }"/>
                        <input type="hidden" name="rgstrDate" value="${ review.rgstrDate }"/>
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

	<!-- 페이지가 로드되면 제목, 내용 글자수를 출력해주는 코드입니다.-->
	<script>
		$('document').ready(() => {
			let re_titleContent = $('#re_titleContent').val()
			let re_detailReviewContent = $('#re_detailReviewContent').val()

			if(re_titleContent.length == 0 || re_titleContent == ''){
				$('re_nowTextCount1').html('0');
			} else{
				$('#re_nowTextCount1').html(re_titleContent.length);
			}

			if(re_detailReviewContent.length == 0 || re_detailReviewContent == ''){
				$('re_nowTextCount2').html('0');
			} else{
				$('#re_nowTextCount2').html(re_detailReviewContent.length);
			}

		})
	</script>
</body>

</html>