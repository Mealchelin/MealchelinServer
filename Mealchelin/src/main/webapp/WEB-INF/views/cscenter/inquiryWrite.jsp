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
    <link rel="stylesheet" href="${ path }/css/cscenter/inquiryWrite.css">
    
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

        <!-- 제목, 내용, 버튼 -->
        <!-- textarea 개행문자: &#10;  -->
        <!-- 폼태그로 바꿔야 함 -->
        <section id="cs-section2">
            <form class="cs-inquiry-wrap" action="" method="">
                <!-- 내용 -->
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">제목</div>
                    <textarea class="cs-inquiry-data" name="name" cols="100" rows="1" placeholder="제목을 입력해주세요."></textarea>
                </div>
                <div class="cs-inquiry-content">
                    <div class="cs-inquiry-column">내용</div>
                    <!-- ck에디터 찾아보기 -->
                    <!-- <div id="classic" class="cs-inquiry-data" name="content"></div> -->
                    <textarea class="cs-inquiry-data" name="content" id="classic" placeholder="내용을 입력해주세요."></textarea>
                </div>
                <!-- 버튼 -->
                <div class="cs-inquiryBtns">
                    <input type="submit" class="cs-inquiryBtn cs-inquiry-submit" value="등록"/>
                    <input type="button" class="cs-inquiryBtn cs-inquiry-cancle" value="취소" onclick="location.href='${ path }/cscenter/inquiry'"/>
                </div>
            </form>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/classic/translations/ko.js"></script>
    <script>
        ClassicEditor
            .create( document.querySelector( '#classic' ), {
                removePlugins: [ 'Heading' ],
                language: 'ko'
            })
            .catch( error => {
                console.error( error );
            } );
    </script>
</body>

</html>