<!-- jsp 기본틀 지켜줘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="totalPrice" value="0" />

<c:set var="shippingPrice" value="0" />

<c:set var="formattedPhone"
	value="${shipInfo.phone.substring(0, 3)}-${shipInfo.phone.substring(3, 7)}-${shipInfo.phone.substring(7)}" />

<c:set var="path" value="${ pageContext.request.contextPath }" />

<c:set var="path" value="${ pageContext.request.contextPath }" />

<c:forEach items="${result}" var="item">
	<c:set var="totalPrice" value="${totalPrice + item.price * item.countQ}" />
</c:forEach>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>밀슐랭</title>
<!--default css-->
<link rel="stylesheet" href="${ path }/css/common.css">
<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/pay/OrderDelete.css">
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
	<main id="pay_Mains">
		<jsp:include page="/WEB-INF/views/mypage/mypageHeaderBox.jsp" />
		<section class="pay_Sections">
			<h3 class="pay_Title">주문취소</h3>
			<div class="pay_MainContent">
				<div class="pay_FirstContent">
					<span class="pay_FirstContentTitle">주문번호 ${orders.orderMembers }</span>
				</div>
				<c:forEach items="${result }" var="items">
					<div class="pay_FirstContentArea">
					 <img src="${ path }/img/product/${items.image}" class="pay_menuPhoto">
						<div class="pay_ProductInfo">
							<table class="pay_table">
								<tr>
									<td>상품명</td>
									<td class="pay_subNameOne">${items.name }</td>
								</tr>
								<tr class="pay_ProductMenu">
									<td>상품금액</td>
									<td class="pay_subNameTwo"><fmt:formatNumber value="${items.price * items.countQ}" pattern="#,###" />원<span>ㅣ</span>${items.countQ}개</td>
								</tr>
							</table>
						</div>
					</div>
				</c:forEach>
				<div class="pay_SecondContentArea">
					<div class="pay_SecondContent">
						<span class="pay_secondContentTitle">취소 사유 선택</span>
						<div class="pay_payInfo">
							<div class="pay_payList">
								<div class="pay_Info">
								    <label for="pay_one"><input type="checkbox" id="pay_one" name="pay_check"> 단순변심</label>
								    <label for="pay_two"><input type="checkbox" id="pay_two" name="pay_check"> 상품 옵션 변경</label>
								    <label for="pay_three"><input type="checkbox" id="pay_three" name="pay_check"> 추가 주문</label>
								    <label for="pay_four"><input type="checkbox" id="pay_four" name="pay_check"> 결제 수단 변경</label>
								    <label for="pay_five"><input type="checkbox" id="pay_five" name="pay_check"> 배송 정보 변경</label>
								    <label for="pay_six"><input type="checkbox" id="pay_six" name="pay_check"> 상품 가격</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="pay_tridContentArea">
					<div class="pay_SecondContent">
						<span class="pay_secondContentTitle">환불 정보</span>
					</div>
					<div class="pay_userInfo">
						<div class="pay_Sender">
							<span class="pay_username">주문금액</span> <span
								class="pay_usernames"><fmt:formatNumber
									value="${totalPrice}" type="number" pattern="#,###" />원</span>
						</div>
						<c:choose>
							<c:when test="${shippingInfo.mountain == 'N'}">
								<c:set var="shippingPrice" value="3000" />
							</c:when>
							<c:otherwise>
								<c:set var="shippingPrice" value="5000" />
							</c:otherwise>
						</c:choose>
						<c:if test="${totalPrice >= 50000}">
							<c:set var="shippingPrice" value="0" />
						</c:if>
						<div class="pay_Sender">
							<span class="pay_userPhone">배송비</span>
							 <span class="pay_userPhones"><fmt:formatNumber value="${shippingPrice}" type="number" pattern="#,###" />원</span>
						</div>
					</div>
				</div>
				<div class="pay_finalResult">
					<span class="pay_Delivery">최종 환불 금액</span> 
					<span class="pay_Finalpay"><fmt:formatNumber value="${totalPrice+shippingPrice}" pattern="#,##0원" type="number" /></span>
				</div>
				<div class="pay_fourContentArea">
					<div class="pay_payfourInfo">
						<div class="pay_payfourList">
							<div class="pay_fourInfo">
								<label for="pay_fourone"><input type="checkbox" id="pay_fourone">주문 취소 내역에 동의(전자상거래)<span>(필수)</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="pay_pay_Productreview">
					<a href="${path}/payment/payCncel?orderNo=${orders.orderNo}" id="cancelOrderBtn">주문 취소</a>
					<input type="button" onclick="location.href='/'" value="홈으로 이동" />
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
	<script type="text/javascript" src="${ path }/js/pay/OrderDelete.js"></script>
	<script type="text/javascript" src="${ path }/js/pay/OrderDeleteChoose.js"></script>
</body>

</html>