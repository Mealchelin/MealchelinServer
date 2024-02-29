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
        	<form action="" method="get">
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
	                                    <button class="myCounter-minus" id="my-view-quantity-minus1">-</button>
	                                    <input type="number" class="myCounter-quantity" id="my-view-quantity1"
	                                        value="1" dir="rtl" min="1" max="99" readonly>
	                                    <button class="myCounter-plus" id="my-view-quantity-plus1">+</button>
	                                </div>
	                            </td>
	                            <td class="mytd5"><div class="myProductPrice" id="my-view-totalPrice1" > 12,000원 </div></td>
	                            <td class="mytd6"><img src="../img/all/x.png" alt="취소버튼"></td>
	                        </tr>
	                        <tr class="mytr">
	                            <td class="mytd1"><input type="checkbox" name="mychecker" id="mychecker2" value="" class="mychecker"><label for="mychecker2"></label></td>
	                            <td class="mytd2"><img src="../img/galbitang.png" alt="음식사진"></td>
	                            <td class="mytd3"><a href="#"><div class="myProductName"> [사미헌] 갈비탕 </div></a></td>
	                            <td class="mytd4">
	                                <div class="myCounter myCounter1">
	                                    <button class="myCounter-minus" id="my-view-quantity-minus2">-</button>
	                                    <input type="number" class="myCounter-quantity" id="my-view-quantity2"
	                                            value="1" dir="rtl" min="1" max="99" readonly>
	                                    <button class="myCounter-plus" id="my-view-quantity-plus2">+</button>
	                                </div>
	                            </td>
	                            <td class="mytd5"><div class="myProductPrice" id="my-view-totalPrice2"> 12,000원 </div></td>
	                            <td class="mytd6"><img src="../img/all/x.png" alt="취소버튼"></td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="myAllPriceDiv">
	                    <div class="myAllPriceText">결제예상금액</div>
	                    <div class="myAllPrice">24,000원</div>
	                </div>
	            </div>
	            <div class="finalbtnDiv">
	            	<button type="submit" class="finalbtn">주문하기</button>
	            </div>
        	</form>
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