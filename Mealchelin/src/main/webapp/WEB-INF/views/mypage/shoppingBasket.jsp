<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
	<title>밀슐랭</title>
    <!--default css-->
    <link rel="stylesheet" href="${ path }/css/common.css">
    <!-- 필요한 css -->
     <link rel="stylesheet" href="${ path }/css/mypage/shoppingBasket.css">
    
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
        <section>
            <h3 class="mytitle">장바구니</h3>
            <div class="myToptext">
                <input type="checkbox" name="mychecker" id="mycheckerAll" class="mychecker"><label for="mycheckerAll">전체선택</label>
            </div>
            <div class="myAllBox">
                <!-- 왼쪽 장바구니 리스트-->
                <div class="myList">
                    <table>
                        <tr class="mytr">
                            <td class="mytd1"><input type="checkbox" name="mychecker" id="mychecker1" value="" class="mychecker"><label for="mychecker1"></label></td>
                            <td class="mytd2"><img src="../img/galbitang.png" alt="음식사진"></td>
                            <td class="mytd3"><a href="#"><div class="myProductName"> [사미헌] 갈비탕 </div></a></td>
                            <td class="mytd4">
                                <div class="myCounter myCounter1">
                                    <button class="myCounter-minus">-</button>
                                    <span class="myCounter-quantity">1</span>
                                    <button class="myCounter-plus">+</button>
                                </div>
                            </td>
                            <td class="mytd5"><div class="myProductPrice"> 12,000원 </div></td>
                            <td class="mytd6"><img src="../img/all/x.png" alt="취소버튼"></td>
                        </tr>
                        <tr class="mytr">
                            <td class="mytd1"><input type="checkbox" name="mychecker" id="mychecker2" value="" class="mychecker"><label for="mychecker2"></label></td>
                            <td class="mytd2"><img src="../img/galbitang.png" alt="음식사진"></td>
                            <td class="mytd3"><a href="#"><div class="myProductName"> [사미헌] 갈비탕 </div></a></td>
                            <td class="mytd4">
                                <div class="myCounter myCounter1">
                                    <button class="myCounter-minus">-</button>
                                    <span class="myCounter-quantity">1</span>
                                    <button class="myCounter-plus">+</button>
                                </div>
                            </td>
                            <td class="mytd5"><div class="myProductPrice"> 12,000원 </div></td>
                            <td class="mytd6"><img src="../img/all/x.png" alt="취소버튼"></td>
                        </tr>
                    </table>
                </div>
                <!-- 오른쪽 주소, 합계 박스 -->
                <div class="myRightBox">
                    <div class="myRightBoxIn">
                        <div class="myboxInTitle">
                            <img src="../img/all/location.png" alt="location">
                            <div>서울특별시 중구 남대문로 120</div>
                        </div>
                        <div class="myDetailAdress">대일빌딩 2층, 3층</div>
                        <button class="myAdressBtn">배송지 변경</button>
                        <div class="myPrice">
                            <div class="myPriceleft">상품금액</div>
                            <div class="myPriceright">12,000원</div>
                        </div>
                        <div class="mydelivery">
                            <div class="mydeliveryleft">배송비</div>
                            <div class="mydeliveryright">3,500원</div>
                        </div>

                        <hr>

                        <div class="myAllprice">
                            <div class="myAllpriceleft">결제예상금액</div>
                            <div class="myAllpriceright">27,000원</div>
                        </div>

                        <button class="myOrder" type="submit">주문하기</button>

                    </div>
                    <div class="mytext"> - [주문완료] 상태일 경우에만 주문 취소 가능합니다. </div>
                    <div class="mytext"> - 마이페이지 > 주문내역에서 직접 취소할 수 있습니다.</div>
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
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${ path }/js/main.js"></script>
    <script src="${ path }/js/mypage/shoppingBasket.js"></script>
</body>

</html>