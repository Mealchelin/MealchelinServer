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
    <link rel="stylesheet" href="${ path }/css/pay/shipChange.css">
    
    <!-- jquery -->
    <script src="${ path }/js/jquery-3.7.1.js"></script>

</head>


<body>
	<main>
        <section>
            <h3 class="myadress">배송지 목록</h3>
<%--             <form id="defaultLocation" action="${ path }/payment/shipChange" method="post"> --%>
	            <c:forEach var="shippingLocation" items="${ list }" varStatus="st">
		            <div class="mytableDiv">
		                <table class="mytatble" style="margin: 0 auto; width: 600px;">
		                    <colgroup>
		                    <col style="width: 44px">
		                    <col style="width: 95px">
		                    <col style="width: 460px">
		                    <col style="width: 33px">
		                    <col style="width: 32px">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <td class="mytable_check" rowspan="5"><input type="checkbox" id="myaddressNow${ st.index }" class="myCheckBoxs" name="ckShipNo" value="${ shippingLocation.shipNo }" <c:if test="${ st.index == 0 }">checked</c:if>><label for="myaddressNow${ st.index }"></label></td>
		                            <td class="mytable_type" rowspan="5">${ shippingLocation.shipName }</td>
		                            <td class="mytable_name">${ shippingLocation.recipient }</td>
		                        </tr>
		                        <tr>
		                            <td class="mytable_number">${ shippingLocation.phone }</td>
		                        </tr>
		                        <tr>
		                            <td class="mytable_addressNumber">${ shippingLocation.postalCode }</td>
		                        </tr>
		                        <tr>
		                            <td class="mytable_address">${ shippingLocation.shipAddress }</td>
		                        </tr>
		                        <tr>
		                            <td class="mytable_addressDetail">${ shippingLocation.shipAddressDetail }</td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
	            </c:forEach>
	            <button class="myform_submit" onclick="changeShipLocation()">배송지 선택</button>
<!--             </form> -->
        </section>
    </main>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/admin/app.js"></script>
    <script type="text/javascript" src="${ path }/js/mypage/shippingLocation.js"></script>
   	<script>
	   	        
	   	document.addEventListener('DOMContentLoaded', function () {
			var checkboxes = document.querySelectorAll('.myCheckBoxs');
	
			checkboxes.forEach(function (checkbox) {
				checkbox.addEventListener('click', function () {
					// 모든 체크박스의 체크를 해제
					checkboxes.forEach(function (otherCheckbox) {
						if (otherCheckbox !== checkbox) {
							otherCheckbox.checked = false;
						}
					});
				});
			});
		});
	   	
	   	
	   	
	   	function changeShipLocation() {
	   	    var checkedCheckbox = document.querySelector('input[type="checkbox"]:checked');

	   	    if (checkedCheckbox) {
	   	    	
	   	        console.log(checkedCheckbox); // 콘솔에 체크된 체크박스를 출력합니다.
	   	        let shipId = checkedCheckbox.id;
	   	        let shipNo = checkedCheckbox.value;
	   	     	const last = parseInt(shipId.charAt(shipId.length - 1));
	   	     	
				if ('${list[0].shipNo}' == shipNo) {
					console.log(1);
					opener.document.getElementById('shipNo').value = parseInt("${list[0].shipNo}");
					opener.document.getElementById('shipname').innerText = '${list[0].recipient}';
					opener.document.getElementById('shipphone').innerText = '${list[0].phone}';
					opener.document.getElementById('shipaddress').innerText = '${list[0].shipAddress}';
					opener.document.getElementById('shipaddressdetail').innerText = '${list[0].shipAddressDetail}';
				} else if ('${list[1].shipNo}' == shipNo) {
					console.log(2);
					opener.document.getElementById('shipNo').value = "${list[1].shipNo}";
					opener.document.getElementById('shipname').innerText = '${list[1].recipient}';
					opener.document.getElementById('shipphone').innerText = '${list[1].phone}';
					opener.document.getElementById('shipaddress').innerText = '${list[1].shipAddress}';
					opener.document.getElementById('shipaddressdetail').innerText = '${list[1].shipAddressDetail}';
				} else if ('${list[2].shipNo}' == shipNo) {
					console.log(3);
					opener.document.getElementById('shipNo').value = "${list[2].shipNo}";
					opener.document.getElementById('shipname').innerText = '${list[2].recipient}';
					opener.document.getElementById('shipphone').innerText = '${list[2].phone}';
					opener.document.getElementById('shipaddress').innerText = '${list[2].shipAddress}';
					opener.document.getElementById('shipaddressdetail').innerText = '${list[2].shipAddressDetail}';
				}  else if ('${list[3].shipNo}' == shipNo) {
					console.log(4);
					opener.document.getElementById('shipNo').value = "${list[3].shipNo}";
					opener.document.getElementById('shipname').innerText = '${list[3].recipient}';
					opener.document.getElementById('shipphone').innerText = '${list[3].phone}';
					opener.document.getElementById('shipaddress').innerText = '${list[3].shipAddress}';
					opener.document.getElementById('shipaddressdetail').innerText = '${list[3].shipAddressDetail}';
				} else if ('${list[4].shipNo}' == shipNo) {
					console.log(5);
					opener.document.getElementById('shipNo').value = "${list[4].shipNo}";
					opener.document.getElementById('shipname').innerText = '${list[4].recipient}';
					opener.document.getElementById('shipphone').innerText = '${list[4].phone}';
					opener.document.getElementById('shipaddress').innerText = '${list[4].shipAddress}';
					opener.document.getElementById('shipaddressdetail').innerText = '${list[4].shipAddressDetail}';
				}
				
				
				
	   	    } 
	   		
	   		setTimeout(function() {
	   			window.close();
	   		}, 100);
	   	}
        
    </script> 
</body>

</html>