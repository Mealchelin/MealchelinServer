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
    <link rel="stylesheet" href="${ path }/css/member/login.css">
    
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
            <img src="../img/all/logo5.png" alt="로고사진" class="memLogo">

            <form action="${ pageContext.request.contextPath }/member/login" method="post">
                <input type="text" placeholder="아이디를 입력해주세요" name="userId" id="userId" class="memInput memInputId" >
                <input type="password" placeholder="비밀번호를 입력해주세요" name="userPwd" id="userPwd" class="memInput memInputPwd">
                <input type="submit" value="로그인" class="memInput memInputBtn">
            </form>

            <!--회원찾기-->
            <div class="memtext">
                <a href="${ path }/member/enroll"><div class="memtext1">회원가입</div></a>
                <div class="memtext2">아이디 찾기 | 비밀번호 찾기</div>
            </div>
            <!-- sns 로그인 -->
            <div class="memSns">
                <img  class="memSns1" src="../img/all/naver-login.png" alt="네이버 로그인">
                <img  class="memSns2" src="../img/all/kakao-login.png" alt="카카오 로그인">
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
    <script src="${ path }/js/member/login.js"></script>
</body>

</html>