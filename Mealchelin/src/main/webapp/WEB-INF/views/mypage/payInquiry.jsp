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
<link rel="stylesheet" href="${ path }/css/pay/OrderInquiry.css">
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
			<h2>주문 조회</h2>
			<div class="pay_mainContentTitle">
				<span>주문 내역</span> <span class="pay_OrderDetails">현재 상품 배송상태를
					확인할 수 있어요</span>
			</div>
			<div class="pay_mainContentArea">
				<div class="pay_chapter">
					<div class="pay_FirstChapter">
						<a href="#"> 결제완료 </a>
					</div>
					<div class="pay_FirstChapter">
						<a href="#"> 배송 준비 </a>
					</div>
					<div class="pay_FirstChapter">
						<a href="#"> 배송 중 </a>
					</div>
					<div class="pay_FirstChapter pay_on">
						<a href="#"> 배송 완료 </a>
					</div>
				</div>
				<br>
				<br>
				<div class="pay_ProductInfoArea">
					<p class="pay_ProductTitle">
						<span>2024.02.27</span> <a href="../pay/OrderDetails.html">주문내역
							상세보기></a>
					</p>
					<p class="pay_line"></p>
					<c:forEach items="${orders}" var="order">
						<div class="pay_Product">
							<div class="pay_ProductImg">
								<a href="../img/new_01.jpg"><img
									src="${ path }/img/product/${order.image}"
									class="pay_ProductImgArea"></a>
							</div>
							<div class="pay_ProductInfo">
								<table class="pay_table">
									<tr>
										<td>상품명</td>
										<td class="pay_subName">${order.name}</td>
									</tr>
									<tr>
										<td>주문번호</td>
										<td class="pay_subName">${order.orderMembers}</td>
									</tr>
									<tr>
										<td>결제방법</td>
										<td class="pay_subName">${order.paymentMethod}</td>
									</tr>
									<tr>
										<td>결제금액</td>
										<td class="pay_subName"><fmt:formatNumber
												value="${order.payMent}" type="number" />원</td>
									</tr>
								</table>
							</div>
							<div class="pay_ProductResult">
								<p>${order.shipStatus}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<div class="pay_pageNumber">
				<ul>
					<li><a href=""><</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">></a></li>

				</ul>
			</div>

		</section>
	</main>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="./../layout/footer.jsp" />
	</footer>

	<!-- 필요한 js 밑에 추가-->
	<script type="text/javascript" src="${ path }/js/index.js"></script>
	<script type="text/javascript" src="${ path }/js/pay/Orderlnquiry.js"></script>
</body>

</html>