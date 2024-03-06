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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    
    <!-- jquery -->
    <script src="${ path }/js/jquery-3.7.1.js"></script>
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
					<li class="sidebar-item active">
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
					<li class="sidebar-item">
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
		                        <a class="dropdown-item" href="${ path }/"><i class="align-middle me-1" data-feather="smartphone"></i> 모바일 홈페이지</a>
                       			<div class="dropdown-divider"></div>
                       			<a class="dropdown-item" href="${ path }/member/logout"><i class="align-middle me-1" data-feather="log-out"></i> 로그아웃</a>
                     		</div>							
						</li>
					</ul>
				</div>
			</nav>

			<!--메인 내용-->
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3" style="font-weight: 600;">회원 관리</h1>
                    <form style="display: flex;">
                        <div class="col-12 col-lg-4">
                            <input type="search" name="ad_memberSearch" id="ad_memberSearch" class="form-control mb-4" placeholder="아이디를 입력하세요." style="font-size: 13px;">
                        </div>
                        <div class="col-12 col-lg-4" style="margin-left:10px;">
                            <input type="submit" value="검색" class="btn btn-secondary" style="font-size: 13px;">
                        </div>
                    </form>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table class="table table-hover my-0" style="text-align: center;">
									<thead>
										<tr>
											<th>이름</th>
                                            <th>아이디</th>
											<th class="d-none d-xl-table-cell" width="20%">전화번호</th>
											<th class="d-none d-xl-table-cell" width="25%">이메일</th>
											<th class="d-none d-xl-table-cell" width="20%">가입일자</th>
										</tr>
									</thead>
									<tbody>
										<tr style="cursor: pointer;" onclick="window.open('${ path }/admin/member/edit', '_blank', 'width=700, height=550'); return false;">
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
										<tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
                                        <tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
										<tr>
											<td>이하윤</td>
											<td>hongu90</td>
											<td class="d-none d-xl-table-cell">010-0000-0000</td>
											<td class="d-none d-xl-table-cell">hong@gmail.com</td>
                                            <td class="d-none d-xl-table-cell">2023.08.20</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
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