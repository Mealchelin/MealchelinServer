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
    <link rel="stylesheet" href="${ path }/css/product/productMain.css">
    
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
    	<!-- 섹션 1-->
        <!-- 카테고리 -->
        <section id="pd-section1">
            <div class="pd-main-navi">
            	<c:if test="${ not empty newList }">
            		<h3 class="pd-main-heading">신상품</h3>
            	</c:if>
            	<c:if test="${ not empty bestList }">
	                <h3 class="pd-main-heading">베스트</h3>
            	</c:if>
            </div>
        </section>

        <!-- 섹션2 -->
        <!-- jsp로 변경 시 c:if 문 사용하여 하나로 단축 -->
        <!-- 한 페이지 16개의 제품 노출 -->
        <section id="pd-section2" style="margin-bottom: 80px">
            <div class="pd-main_new_menu">
            	<c:if test="${ listCount == 0 }">
<%--             		<jsp:include page="" /> --%>
            	</c:if>
	            <c:forEach var="product" items="${ list }">
	                <div class="pd-main_new_box">
	                    <a href="${ path }/product/view?no=${product.no}"><div class="pd-main_new_box_img"><img src="${ path }/img/product/${ product.image }"></div></a>
	                    <div class="pd-main_new_box_txt">
	                        <div class="pd-main_new_txt_name">${ product.name }</div>
	                        <div class="pd-main_new_txt_brand">${ product.brand }</div>
	                        <div class="pd-main_new_txt_price">
	                        	<fmt:formatNumber  value="${product.price}" type="number"/>원
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
            </div>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
</body>

</html>