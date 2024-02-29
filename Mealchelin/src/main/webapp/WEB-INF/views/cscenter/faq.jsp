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
    <link rel="stylesheet" href="${ path }/css/cscenter/cscenterListCommon.css">
    <link rel="stylesheet" href="${ path }/css/cscenter/faqList.css">
    
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
        <!-- 페이지명/페이지 이동버튼 섹션 -->
        <section id="cs-section1">
            <div class="cs-list-header">
                <h3>자주 묻는 질문</h3>
                <div class="cs-list-btns">
                    <button class="cs-notice" onclick="location.href='${ path }/cscenter/notice'">공지사항</button>
                    <button class="cs-faq active" onclick="location.href='${ path }/cscenter/faq'">자주 묻는 질문</button>
                    <button class="cs-inquiry" onclick="location.href='${ path }/cscenter/inquiry'">1:1 문의</button>
                </div>
            </div>
        </section>
        <!-- 실 내용 섹션 -->
        <section id="cs-section2">
            <div class="cs-list-title">
                <div class="cs-faq-number">번호</div>
                <div class="cs-faq-category">카테고리</div>
                <div class="cs-faq-title">제목</div>
            </div>
            <ul class="cs-list-ul">
                <li class="cs-list-content cs-faq-list">
                    <div class="cs-faq-number">205</div>
                    <div class="cs-faq-category">취소/교환/환불</div>
                    <div class="cs-faq-title cs-list-ul-title">교환(반품) 진행 시 배송비가 부과 되나요?</div>
                </li>
                <div class="cs-faq-detail" hidden>
                    ■ 교환(반품) 진행 시, 배송비 안내
                    <br>
                    - 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
                    <br>
                    - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
                </div>
                <li class="cs-list-content cs-faq-list">
                    <div class="cs-faq-number">205</div>
                    <div class="cs-faq-category">취소/교환/환불</div>
                    <div class="cs-faq-title cs-list-ul-title">교환(반품) 진행 시 배송비가 부과 되나요?</div>
                </li>
                <div class="cs-faq-detail" hidden>
                    ■ 교환(반품) 진행 시, 배송비 안내
                    <br>
                    - 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
                    <br>
                    - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
                </div>
                <li class="cs-list-content cs-faq-list">
                    <div class="cs-faq-number">205</div>
                    <div class="cs-faq-category">취소/교환/환불</div>
                    <div class="cs-faq-title cs-list-ul-title">dtd교환(반품) 진행 시 배송비가 부과 되나요?</div>
                </li>
                <div class="cs-faq-detail" hidden>
                    ■ 교환(반품) 진행 시, 배송비 안내
                    <br>
                    - 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
                    <br>
                    - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
                </div>
                <li class="cs-list-content cs-faq-list">
                    <div class="cs-faq-number">205</div>
                    <div class="cs-faq-category">취소/교환/환불</div>
                    <div class="cs-faq-title cs-list-ul-title">asdfasdf교환(반품) 진행 시 배송비가 부과 되나요?</div>
                </li>
                <div class="cs-faq-detail" hidden>
                    ■ 교환(반품) 진행 시, 배송비 안내
                    <br>
                    - 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
                    <br>
                    - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
                </div>
                <li class="cs-list-content cs-faq-list">
                    <div class="cs-faq-number">205</div>
                    <div class="cs-faq-category">취소/교환/환불</div>
                    <div class="cs-faq-title cs-list-ul-title">123qwdasdazdfc교환(반품) 진행 시 배송비가 부과 되나요?</div>
                </li>
                <div class="cs-faq-detail" hidden>
                    ■ 교환(반품) 진행 시, 배송비 안내
                    <br>
                    - 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
                    <br>
                    - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
                </div>
            </ul>
        </section>
        <!-- 페이징 버튼 섹션 -->
        <section id="cs-section3">
            <div class="cs-paging">
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
            </div>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
    <script type="text/javascript" src="${ path }/js/cscenter/faqList.js"></script>
</body>

</html>