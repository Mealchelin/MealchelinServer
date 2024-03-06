<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<fmt:formatNumber var="price"  value="${product.price}" type="number"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
	<title>밀슐랭</title>
    <!--default css-->
    <link rel="stylesheet" href="${ path }/css/common.css">
    <!-- 필요한 css -->
    <link rel="stylesheet" href="${ path }/css/product/productDetail.css">
    
    <!-- jquery -->
    <script src="${ path }/js/jquery-3.7.1.js"></script>
</head>

<body>
	<!-- 플로팅 배너(TOP버튼)-->
    <div class="top" id="topBtn">
    </div>
    
    <!-- 네비게이션 헤더 -->
    <header id="header">
    	<jsp:include page="./../layout/header.jsp" />
    </header>
    
    <!-- 내용 넣기 -->
    <main>
    	<!-- 제품 이미지, 정보 -->
        <section id="pd-view-section1">
            <form>
            	<input type="hidden" name="no" value="${ product.no }">
            	<input type="hidden" name="price" value="${ price }">
                <div class="pd-view-image">
                    <img src="${path}/img/product/${product.image}" width="550px">
                </div>
                <div class="pd-view-saleInfo">
                    <div class="pd-view-name">
                        <p>${product.brand}</p>
                        <h3>${product.name}</h3>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">판매가</div>
                        <div class="pd-view-contentValue">${price}원</div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">배송비</div>
                        <div class="pd-view-contentValue">
                            3,000원 (50,000원 이상 구매 시 무료)
                            <br>
                            도서 산간 지역 추가 2,000원
                        </div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">배송정보</div>
                        <div class="pd-view-contentValue">
                            국내 배송 / CJ대한통운
                            <br>
                            평일 오전 11시 이전 주문 건에 
                            <br>
                            한하여 당일 출고
                        </div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">소비기한</div>
                        <div class="pd-view-contentValue">제조일로부터 14일</div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">중량</div>
                        <div class="pd-view-contentValue">약 ${product.weight}</div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">수량</div>
                        <div class="pd-view-contentValue">
                            <div class="pd-view-quantity-btn">
                                <button type="button" id="pd-view-quantity-minus">-</button>
                                <input type="number" class="pd-view-quantity" name="quantity"
                                    id="pd-view-quantity" value="1" dir="rtl" min="1" max="99" readonly>
                                <button type="button" id="pd-view-quantity-plus">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="pd-view-content">
                        <div class="pd-view-contentName">총 상품 금액</div>
                        <div class="pd-view-contentValue" id="pd-view-totalPrice">${price}원</div>
                    </div>
                    <div class="pd-view-btns">
                        <!-- 임의의 주소값 -->
                        <button class="pd-view-btn-basket" formaction="/product/shoppingBasket" formmethod="post">장바구니 담기</button>
                        <button class="pd-view-btn-purchase" formaction="/product/purchase" formmethod="post">구매하기</button>
                    </div>
                </div>
            </form>
        </section>

        <!-- 제품 상세 정보 -->
        <section id="pd-view-section2">
            <h3 class="pd-view-detail-header">상품 상세 정보</h3>
            <br>
            <br>
            <img class="pd-view-detail-image" src="${path}/img/product/${product.description}" width="900">
        </section>

        <!-- 제품 교환 및 환불 정보 -->
        <section id="pd-view-section3">
            <h3 class="pd-view-refund">교환 및 환불 정보</h3>
            <div class="pd-view-refund-case">
                <div class="pd-view-refund-name">
                    1. 상품에 문제가 있는 경우
                </div>
                <div class="pd-view-refund-content">
                    받으신 상품이 표시, 광고 내용 또는 계약 내용과 다른 경우에는 상품을 받은 날부터 3개월 이내, 
                    <br>
                    그 사실을 알게 된 날부터 30일 이내에 교환 및 환불을 요청하실 수 있습니다. 
                    <br>
                    상품의 정확한 상태를 확인할 수 있도록 사진을 함께 보내주시면 더 빠른 상담이 가능합니다.
                    <br><br>
                    ※ 배송 상품에 문제가 있는 것으로 확인되면 배송비는 판매자가 부담합니다.
                </div>
            </div>
            <div class="pd-view-refund-case">
                <div class="pd-view-refund-name">
                    2. 단순 변심, 주문 착오의 경우
                </div>
                <div class="pd-view-refund-content">
                    신선 / 냉장 / 냉동 식품
                    <br><br>
                    상품의 특성상 재판매가 불가하여 단순 변심, 주문 착오, 주소 오입력 등 고객의 책임 있는 사유로 인한 
                    <br>교환 및 반품이 어려운 점 양해 부탁드립니다.
                    <br>상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.
                </div>
            </div>
            <div class="pd-view-refund-case">
                <div class="pd-view-refund-name">
                    3. 교환, 반품이 불가한 경우
                </div>
                <div class="pd-view-refund-content">
                    다음에 해당하는 교환, 환불 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.
                    <br><br>
                    <ul class="pd-view-refund-ul">
                        <li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우
                            <br>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</li>
                        <li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li>
                        <li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li>
                        <li>복제가 가능한 상품의 포장이 훼손된 경우</li>
                        <li>고객님의 주문에 따라 개별적으로 생산되는 상품의 제작이 이미 진행된 경우</li>
                    </ul>


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
    <script type="text/javascript">
    $(document).ready(() => {
        // 1. 수량 버튼으로 수량 바꾸기
        // 2. 수량에 맞는 총 상품 금액 표현하기
        let quantity = parseInt($('#pd-view-quantity').val());
        
        // 1) 하나 빼기 (최소값: 1)
        let minus = $('#pd-view-quantity-minus');
        minus.on('click', () => {
            if (quantity != 1) {
                $('#pd-view-quantity').val(quantity-=1)
                if (quantity < 10) {
                    $('#pd-view-quantity').css("width", "10px")
                }
            }
            let price1 = quantity*${product.price};
            let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            $("#pd-view-totalPrice").html(price2 + "원");
        });

        // 2) 하나 더하기 (최대값: 99)
        let plus = $('#pd-view-quantity-plus');
        plus.on('click', () => {
            if (quantity != 99) {
                $('#pd-view-quantity').val(quantity+=1)
                if (quantity >= 10) {
                    $('#pd-view-quantity').css("width", "16px")
                }
            }
            let price1 = quantity*${product.price};
            let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            $("#pd-view-totalPrice").html(price2 + "원");
        });
    });
    </script>
</body>

</html>