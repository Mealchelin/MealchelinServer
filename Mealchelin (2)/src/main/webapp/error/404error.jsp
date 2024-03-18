<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>밀슐랭</title>
	    <!--default css-->
	    <link rel="stylesheet" href="${ path }/css/common.css">
	</head>
	<body>
	    <main>
	        <div class="error_img">
	    
	        </div>
	        <div class="error_m_txt">죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.</div>
	        <div class="error_sub_txt">존재하지 않는 주소를 입력하셨거나,<br>
	            요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</div>
	        <div class="error_buttons">
	            <button class="meal_btn1" onClick="location.href='/'" style="cursor: pointer;">메인으로</button>
	            <button class="meal_btn2" onClick="history.go(-1)" style="margin-left:15px;cursor: pointer;">이전페이지</button>
	        </div>
	    </main>
	</body>
</html>