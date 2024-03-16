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
    <!-- 메인페이지 css -->
    <link rel="stylesheet" href="${ path }/css/index.css">
    <!-- 슬라이더 css -->
    <link rel="stylesheet" href="${ path }/slick/slick.css"/>
    <link rel="stylesheet" href="${ path }/slick/slick-theme.css"/>
    
    <script src="${ path }/js/jquery-3.7.1.js"></script>
    
</head>
<body>
    <!-- 플로팅 배너(TOP버튼)-->
    <div class="top" id="topBtn">
    </div>
    
    <!-- 네비게이션 헤더 -->
    <header id="header">
    	<jsp:include page="./layout/header.jsp" />
    </header>
    
    <main>
        <!-- 섹션1 - 배너 -->
        <section id="section1">
            <div class="banner-slide">
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>프리미엄 초이스 등급</h3><h2>고급진 스테이크를 선물하세요.</h2></div>
                    <img src="${ path }/img/banner_img01.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>다양한 재료로 만드는 타코</h3><h2>내가 원하는대로 만드세요.</h2></div>
                    <img src="${ path }/img/banner_img04.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>스테이크는 밀슐랭</h3><h2>집에서도 맛있는 스테이크를 맛보세요.</h2></div>
                    <img src="${ path }/img/banner_img05.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>딸기 디저트 런칭 예정</h3><h2>딸기 디저트 밀키트를 런칭할 예정입니다.</h2></div>
                    <img src="${ path }/img/banner_img02.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>집에서 만나는 레스토랑</h3><h2>다양한 음식으로 나만의 레스토랑을 여세요.</h2></div>
                    <img src="${ path }/img/banner_img03.jpg">
                </div>
            </div>
            <div></div>
        </section>
    
        <!-- 섹션2 -->
        <section id="section2">
            <div class="main_pick">
                <div class="pick_txt">
                    <h3># 밀슐랭'S PICK</h3>
                    밀슐랭이 선택한 베스트 상품<br>프리미엄 밀키트를 만나보세요.
                    <div class="main_pages">
                        <div class="main_pages_prev" id="prev1"></div>
                        <div class="main_pages_next" id="next1"></div>
                    </div>
                </div>
                <div class="pick_list">
                    <!--1 페이지-->
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=25">
                        <div class="pick_hover">감바스 알 하이요<br>13,500원</div>
                        <img src="${ path }/img/pick_img01.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=27">
                            <div class="pick_hover">명란 오일 생면 파스타<br>18,900원</div>
                            <img src="${ path }/img/pick_img02.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=81">
                            <div class="pick_hover">로제 스테이크 파스타<br>14,900원</div>
                            <img src="${ path }/img/pick_img03.jpg" width="266px">
                        </a>
                    </div>
                    <!--2 페이지-->
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=10">
                            <div class="pick_hover">안동식 순살 찜닭<br>14,900원</div>
                            <img src="${ path }/img/pick_img04.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=4">
                            <div class="pick_hover">닭가슴살 토마토리조또<br>19,800원</div>
                            <img src="${ path }/img/pick_img05.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="${ path }/product/view?no=11">
                            <div class="pick_hover">이탈리안 볼로네제 라자냐<br>16,000원</div>
                            <img src="${ path }/img/pick_img06.jpg" width="266px">
                        </a>
                    </div>
                </div>            
            </div>
        </section>

        <!-- 섹션3 -->
        <section id="section3">
            <div class="main_sub_banner">
                <h3>간편하고 신선한 밀키트를<br>밀슐랭과 함꼐 한 자리에서 즐겨보세요.</h3>
            </div>
        </section>

        <!-- 섹션4 -->
        <section id="section4">
            <h3># NEW_신메뉴 소개</h3>
            <div class="main_new_menu">
	            <c:forEach var="product" items="${ list }">
	                <div class="main_new_box">
	                    <a href="${ path }/product/view?no=${product.no}"><div class="main_new_box_img"><img src="${ path }/img/product/${ product.image }"></div></a>
	                    <div class="main_new_box_txt">
	                        <div class="main_new_txt_name">${ product.name }</div>
	                        <div class="main_new_txt_brand">${ product.brand }</div>
	                        <div class="main_new_txt_price"><fmt:formatNumber  value="${product.price}" type="number"/>원</div>
	                    </div>
	                </div>
				</c:forEach>
            </div>
        </section>

        <!-- 섹션5 -->
        <section id="section5">
            <div class="main_review">
                <div class="main_review_txt">
                    <h3># REVIEW</h3>
                    고객님들이 직접 작성한<br>리얼 리뷰를 확인해보세요.
                    <div class="main_pages">
                        <div class="main_pages_prev" id="prev2"></div>
                        <div class="main_pages_next" id="next2"></div>
                    </div>
                </div>
                <div class="main_review_list">
                    <!--1 페이지-->
                    <c:forEach var="review" items="${ review }">
                    <div class="m_review_box">
                        <a href="${ path }/review/reviewDetail?reviewNo=${ review.reviewNo }">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">${ review.name }</div>
                                <div class="m_review_con">${ review.content }</div>
                                <div class="m_review_star">
									<c:choose>
									<c:when test="${ review.rated == 1}">
										<span class="starR"><span id="re_star">★</span>★★★★</span>
									</c:when>
									<c:when test="${ review.rated  == 2 }">
										<span class="starR"><span id="re_star">★★</span>★★★</span>
									</c:when>
									<c:when test="${ review.rated  == 3}">
										<span class="starR"><span id="re_star">★★★</span>★★</span>
									</c:when>
									<c:when test="${ review.rated  == 4}">
										<span class="starR"><span id="re_star">★★★★</span>★</span>
									</c:when>
									<c:when test="${ review.rated  == 5}">
										<span class="starR"><span id="re_star">★★★★★</span></span>
									</c:when>
									<c:otherwise> 
											<span class="starR"><span class="starR">★</span>★★★★</span>
									</c:otherwise>
								</c:choose>
								</div>
                                <div class="m_review_date">${ review.rgstrDate }</div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                    
                </div>
            </div>
        </section>
    </main>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="./layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${ path }/slick/slick.min.js"></script>
    <script type="text/javascript" src="${ path }/js/index.js"></script>
</body>
</html>
