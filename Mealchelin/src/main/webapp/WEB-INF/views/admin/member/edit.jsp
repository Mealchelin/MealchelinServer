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

</head>

<body>
	<body>
	<div class="wrapper">
		
		<div class="main">

			<main class="content" style="background-color: #fff;">
				<div class="container-fluid p-0">
					<div class="row ad_mem_de">
                        <form method="POST">
                            <table class="col-12">
                                <thead class="ad_mem_th">
                                    <th colspan="2">회원 정보 수정</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ad_th">아이디</td>
                                        <td>${ member.id }</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">이름</td>
                                        <td>${ member.name }</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">가입일자</td>
                                        <td><fmt:formatDate value="${ member.enrollDate }" pattern="yyyy.MM.dd"/></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adMemEmail">이메일</label></td>
                                        <td><input type="email" name="adMemEmail" id="adMemEmail" value="${ member. email }"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adMemPh">휴대폰 번호</label></td>
                                        <td><input type="tel" id="adMemPh" name="adMemPh" value="${ member.phone }"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th" rowspan="3"> <label for="adMemAd">주소</label></td>
                                        <td style="border-bottom:none;" rowspan="3"><input type="text" id="adMemAdPost" name="adMemAdPost" value="${ member.postalCode }"> <button type="button" class="meal_btn2" onclick="adMem_execDaumPostcode()">우편번호</button>
                                            <br><input type="text" id="adMem_Ad" name="adMemAd" style="width: 305px;" value="${ member.address }">
                                            <br><input type="text" id="adMemDetailAd" name="adMemDetailAd" style="width: 305px;" value="${ member.addressDetail }">
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adMemBir">생년월일</label></td>
                                        <td><input type="text" id="adMemBir" name="adMemBir"  value="${ member.birth }"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adRandomPw">임시 비밀번호</label></td>
                                        <td><input type="text" id="adRandomPw" name="adRandomPw" value=""><button type="button" class="meal_btn2" onclick="adRandomPw_code()">임시 비밀번호 발급</button></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="margin:20px auto; width: 205px;">
                                <button type="submit" class="meal_btn3">수정</button>
                                <button type="button" class="meal_btn4" style="margin-left:5px;" onClick="window.close();">취소</button>
                            </div>
                        </form>
					</div>
				</div>
			</main>

		</div>
	</div>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/admin/app.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${ path }/js/admin/ad_member.js"></script> 
</body>

</html>