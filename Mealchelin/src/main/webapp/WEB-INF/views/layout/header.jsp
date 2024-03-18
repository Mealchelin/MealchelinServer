<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<nav class="header_nav">
    <ul class="left_nav">
        <a href="${ path }/"><li class="logo1_nav"></li></a>
    </ul>
    <ul class="main_nav">
        <li><a href="${ path }/brand/information">브랜드</a></li>
        <li><a href="${ path }/product/best">베스트</a></li>
        <li><a href="${ path }/product/new">신상품</a></li>
        <li>
        	<a href="${ path }/product/list">전체상품
        		<ul class="main_nav_hover">
	        		<li><a href="${ path }/product/list?category=korean">한식</a></li>
	        		<li><a href="${ path }/product/list?category=bunsik">분식</a></li>
	        		<li><a href="${ path }/product/list?category=chinese">중식</a></li>
	        		<li><a href="${ path }/product/list?category=japanese">일식</a></li>
	        		<li><a href="${ path }/product/list?category=western">양식</a></li>
	        		<li><a href="${ path }/product/list?category=southeast">동남아</a></li>
	        	</ul>
        	</a>
        </li>
        <li><a href="${ path }/review/main">밀슐랭 리뷰</a></li>
        <li style="padding-right:0;">
	        <a href="${ path }/cscenter/notice">고객센터
	        	<ul class="main_nav_hover2">
	        		<li><a href="${ path }/cscenter/notice">공지사항</a></li>
	        		<li><a href="${ path }/cscenter/faq">자주 묻는 질문</a></li>
	        		<li><a href="${ path }/cscenter/inquiry">1:1문의</a></li>
	        	</ul>
	        </a>
        </li>
    </ul>
    <ul class="right_nav">
        <li class="nav_search">
            <form style=" position: relative;" action="${ path }/product/search" method="get">
                <input type="search" name="result" id="nav_search">
                <input type="submit" id="nav_search_but" value="">
            </form>
        </li>
        <c:if test="${ empty loginMember }">
	        <li class="nav_login">
	        	<a href="${ path }/member/login">
		        	<ul class="nav_login_hover">
		        		<li><a href="${ path }/member/enroll">회원가입</a></li>
		        		<li><a href="${ path }/member/login">로그인</a></li>
		        	</ul>
	        	</a>
	        </li>
        </c:if>
        <c:if test="${ not empty loginMember }">
        	<c:set var="adminYN" value="${ loginMember.role }" scope="session"></c:set>
        	<c:choose>
        		<c:when test='${ adminYN == "ROLE_ADMIN" }'>
		        	 <li class="nav_login">
			        	<a href="${ path }/mypage/updateMember">
				        	<ul class="nav_login_hover">
				        		<li><a href="${ path }/member/logout">로그아웃</a></li>
				        		<li><a href="${ path }/admin/main">관리자 페이지</a></li>
				        	</ul>
			        	</a>
			        </li>
        		</c:when>
        		<c:otherwise>
			        <li class="nav_login">
			        	<a href="${ path }/mypage/updateMember">
				        	<ul class="nav_login_hover">
				        		<li><a href="${ path }/member/logout">로그아웃</a></li>
				        		<li><a href="${ path }/mypage/updateMember">마이페이지</a></li>
				        	</ul>
			        	</a>
			        </li>
        		</c:otherwise>
		    </c:choose>

        </c:if>
     
        <a href="${ path }/mypage/shoppingBasket"><li class="nav_cart" ></li></a>
    </ul>
</nav>
