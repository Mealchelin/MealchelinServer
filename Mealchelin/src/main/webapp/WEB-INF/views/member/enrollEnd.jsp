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
         <link rel="stylesheet" href="${ path }/css/member/enrollEnd.css">
    
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
            <div id="co_mainDiv">
                <img src="../img/all/logo5.png" alt="로고사진" class="memLogo">
                <h3>회원가입이 완료되었습니다.</h3>
                <p id="co_enrollment">로그인 후 안전하고 편리하게 <br> 밀슐랭 서비스를 이용할 수 있습니다.</p>
                <a href="${ path }/"><input id="co_goMainBtn" type="button" value="메인 페이지로 이동"></a>
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