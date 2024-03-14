<!-- jsp 기본틀 지켜줘 -->

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
				<span>주문번호 216156146546</span> <span class="pay_OrderDetails">배송
					또는 상품에 문제가 있나요? <a href="${ path }/cscenter/inquiry">1:1문의 ></a>
				</span>
			</div>
			<div class="pay_mainContentArea"></div>
			<div class="pay_ProductInfoArea">
				<div class="pay_Product">
					<div class="pay_ProductImg">
						<a href="../img/new_01.jpg"><img src="../img/new_01.jpg"
							class="pay_ProductImgArea"></a>
					</div>
					<div class="pay_ProductInfo">
						<table class="pay_table">
							<tr>
								<td>상품명</td>
								<td class="pay_subNameOne">안동심 순살 찜닭</td>
							</tr>
							<tr class="pay_ProductMenu">
								<td>결제금액</td>
								<td class="pay_subNameTwo">15,800원 <span>ㅣ</span> 1개
								</td>
							</tr>
						</table>
					</div>
					<div class="pay_Productresult">
						<span>배송중</span>
					</div>
					<div class="pay_pay_Productreview">
						<input type="button"
							onclick="location.href='${path}/mypage/payDelete'" value="주문 취소" />
						<input type="button" value="리뷰쓰기" />
						<p>* 리뷰는 구매일로부터</p>
						<p>3개월까지만 작성 가능합니다</p>
					</div>
				</div>
			</div>

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
				<div class="pay_Deliverycheck">
					<table>
						<tr class="pay_FirstInfoLine">
							<td>주문번호 / 배송번호</td>
							<td>주문상태</td>
						</tr>
						<tr class="pay_secondInfoLine">
							<td>주문번호 : ${order.orderMembers }</td>
							<td>${order.shipStatus }</td>
						</tr>
						<tr class="pay_secondInfoLine">
							<td>주문번호 : ${order.orderMembers }</td>
							<td>${order.shipStatus }</td>
						</tr>
						<tr class="pay_secondInfoLine">
							<td>주문번호 : ${order.orderMembers }</td>
							<td>${order.shipStatus }</td>
						</tr>
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
								<td class="pay_subName">15,800원</td>
							</tr>
							<tr>
								<td class="pay_mainName">배송비</td>
								<td class="pay_subName">0원</td>
							</tr>
							<tr>
								<td class="pay_mainName">결제금액</td>
								<td class="pay_subName">15,800원</td>
							</tr>
							<tr>
								<td class="pay_mainName">결제방법</td>
								<td class="pay_subName">카카오페이</td>
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
								<td class="pay_subName">216156146546</td>
							</tr>
							<tr>
								<td class="pay_mainName">보내는 분</td>
								<td class="pay_subName">백성연</td>
							</tr>
							<tr>
								<td class="pay_mainName">결제일시</td>
								<td class="pay_subName">2024-02-09</td>
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
								<td class="pay_subName">백성연</td>
							</tr>
							<tr>
								<td class="pay_mainName">핸드폰</td>
								<td class="pay_subName">010-2251-2148</td>
							</tr>
							<tr>
								<td class="pay_mainName">주소</td>
								<td class="pay_subName">서울 동작구 가로수길 109길(00아파트)</td>
							</tr>
							<tr>
								<td class="pay_mainName">받으실 장소</td>
								<td class="pay_subName">문 앞</td>
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