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
				<!-- 
                 데이터 연결 성공
                <c:forEach var="product" items="${ list }">
                	<h2>${ product.name }</h2>
                </c:forEach>.
				-->
               
                
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
                            onclick="location.href='${ path }/product/list?<c:if test="${ not empty param.category }">category=<c:out value="${ param.category }"/>&</c:if>sort=popular'"
                            >인기순</button>
                        </span>
                        <span>
                            <button class="pd-main-sort-btn" id="pd-btn-lowestPrice"
                            onclick="location.href='${ path }/product/list?<c:if test="${ not empty param.category }">category=<c:out value="${ param.category }"/>&</c:if>sort=lowest'"
                            >가격 낮은 순</button>
                        </span>
                        <span>
                            <button class="pd-main-sort-btn" id="pd-btn-highestPrice"
                            onclick="location.href='${ path }/product/list?<c:if test="${ not empty param.category }">category=<c:out value="${ param.category }"/>&</c:if>sort=highest'"
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
	            <c:forEach var="product" items="${ list }">
	                <div class="pd-main_new_box">
	                    <a href="${ path }/product/view"><div class="pd-main_new_box_img"><img src="../img/new_01.jpg"></div></a>
	                    <div class="pd-main_new_box_txt">
	                        <div class="pd-main_new_txt_name">${ product.name }</div>
	                        <div class="pd-main_new_txt_brand">${ product.brand }</div>
	                        <div class="pd-main_new_txt_price">${ product.price }</div>
	                    </div>
	                </div>
	            </c:forEach>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_02.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">기사식당 돼지불백(2-3인)</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">14,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_03.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">소고기뭇국</div>
                        <div class="pd-main_new_txt_brand">쿡킷</div>
                        <div class="pd-main_new_txt_price">16,800원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_04.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_05.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_06.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">바질 크림 빠네파스타 밀키트 2인분</div>
                        <div class="pd-main_new_txt_brand">프레시지</div>
                        <div class="pd-main_new_txt_price">13,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_07.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_08.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_01.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_02.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">기사식당 돼지불백(2-3인)</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">14,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_03.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">소고기뭇국</div>
                        <div class="pd-main_new_txt_brand">쿡킷</div>
                        <div class="pd-main_new_txt_price">16,800원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_04.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_05.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="pd-main_new_txt_brand">마이셰프</div>
                        <div class="pd-main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="pd-main_new_box">
                    <a href=""><div class="pd-main_new_box_img"><img src="../img/new_06.jpg"></div></a>
                    <div class="pd-main_new_box_txt">
                        <div class="pd-main_new_txt_name">바질 크림 빠네파스타 밀키트 2인분</div>
                        <div class="pd-main_new_txt_brand">프레시지</div>
                        <div class="pd-main_new_txt_price">13,900원</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 섹션 3 -->
        <!-- 페이징 버튼 -->
        <section id="pd-section3">
            <div class="pd-paging">
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
    <script type="text/javascript">
	    $(document).ready(() => {
	    	// 가격 , 원 추가  
	    	let price = $('.pd-main_new_txt_price').html();
 	    	let price2 = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
 	    	$('.pd-main_new_txt_price').html(price2 + "원");
 	    	
 	    	// 선택된 카테고리 css 변경
 	    	let category = "<c:out value="${ param.category }"/>";
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
			let sort = "<c:out value="${ param.sort }"/>";
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