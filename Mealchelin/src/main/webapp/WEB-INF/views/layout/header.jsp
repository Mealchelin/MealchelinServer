<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<nav class="header_nav">
    <ul class="left_nav">
        <a href=""><li class="logo1_nav"></li></a>
    </ul>
    <ul class="main_nav">
        <li><a href="${ path }/brand/information">브랜드</a></li>
        <li><a href="">베스트</a></li>
        <li><a href="">신상품</a></li>
        <li><a href="">전체상품</a></li>
        <li><a href="">밀슐랭 리뷰</a></li>
        <li style="padding-right:0;"><a href="">고객센터</a></li>
    </ul>
    <ul class="right_nav">
        <li class="nav_search">
            <form style=" position: relative;">
                <input type="search" name="nav_search" id="nav_search">
                <input type="submit" id="nav_search_but" value="">
            </form>
        </li>
        <a href=""><li class="nav_login"></li></a>
        <a href=""><li class="nav_cart" ></li></a>
    </ul>
</nav>