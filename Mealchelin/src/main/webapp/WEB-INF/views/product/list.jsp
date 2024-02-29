<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<c:set var="category" value="${ not empty param.category ? 'category='+=param.category+='&' : '' }"/>
<c:set var="sort" value="${ not empty param.sort ? 'sort='+=param.sort+='&' : '' }"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
	<title>밀슐랭</title>
    <!--default css-->
    <link rel="stylesheet" href="${ path }/css/common.css">
    <!-- 필요한 css -->
    <link rel="stylesheet" href="${ path }/css/product/productMain.css">
    
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
    	<!-- 섹션 1-->
        <!-- 카테고리 -->
        <section id="pd-section1">
            <div class="pd-main-navi">
                <h3 class="pd-main-heading">전체 상품</h3>
                <div class="pd-main-category">
                    <!-- get방식 리다이렉트 -->
                    <a href="${ path }/product/list?category=korean"  class="pd-main-category-name">한식</a>
                    <a href="${ path }/product/list?category=bunsik" class="pd-main-category-name">분식</a>
                    <a href="${ path }/product/list?category=chinese" class="pd-main-category-name">중식</a>
                    <a href="${ path }/product/list?category=japanese" class="pd-main-category-name">일식</a>
                    <a href="${ path }/product/list?category=western" class="pd-main-category-name">양식</a>
                    <a href="${ path }/product/list?category=southeast" class="pd-main-category-name">동남아</a>
                </div>
                <div class="pd-main-search">
                    <div class="pd-main-result">총 <b>${ listCount }</b>건</div>
                    <div class="pd-main-sort">
                        <!-- 비동기? --> 
                        <span>
                            <button class="pd-main-sort-btn" id="pd-btn-popular" 
                            onclick="location.href='${ path }/product/list?${ category }sort=popular'"
                            >주문 많은 순</button>
                        </span>
                        <span>
                            <button class="pd-main-sort-btn" id="pd-btn-lowestPrice"
                            onclick="location.href='${ path }/product/list?${ category }sort=lowest'"
                            >가격 낮은 순</button>
                        </span>
                        <span>
                            <button class="pd-main-sort-btn" id="pd-btn-highestPrice"
                            onclick="location.href='${ path }/product/list?${ category }sort=highest'"
                            >가격 높은 순</button>
                        </span>
                    </div>
                </div>
            </div>
        </section>


        <!-- 섹션2 -->
        <!-- jsp로 변경 시 c:if 문 사용하여 하나로 단축 -->
        <!-- 한 페이지 16개의 제품 노출 -->
        <section id="pd-section2">
            <div class="pd-main_new_menu">
            	<c:if test="${ listCount == 0 }">
<%--             		<jsp:include page="" /> --%>
            	</c:if>
	            <c:forEach var="product" items="${ list }">
	                <div class="pd-main_new_box">
	                    <a href="${ path }/product/view?no=${product.no}"><div class="pd-main_new_box_img"><img src="${ path }/img/product/${ product.image }"></div></a>
	                    <div class="pd-main_new_box_txt">
	                        <div class="pd-main_new_txt_name">${ product.name }</div>
	                        <div class="pd-main_new_txt_brand">${ product.brand }</div>
	                        <div class="pd-main_new_txt_price">
	                        	<fmt:formatNumber  value="${product.price}" type="number"/>원
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
            </div>
        </section>

        <!-- 섹션 3 -->
        <!-- 페이징 버튼 -->
        <section id="pd-section3">
            <div class="pd-paging">
                <!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/product/list?${ category }${ sort }page=${ pageInfo.prevPage }'">&lt;</button>

				<!--  10개 페이지 목록 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">
							<button disabled>${ current }</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='${ path }/product/list?${ category }${ sort }page=${ current }'">${ current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/product/list?${ category }${ sort }page=${ pageInfo.nextPage }'">&gt;</button>
            </div>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
    <script type="text/javascript">
	    $(document).ready(() => {
	    	
 	    	// 선택된 카테고리 css 변경
 	    	let category = '${ param.category }';
		    let className = ' pd-main-selectedC';
		    let korean = document.getElementsByClassName('pd-main-category-name')[0];
		    let bunsik = document.getElementsByClassName('pd-main-category-name')[1];
		    let chinese = document.getElementsByClassName('pd-main-category-name')[2];
		    let japanese = document.getElementsByClassName('pd-main-category-name')[3];
		    let western = document.getElementsByClassName('pd-main-category-name')[4];
		    let southeast = document.getElementsByClassName('pd-main-category-name')[5];
	    	
	    	if (korean.href.includes(category) && !category == '' ) {
	    		korean.className += className;
			} else if (bunsik.href.includes(category) && !category == '' ) {
				bunsik.className += className;
			} else if (chinese.href.includes(category) && !category == '') {
				chinese.className += className;
			} else if (japanese.href.includes(category) && !category == '') {
				japanese.className += className;
			} else if (western.href.includes(category) && !category == '') {
				western.className += className;
			} else if (southeast.href.includes(category) && !category == '') {
				southeast.className += className;
			} 
 	    	$('.pd-main-selectedC').css({"color": "#3B6C51", "font-weight": "bolder", "background-color": "#F6F6F6"})


			// 선택된 분류 방식 css 변경
			let sort = '${ param.sort }';
			let className2 = ' pd-main-selectedS';
			let popular = document.getElementsByClassName('pd-main-sort-btn')[0];
			let lowest = document.getElementsByClassName('pd-main-sort-btn')[1];
			let highest = document.getElementsByClassName('pd-main-sort-btn')[2];
			
			if (popular.id.includes(sort)) {
				popular.className += className2;
			} else if (lowest.id.includes(sort)) {
				lowest.className += className2;
			} else if (highest.id.includes(sort)) {
				highest.className += className2;
			}
			$('.pd-main-selectedS').css({"color": "#191919", "font-weight": "bolder"})
	    })
    </script>
</body>

</html>