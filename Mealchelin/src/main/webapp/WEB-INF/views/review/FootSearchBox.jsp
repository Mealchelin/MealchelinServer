<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8" />
        <title>밀슐랭</title>
        <!--default css-->
        <link rel="stylesheet" href="${ path }/css/common.css" />

        <!-- 필요한 css -->
        <link rel="stylesheet" href="${ path }/css/review/FootSearchBox.css" />

        <!-- jquery -->
        <script src="${ path }/js/jquery-3.7.1.js"></script>
    </head>

    <body>
        <!-- 내용 넣기 -->
        <main>
            <section>
                <form action="${ path }/review/reviewEmpty">
                    <div id="re_bottomSearchBox">
                    	<!-- 
                        <select id="re_shearchBtn" name="period" id="">
                            <option value="all">전체</option>
                            <option value="1">한달</option>
                            <option value="3">3달</option>
                        </select>
                    	 -->
                        <select id="re_shearchBtn" name="searchType">
                            <option value="">전체</option>
                            <option value="title">제목</option>
                            <option value="writerId">아이디</option>
                        </select>
                        <input id="re_shearchBtn" type="text" name="searchText"/>
                        <input id="re_shearchBtn" type="submit" value="찾기" />
                    </div>
                </form>
            </section>
        </main>

        <!-- 필요한 js 밑에 추가-->
        <script type="text/javascript" src="${ path }/js/index.js"></script>
    </body>
</html>
