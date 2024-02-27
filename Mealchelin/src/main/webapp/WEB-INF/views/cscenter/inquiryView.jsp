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
    <link rel="stylesheet" href="${ path }/css/cscenter/inquiryView.css">
    
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
        <!-- 카테고리 -->
        <section id="cs-section1">
            <h3>1:1 문의</h3>
        </section>

        <!-- 제목, 내용, 답변 -->
        <!-- textarea 개행문자: &#10;  -->
        <section id="cs-section2">
            <div class="cs-inquiry-wrap">
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">제목</div>
                    <textarea class="cs-inquiry-data" cols="100" rows="1" readonly>재료에서 떡이 빠져서 왔어요. 어떻게 해야 하나요?</textarea>
                </div>
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">내용</div>
                    <textarea class="cs-inquiry-data" cols="100" rows="12" readonly>재료에서 떡이 빠져서 왔어요. 어떻게 해야 하나요?&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;dd</textarea>
                </div>
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">답변</div>
                    <textarea class="cs-inquiry-data" cols="100" rows="12" readonly>
                    제품에 떡이 빠져서 발생한 불편함에 대해 진심으로 사과의 말씀을 전합니다.

					고객님의 주문한 제품이 완벽하지 못한 상태로 도착하여 매우 유감스럽게 생각합니다. 
					제품 품질과 고객 만족도는 저희가 항상 최우선으로 고려하는 사항이며, 이번에 발생한 문제에 대해서는 즉각적으로 조치를 취하고 동일한 문제가 재발하지 않도록 철저히 관리하겠습니다.
					고객님의 소중한 의견을 듣고 더 나은 서비스를 제공할 수 있도록 노력하겠습니다. 
					추가적인 문의나 요청이 있으시면 언제든지 연락주시기 바랍니다.
					                        
					다시 한 번 이러한 불편을 끼쳐드려 죄송하다는 말씀을 전합니다.
					                        
					감사합니다.
					</textarea>
                </div>
            </div>
        </section>

        <!-- 버튼 -->
        <section id="cs-section3">
            <button class="cs-location-to-list" onclick="location.href='${ path }/cscenter/inquiry'">목록</button>
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