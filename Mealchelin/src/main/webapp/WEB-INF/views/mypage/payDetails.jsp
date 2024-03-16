<!-- jsp 기본틀 지켜줘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="totalPrice" value="0" />

<c:set var="formattedPhone" value="${shipInfo.phone.substring(0, 3)}-${shipInfo.phone.substring(3, 7)}-${shipInfo.phone.substring(7)}" />

<c:set var="path" value="${ pageContext.request.contextPath }" />

<c:forEach items="${result}" var="item">
    <c:set var="totalPrice" value="${totalPrice + item.price * item.countQ}" />
</c:forEach>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>밀슐랭</title>
<!--default css-->
<link rel="stylesheet" href="${ path }/css/common.css">
<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/pay/OrderDetails.css">
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
	<main id="pay_mains">
		<jsp:include page="/WEB-INF/views/mypage/mypageHeaderBox.jsp" />
		<section id="pay_sections">
			<h2>주문 내역 상세</h2>
			<div class="pay_mainContentTitle">
				<span>주문번호 ${orders.orderMembers }</span> <span
					class="pay_OrderDetails">배송 또는 상품에 문제가 있나요? <a
					href="${ path }/cscenter/inquiry">1:1문의 ></a>
				</span>
			</div>
			<div class="pay_mainContentArea"></div>
			<c:forEach items="${result }" var="items">
				<div class="pay_ProductInfoArea">
					<div class="pay_Product">
						<div class="pay_ProductImg">
							<a href="../img/new_01.jpg">
							<img src="${ path }/img/product/${items.image}" class="pay_ProductImgArea"></a>
						</div>
						<div class="pay_ProductInfo">
							<table class="pay_table">
								<tr>
									<td>상품명</td>
									<td class="pay_subNameOne">${items.name }</td>
								</tr>
								<tr class="pay_ProductMenu">
									<td>상품금액</td>
									<td class="pay_subNameTwo"><fmt:formatNumber
											value="${items.price * items.countQ}" pattern="#,###" />원 <span>ㅣ</span>
										${items.countQ}개</td>
								</tr>
							</table>
						</div>
						<div class="pay_Productresult">
							<span>${items.shipStatus }</span>
						</div>
						<div class="pay_pay_Productreview">
						<a href="${path}/mypage/payDelete?orderNo=${orders.orderNo}">주문 취소</a>
