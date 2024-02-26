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
    
    <!-- jquery -->
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
	<style>
        input{
            padding:3px 5px;
        }

        .ck.ck-editor {
            max-width: 590px;
            margin: 5px 0;
        }
        .ck-editor__editable {
            min-height: 300px;
        }
    </style>

</head>

<body>
	<body>
	<div class="wrapper">
		
		<!--상단 바-->
		<div class="main">

			<main class="content" style="background-color: #fff;">
				<div class="container-fluid p-0">
					<div class="row ad_mem_de">
                        <form>
                            <table class="col-12">
                                <thead class="ad_mem_th">
                                    <th colspan="4">상품 등록</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ad_th"><label for="adProShow">노출 상태</label></td>
                                        <td>
                                            <label style="margin-right: 10px;"><input type="radio" checked name="adProShow" id="adProShow" value="Y" style="width: 20px;"/>노출</label>
                                            <label><input type="radio" name="adProShow" id="adProShow" value="N" style="width: 20px;"/>비노출</label>
                                        </td>
                                        <td class="ad_th"><label for="adBuyShow">판매 상태</label></td>
                                        <td>
                                            <label style="margin-right: 10px;"><input type="radio" checked name="adBuyShow" id="adBuyShow" value="Y" style="width: 20px;"/>판매</label>
                                            <label><input type="radio" name="adBuyShow" id="adBuyShow" value="N" style="width: 20px;"/>판매 중지</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adProName">상품명</label></td>
                                        <td><input type="text" name="adProName" id="adProName" value="바질 크림 빠네 파스타 밀키트 2인분"></td>
                                        <td class="ad_th">등록 날짜</td>
                                        <td>2024-02-20</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adProCat">카테고리</label></td>
                                        <td>
                                            <select name="adProCat" id="adProCat" class="adCat">
                                                <option selected value="">양식</option>
                                                <option value="">중식</option>
                                                <option value="">한식</option>
                                                <option value="">일식</option>
                                                <option value="">분식</option>
                                                <option value="">동남아</option>
                                            </select>
                                        </td>
                                        <td class="ad_th"><label for="adProCode">상품 코드</label></td>
                                        <td><input type="number" name="adProCode" id="adProCode" value="001"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adProBrand">브랜드</label></td>
                                        <td><input type="text" name="adProBrand" id="adProBrand" value="마이셰프"></td>
                                        <td class="ad_th"><label for="adProPrice">판매가</label></td>
                                        <td><input type="number" name="adProPrice" id="adProPrice" value="18900"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adProAmount">재고</label></td>
                                        <td><input type="number" name="adProAmount" id="adProAmount" value="9999" placeholder="최대 재고: 9999"></td>
                                        <td class="ad_th"><label for="adProWeight">중량</label></td>
                                        <td><input type="text" name="adProWeight" id="adProWeight" value="1kg"></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">상품 이미지 등록</td>
                                        <td colspan="3">
                                            <div class="adProImg"></div>
                                            <input type="file" name="adProImg" id="adProImg">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adProDetail">상품 상세 설명</label></td>
                                        <td colspan="3"><textarea name="adProDetail" id="adProDetail"></textarea></td>
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
   	<script>
        ClassicEditor
            .create( document.querySelector( '#adProDetail' ))
            .catch( error => {
                console.error( error );
            } );
    </script> 
</body>

</html>