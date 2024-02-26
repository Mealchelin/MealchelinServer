<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
	
	<title>밀슐랭</title>

    <!-- 필요한 css -->
    <link href="${ path }/css/admin/app.css" rel="stylesheet">
    <link href="${ path }/css/admin/admin_add.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
        td.ad_th{
            background-color: #eee;
        }
        .ad_mem_de td{
            border:1px solid #ccc;
        }

    </style>
</head>

<body>
	<div class="wrapper">
		<!--사이드바-->
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${ path }/admin/main">
					<span class="align-middle"><img src="${ path }/img/all/logo4.png" width="100px"></span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-item">
						<a class="sidebar-link" href="${ path }/admin/main">
							<i class="align-middle" data-feather="home"></i> <span class="align-middle">홈</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${ path }/admin/member/adMember">
							<i class="align-middle" data-feather="user"></i> <span class="align-middle">회원 관리</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${ path }/admin/product/adProduct">
							<i class="align-middle" data-feather="shopping-bag"></i> <span class="align-middle">상품 목록 관리</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${ path }/admin/delivery/adDelivery">
							<i class="align-middle" data-feather="package"></i> <span class="align-middle">주문 관리</span>
						</a>
					</li>
					<!-- <li class="sidebar-item">
						<a class="sidebar-link" href="ad_category.html">
							<i class="align-middle" data-feather="folder"></i> <span class="align-middle">카테고리 관리</span>
						</a>
					</li> -->
					<li class="sidebar-item active">
						<a class="sidebar-link" href="${ path }/admin/post/adPost">
							<i class="align-middle" data-feather="edit"></i> <span class="align-middle">게시물 관리</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>

		<!--상단 바-->
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
					<i class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
								<i class="align-middle" data-feather="settings"></i>
							</a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
								<span class="text-dark"><i  class="align-middle me-2" data-feather="user"></i><b>관리자님</b> 어서오세요</span>
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="${ path }/"><i class="align-middle me-1" data-feather="monitor"></i> PC 홈페이지</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="smartphone"></i> 모바일 홈페이지</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="log-out"></i> 로그아웃</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>

			<!--메인 내용-->
			<main class="content">
				<div class="container-fluid p-0">
                    <div class="row ad_mem_de">
                        <h1 class="h3 mb-4" style="font-weight: 600;">리뷰 관리</h1>
                        <form>
						<div class="col-12">
							<div class="card">
								<table class="table my-4" style="width: 95%; margin:0 auto;">
									<tr>
                                        <td class="ad_th" width="25%">게시글 번호</td>
                                        <td width="25%">1</td>
                                        <td class="ad_th" width="25%">게시글 작성 날짜</td>
                                        <td width="25%">20204.02.21</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">작성자</td>
                                        <td>Baeksee</td>
                                        <td class="ad_th">별점</td>
                                        <td>
											4 / 5
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">상품명</td>
                                        <td>불고기 볶음밥</td>
                                        <td class="ad_th">조회수</td>
                                        <td>
											0
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">제목</td>
										<td colspan="3">맛있네요.</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">첨부파일</td>
										<td colspan="3">0182985y9.jpg</td>
                                    </tr>
									<tr>
										<td colspan="4" style="padding: 20px;">
											볶음밥이 맛있고, 조리하기 편하네요.<br>
                                            요새 먹었던 것 중 최고인 것 같습니다.<br>
                                            같이 들어있는 고기와 냉동 밥을 함께 딱~ ^^ 넣고 볶아주면 미식 요리 저리가라네요.
										</td>
									</tr>
									<tr>
										<td class="ad_th"><label for="adReviewShow">노출 여부</label></td>
                                        <td colspan="3">
											<label style="margin-right: 10px;"><input type="radio" checked name="adReviewShow" id="adReviewShow" value="Y" style="width: 20px;"/>노출</label>
                                            <label><input type="radio" name="adReviewShow" id="adReviewShow" value="N" style="width: 30px;"/>비노출</label>
										</td>
									</tr>
									</tr>
								</table>
								<div style="margin:0 auto; width: 205px; margin-bottom:30px;">
									<button type="submit" class="meal_btn3">수정</button>
									<button type="button" class="meal_btn4" style="margin-left:5px;" onClick="location.href='${ path }/admin/review/adReview'">목록</button>
								</div>
                            </div>
						</div>
                        </form>
					</div>
				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/admin/app.js"></script>
</body>

</html>