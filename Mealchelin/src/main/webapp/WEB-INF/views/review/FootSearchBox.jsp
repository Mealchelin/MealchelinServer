<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>밀슐랭</title>
<!--default css-->
<link rel="stylesheet" href="${ path }/css/common.css">

<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/review/FootSearchBox.css" />

<!-- jquery -->
<script src="${ path }/js/jquery-3.7.1.js"></script>
</head>

<body>
	<!-- 플로팅 배너(TOP버튼)-->
	<div class="top" id="topBtn"></div>

	<!-- 네비게이션 헤더 -->
	<header id="header">
		<jsp:include page="./../layout/header.jsp" />
	</header>

	<!-- 내용 넣기 -->
	<main>
		<section>
			<div id="re_bottomSearchBox">
                <select id="re_shearchBtn" name="" id="">
                    <option value="all">전체</option>
                    <option value="all">한달</option>
                    <option value="all">3달</option>
                </select>
                <select id="re_shearchBtn" name="" id="">
                    <option value="all">제목</option>
                    <option value="all">내용</option>
                    <option value="all">글쓴이</option>
                    <option value="all">아이디</option>
                </select>
                <input id="re_shearchBtn" type="text">
                <input id="re_shearchBtn" type="submit" value="찾기">
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