<%-- 							<input type="hidden" onclick="location.href='${path}/mypage/payDelete?orderNo=${order.orderNo}'" value="주문 취소" /> --%>
							<input type="button"
								onclick="location.href='${path}/mypage/writableReview'"
								value="리뷰쓰기" />
							<p>* 리뷰는 구매일로부터</p>
							<p>3개월까지만 작성 가능합니다</p>
						</div>
					</div>
				</div>
			</c:forEach>

			<p class="pay_line"></p>
			<div class="pay_button">
				<input type="button"
					onclick="location.href='${path}/mypage/shoppingBasket'"
					value="상품 다시 담기"> <input type="button"
					onclick="location.href='${path}/product/list'" value="상품 목록 페이지 이동">
			</div>
			<div class="pay_infomessage">
				<p>주문 취소는 [결제완료] 상태일 경우에만 가능합니다</p>
				<p>상품에 이상이 있을 시 1:1 문의를 이용해주세요</p>
			</div>
			<div class="pay_FiveContent">
				<span class="pay_fiveContentTitle">배송 조회</span>
			</div>

			<c:choose>
				<c:when test="${orders.shipStatus eq '배송중'}">
					<div class="pay_DeliveryInfo">
						<div class="pay_preparation">
							<img src="../img/pay_preparation1.png">
							<p>상품준비중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
						</div>
						<div class="pay_shipping">
							<img src="../img/pay_shipping2.png">
							<p>배송중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
							<!-- <span></span> -->
						</div>
						<div class="pay_completed">
							<img src="../img/pay_completed1.png">
							<p>배송완료</p>
						</div>
					</div>
				</c:when>

				<c:when test="${orders.shipStatus eq '배송완료'}">
					<div class="pay_DeliveryInfo">
						<div class="pay_preparation">
							<img src="../img/pay_preparation1.png">
							<p>상품준비중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
						</div>
						<div class="pay_shipping">
							<img src="../img/pay_shipping1.png">
							<p>배송중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
							<!-- <span></span> -->
						</div>
						<div class="pay_completed">
							<img src="../img/pay_completed2.png">
							<p>배송완료</p>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="pay_DeliveryInfo">
						<div class="pay_preparation">
							<img src="../img/pay_preparation2.png">
							<p>상품준비중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
						</div>
						<div class="pay_shipping">
							<img src="../img/pay_shipping1.png">

							<p>배송중</p>
						</div>
						<div class="pay_Deliveryline">
							<img src="../img/Group 60.png">
							<!-- <span></span> -->
						</div>
						<div class="pay_completed">
							<img src="../img/pay_completed1.png">
							<p>배송완료</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="pay_Deliverycheck">
				<table>
					<tr class="pay_FirstInfoLine">
						<td>주문번호</td>
						<td>주문상태</td>
					</tr>
					<c:choose>
						<c:when test="${orders.shipStatus eq '배송중'}">
							<!-- 배송중 또는 배송완료인 경우 -->

							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송준비중</td>
							</tr>
							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송중</td>
							</tr>
						</c:when>
						<c:when test="${orders.shipStatus eq '배송완료'}">
							<!-- 배송완료인 경우 -->
							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송준비중</td>
							</tr>
							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송중</td>
							</tr>
							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송완료</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 배송중이나 배송완료가 아닌 경우 -->
							<tr class="pay_secondInfoLine">
								<td>${orders.orderMembers }</td>
								<td>배송준비중</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="pay_FirstContentArea">
				<div class="pay_FirstContent">
					<span class="pay_FirstContentTitle">결제 정보</span> <span></span>
				</div>
				<div class="pay_userInfo">
					<div class="pay_ProductInfo">

						<table class="pay_Maintable">
						
							<tr>
								<td class="pay_mainName">상품금액</td>
								<td class="pay_subName"><fmt:formatNumber
										value="${totalPrice}" type="number" pattern="#,###" />원</td>
							</tr>
							<c:set var="shippingPrice" value="0" />
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
								
								<tr>
								    <td class="pay_mainName">배송비</td>
								    <td class="pay_subName"><fmt:formatNumber value="${shippingPrice}" type="number" pattern="#,###" />원</td>
								</tr>
							<tr>
								<td class="pay_mainName">결제금액</td>
								<td class="pay_subName"><fmt:formatNumber
										value="${totalPrice+shippingPrice}" pattern="#,##0원" type="number" /></td>
							</tr>
							<tr>
								<td class="pay_mainName">결제방법</td>
								<td class="pay_subName">${orders.paymentMethod }</td>

							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="pay_SecondContentArea">
				<div class="pay_SecondContent">
					<span class="pay_secondContentTitle">주문정보</span> <span></span>
				</div>
				<div class="pay_userSecondInfo">
					<div class="pay_ProductSecondInfo">
						<table class="pay_Maintable">
							<tr>
								<td class="pay_mainName">주문번호</td>
								<td class="pay_subName">${orders.orderMembers }</td>
							</tr>
							<tr>
								<td class="pay_mainName">보내는 분</td>
								<td class="pay_subName">${loginMember.name }</td>
							</tr>
							<tr>
								<td class="pay_mainName">결제일시</td>
								<td class="pay_subName">${orders.orderDate }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			</div>
			<div class="pay_tridContentArea">
				<div class="pay_tridContent">
					<span class="pay_secondContentTitle">배송정보</span> <span></span>
				</div>
				<div class="pay_userInfo">
					<div class="pay_ProductInfos">
						<table class="pay_Maintable">
							<tr>
								<td class="pay_mainName">받는분</td>
								<td class="pay_subName">${shipInfo.shipName }</td>
							</tr>						
								<tr>
								    <td class="pay_mainName">핸드폰</td>
								    <td class="pay_subName">${formattedPhone}</td>
								</tr>
							<tr>
								<td class="pay_mainName">주소</td>
								<td class="pay_subName">${shipInfo.shipAddress }
									${shipInfo.shipAddressDetail }</td>

							</tr>
							<tr>
								<td class="pay_mainName">배송 요청사항</td>
								<td class="pay_subName">${orders.request }</td>
							</tr>
						</table>
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
	<script type="text/javascript" src="${ path }/js/pay/OrderDetails.js"></script>
</body>

</html>