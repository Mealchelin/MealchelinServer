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
    <link rel="stylesheet" href="${ path }/css/mypage/updateMember.css">
    
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
        	<jsp:include page="mypageHeaderBox.jsp"/>
            <h3 class="myTitle"> 내 정보 수정 </h3>
            <p class="mySubTitle1"">비밀번호 재확인</p>
            <p class="mySubTitle2">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</p>
            <hr>
            <div class="myInputBox">
                <form action="#" method="post">
                    <div class="myInputDiv myInputDiv1">
                        <label for="mymemberId" class="mymemberLb">아이디</label>
                    </div>
                    <div class="myInputDiv myInputDiv2">
                        <input type="text" id="mymemberId" name="mymemberId" value="juyeon1234" class="mymemberIp"> 
                    </div>
                    <br><br>
                    <div class="myInputDiv myInputDiv3">
                        <label for="mymemberPwd" class="mymemberLb">비밀번호</label>
                    </div>
                    <div class="myInputDiv myInputDiv4">
                        <input type="password" id="mymemberPwd" name="mymemberPwd" class="mymemberIp" placeholder="현재 비밀번호를 입력해주세요" >
                    </div>
                    <button class="myInputBtn" type="submit"> 확인 </button>
                </form>
            </div>    
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${ path }/js/main.js"></script>
    <script type="text/javascript" src="${ path }/js/index.js"></script>
</body>

</html>