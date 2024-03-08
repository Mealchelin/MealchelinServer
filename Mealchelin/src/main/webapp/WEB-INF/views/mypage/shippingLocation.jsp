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
    <link rel="stylesheet" href="${ path }/css/mypage/shippingLocation.css">
    <link rel="stylesheet" href="${ path }/css/mypage/mypageHeaderBox.css">
    
    
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
        <jsp:include page="mypageHeaderBox.jsp"/>
        <section>
            <h3 class="myadress">배송지 관리</h3>
            <div class="mytableDiv">
                <table class="mytatble" style="margin: 0 auto; width: 1028px;">
                    <colgroup>
                    <col style="width: 44px">
                    <col style="width: 95px">
                    <col style="width: 460px">
                    <col style="width: 33px">
                    <col style="width: 32px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="mytable_check" rowspan="5"><input type="checkbox" id="myaddressNow" name="myaddressCheckbox"><label for="myaddressNow"></label></td>
                            <td class="mytable_type" rowspan="5">기본 배송지</td>
                            <td class="mytable_name">이주연</td>
                            <td class="mytable_update" rowspan="5"><button class="myaddress_update"><img src="../img/all/write.png" alt="펜"></button></td>
                            <td class="mytable_delete" rowspan="5"><button class="myaddress_delete"><img src="../img/all/x.png" alt="x"></button></td>
                        </tr>
                        <tr>
                            <td class="mytable_number">01012341234</td>
                        </tr>
                        <tr>
                            <td class="mytable_addressNumber">192-12</td>
                        </tr>
                        <tr>
                            <td class="mytable_address">서울 중구 남대문로 120</td>
                        </tr>
                        <tr>
                            <td class="mytable_addressDetail">대일빌딩 2층</td>
                        </tr>
                    
                    </tbody>
                </table>              
            </div>
            <div class="mytableDiv">
                <table class="mytatble" style="margin: 0 auto; width: 1028px;">
                    <colgroup>
                    <col style="width: 44px">
                    <col style="width: 95px">
                    <col style="width: 460px">
                    <col style="width: 33px">
                    <col style="width: 32px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="mytable_check" rowspan="5"><input type="checkbox" id="myaddress1" name="myaddressCheckbox"><label for="myaddress1"></label></td>
                            <td class="mytable_type" rowspan="5">배송지 1</td>
                            <td class="mytable_name">손연희</td>
                            <td class="mytable_update" rowspan="5"><button class="myaddress_update"><img src="../img/all/write.png" alt="펜"></button></td>
                            <td class="mytable_delete" rowspan="5"><button class="myaddress_delete"><img src="../img/all/x.png" alt="x"></button></td>
                        </tr>
                        <tr>
                            <td class="mytable_number">01012341234</td>
                        </tr>
                        <tr>
                            <td class="mytable_addressNumber">192-12</td>
                        </tr>
                        <tr>
                            <td class="mytable_address">서울 중구 남대문로 120</td>
                        </tr>
                        <tr>
                            <td class="mytable_addressDetail">대일빌딩 2층</td>
                        </tr>        
                    </tbody>
                </table>              
            </div>
            
            <!-- 배송지 추가하기-->
            <div class="mytable_input">
                <form action="" method="post">
                    <table class="mytatble mytable_inputTable" style="margin: 0 auto; width: 1028px;">
                        <tbody>
                            <tr>
                                <td>배송지 등록</td>
                            </tr>
                            <tr>
                                <td class="mytable_inputName mytable_inputTd"><input type="text" name="myaddress_name" placeholder="이름을 입력하세요" required></td>
                            </tr>
                            <tr>
                                <td class="mytable_inputNumber mytable_inputTd"><input type="text" name="myaddress_phone" id="myaddress_phone" placeholder=" -빼고, 전화번호를 입럭하세요" required></td>
                            </tr>
                            <tr>
                                <td class="mytable_inputAddressNumber mytable_inputTd"><input type="text" name="mymaddress_1" id="mymaddress_1" placeholder="우편 번호" readonly required>
                                <button class="mytable_inputButton" type="button">우편 번호 검색 </button></td>
                            </tr>
                            <tr>
                                <td class="mytable_inputAddress mytable_inputTd"><input type="text" name="myaddress_2" id="myaddress_2" placeholder="주소" readonly required></td>
                            </tr>
                            <tr>
                                <td class="mytable_inputAddressDetail mytable_inputTd"><input type="text" name="myaddress_detail" id="myaddress_detail" placeholder="세부 주소를 입력하세요" required></td>
                            </tr>
                            <tr>
                                <td><input type="submit" class="mytable_inputSubmit" value="배송지 추가하기"></td>
                            </tr>
                        </tbody>
                    </table>    
                    <button class="myform_submit">기본 배송지로 등록</button>          
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
    <script type="text/javascript" src="${ path }/js/mypage/shippingLocation.js"></script>
</body>

</html>