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
        .ad_mem_de td{
            padding: 7px 10px;
        }

        input{
            padding:3px 5px;
        }
    </style>

</head>

<body>
	<body>
	<div class="wrapper">
		
		<div class="main">

			<main class="content" style="background-color: #fff;">
				<div class="container-fluid p-0">
					<div class="row ad_mem_de">
                        <form method="POST" action="${ path }/admin/delivery/edit?no=${ orders.orderNo }">
                            <table class="col-12">
                                <thead class="ad_mem_th">
                                    <th colspan="4">주문 관리</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ad_th" id="adBuyNo">주문 번호</td>
                                        <td>${ orders.orderNo }</td>
                                        <td class="ad_th" id="adBuyName">주문 날짜</td>
                                        <td><fmt:formatDate value="${ orders.orderDate }" pattern="yyyy.MM.dd"/></td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th" id="adBuyName">상품명</td>
                                        <td colspan="3">${ orders.name }</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th" id="adBuyCount">상품 수</td>
                                        <td>${ orders.sumQ }</td>
                                        <td class="ad_th" id="adBuyName">상품 금액</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.payMent}" />원</td>
                                    </tr>
<!--                                <tr>
                                        <td class="ad_th" id="adBuyCount">배송비</td>
                                        <td>3,000원</td>
                                        <td class="ad_th" id="adBuyName">결제 금액</td>
                                        <td>18,900원</td>
                                    </tr>
 -->                                    <tr>
                                        <td class="ad_th"><label for="adBuyCat">배송 상태</label></td>
                                        <td>
                                            <select name="shipStatus" id="adBuycat" class="adCat" onchange="CancelSelect(this)">
                                                <option selected value="결제완료">결제완료</option>
                                                <option value="배송준비중">배송준비중</option>
                                                <option value="배송중">배송중</option>
                                                <option value="배송완료">배송완료</option>
                                                <option value="결제취소">결제취소</option>
                                            </select>
                                        </td>
                                        <td class="ad_th" id="adBuyCode">결제 방법</label></td>
                                        <td>${ orders.payMent }</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th" id="adBuyerName">주문자 이름</td>
                                        <td>${ orders.mname }</td>
                                        <td class="ad_th" id="adBuyerId">주문자 아이디</td>
                                        <td>${ orders.memId }</td>
                                    </tr>
                                    <tr class="ad_mem_th">
                                        <td colspan="4">배송지 관리</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th"><label for="adDeliName">수취인명</label></td>
                                        <td>${ orders.recipient }</td>
                                        <td class="ad_th">전화번호</td>
                                        <td>${ orders.phone }</td>
                                    </tr>
                                    <tr>
                                        <td class="ad_th" rowspan="3"> <label for="adDeliAd">배송지 주소</label></td>
                                        <td style="border-bottom:none;" rowspan="3"colspan="3"> 우편번호 : ${ orders.postalCode }
                                            <br>${ orders.shipAddress }
                                            <br>${ orders.shipAddressDetail }
                                        </td>
                                    </tr>
<!--                                <tr>
                                        <td class="ad_th" rowspan="3"> <label for="adDeliAd">배송지 주소</label></td>
                                        <td style="border-bottom:none;" rowspan="3"colspan="3"><input type="text" id="adDeliAdPost" name="adDeliAd"> <button type="button" class="meal_btn2" onclick="adDeli_execDaumPostcode()">우편번호</button>
                                            <br><input type="text" id="adDeli_Ad" name="adDeliAd" style="width: 305px;">
                                            <br><input type="text" id="adDeliDetailAd" name="adDeliAd" style="width: 305px;">
                                        </td>
                                    </tr> -->
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td class="ad_th">받을 장소</td>
                                        <td colspan="3">${ orders.request }</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table id="cancelInfo"  class="col-12">
                                <thead class="ad_mem_th">
                                    <th colspan="4">취소 정보</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ad_th"><label for="adCancelReason">취소 사유</label></td>
                                        <td>
                                            <select name="adCancelReason" id="adCancelReason" class="adCat">
                                                <option selected value="">단순변심</option>
                                                <option value="">상품 옵션 변경</option>
                                                <option value="">추가 주문</option>
                                                <option value="">결제 수단 변경</option>
                                                <option value="">배송 정보 변경</option>
                                                <option value="">상품 가격</option>
                                            </select>
                                        </td>
                                        <td class="ad_th"><label for="adCancelStatus">취소 상태</label></td>
                                        <td>
                                            <label style="margin-right: 10px;"><input type="radio" checked name="adCancelStatus" id="adCancelStatus" value="Y" style="width: 20px;"/>취소 완료</label>
                                            <label><input type="radio" name="adCancelStatus" id="adCancelStatus" value="N" style="width: 20px;"/>취소 반려</label>
                                        </td>
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
    <script type="text/javascript" src="${ path }/js/admin/ad_delivery.js"></script> 
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	var selectedStatus = '${ orders.shipStatus }';
    	let adBuycat = document.getElementById('adBuycat');
    	
    	for (var i = 0; i < adBuycat.options.length; i++) {
    	    if (adBuycat.options[i].value === selectedStatus) {
    	    	adBuycat.options[i].selected = true;
    	        break;
    	    }
    	}
    }
    </script>
</body>

</html>