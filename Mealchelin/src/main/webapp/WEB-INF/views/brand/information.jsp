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
    <link rel="stylesheet" href="${ path }/css/brand/brand.css">
    
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
        <div id="section1">
            <div class="brHeadTxt">
                <div calss="brHeadText">밀키트의 다양한 맛을 소개하다 _<span>밀슐랭</span></div>
            </div>
            <img src="" width="100%">
        </div>
        <section id="section2">
            <div style="margin-bottom:30px;">
                밀슐랭은 밀키트 통합 쇼핑몰로서,<br>
                다양한 제조사로부터 밀키트를 유통하는 서비스를 제공합니다.<br>
                우리는 고객들이 집에서 편리하게 신선하고 다채로운 요리를 즐길 수 있도록 최상의 서비스를 제공합니다.
            </div>
            <div>
                밀슐랭은 다양한 제조사로부터 다양한 요리 레시피와 필요한 재료가 포함된 밀키트를 도매로 구매하여 고객들에게 제공합니다.<br>
                고객들은 한 곳에서 다양한 요리 옵션을 선택하고, 편리하게 주문하여 집에서 즐길 수 있습니다.
            </div>
        </section>
        <section id="section3">
            <div class="brandImg">
                <img src="${ path }/img/brand_img2.jpg">
            </div>
            <div class="brandImgText">
                <div class="brandImgTextH">#밀슐랭의 약속</div>
                <div>
                    우리의 목표는 고객들에게 <b>신선하고 맛있는<br>
                    요리 경험을 제공</b>하는 것입니다.<br>
                    고객들이 요리를 즐기는 과정에서<br>
                    새로운 경험을 만들어내고, 즐거움을 찾을 수 있도록<br>
                    레스토랑 수준의 요리를 집에서도 쉽게 즐길 수 있는<br>
                    기회를 제공하기 위해 노력하고 있습니다.<br>
                    또한, 다양성과 편의성을 중시하며,<br>
                    환경에 대한 책임을 다하고자 노력합니다.
                </div>
            </div>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer style="clear:both;">
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
</body>

</html>