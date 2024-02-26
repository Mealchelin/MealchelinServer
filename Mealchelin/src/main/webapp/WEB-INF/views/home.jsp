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
                    <div class="banner-box-txt"><h3>프리미엄 초이스 등급</h3><h2>고급진 스테이크를 선물하세요.</h2></div>
                    <img src="${ path }/img/banner_img01.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>프리미엄 초이스 등급</h3><h2>고급진 스테이크를 선물하세요.</h2></div>
                    <img src="${ path }/img/banner_img01.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>프리미엄 초이스 등급</h3><h2>고급진 스테이크를 선물하세요.</h2></div>
                    <img src="${ path }/img/banner_img01.jpg">
                </div>
                <div class="banner-box">
                    <div class="banner-box-txt"><h3>프리미엄 초이스 등급</h3><h2>고급진 스테이크를 선물하세요.</h2></div>
                    <img src="${ path }/img/banner_img01.jpg">
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
                        <a href="">
                        <div class="pick_hover">샐러드<br>18,900원</div>
                        <img src="${ path }/img/pick_img01.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="">
                            <div class="pick_hover">스테이크<br>18,900원</div>
                            <img src="${ path }/img/pick_img02.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="">
                            <div class="pick_hover">스튜<br>18,900원</div>
                            <img src="${ path }/img/pick_img03.jpg" width="266px">
                        </a>
                    </div>
                    <!--2 페이지-->
                    <div class="pick_box">
                        <a href="">
                            <div class="pick_hover">샐러드2<br>18,900원</div>
                            <img src="${ path }/img/pick_img01.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="">
                            <div class="pick_hover">스테이크2<br>18,900원</div>
                            <img src="${ path }/img/pick_img02.jpg" width="266px">
                        </a>
                    </div>
                    <div class="pick_box">
                        <a href="">
                            <div class="pick_hover">스튜2<br>18,900원</div>
                            <img src="${ path }/img/pick_img03.jpg" width="266px">
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
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_01.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_02.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">기사식당 돼지불백(2-3인)</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">14,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_03.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">소고기뭇국</div>
                        <div class="main_new_txt_brand">쿡킷</div>
                        <div class="main_new_txt_price">16,800원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_04.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_05.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_06.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">바질 크림 빠네파스타 밀키트 2인분</div>
                        <div class="main_new_txt_brand">프레시지</div>
                        <div class="main_new_txt_price">13,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_07.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">18,900원</div>
                    </div>
                </div>
                <div class="main_new_box">
                    <a href=""><div class="main_new_box_img"><img src="${ path }/img/new_08.jpg"></div></a>
                    <div class="main_new_box_txt">
                        <div class="main_new_txt_name">안동식 순살 찜닭</div>
                        <div class="main_new_txt_brand">마이셰프</div>
                        <div class="main_new_txt_price">18,900원</div>
                    </div>
                </div>
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
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요. 정말 맛있어요. 정말 맛있어요. 정말 맛있어요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <!--2 페이지-->
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요2</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <!--3 페이지-->
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요3</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
                    <div class="m_review_box">
                        <a href="">
                            <div class="m_review_img"><img src="${ path }/img/review_img.jpg"></div>
                            <div class="m_review_txt">
                                <div class="m_review_title">너무 맛있어요</div>
                                <div class="m_review_con">여기서 산 밀키트 중에서 가장 맛있어요. 양도 적당하고 너무 이쁘게 잘 꾸며지네요.</div>
                                <div class="m_review_star">★★★★★</div>
                                <div class="m_review_date">2023.03.04</div>
                            </div>
                        </a>
                    </div>
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
