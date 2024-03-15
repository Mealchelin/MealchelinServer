

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:set var="path" value="${ pageContext.request.contextPath }" />
<c:set var="totalPrice" value="${price + shipPrice }" />




<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>밀슐랭</title>
<!--default css-->
<link rel="stylesheet" href="${ path }/css/common.css">
<!-- 필요한 css -->
<link rel="stylesheet" href="${ path }/css/pay/payPagedirect.css">



<!-- jquery -->
<script src="${ path }/js/jquery-3.7.1.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp31687115");
</script>



</head>

<body>
	<!-- 플로팅 배너(TOP버튼)-->
	<div class="top" id="topBtn"></div>

	<!-- 네비게이션 헤더 -->
	<header id="header">
		<jsp:include page="./../layout/header.jsp" />
	</header>

	<!-- 내용 넣기 -->
	<main id="pay_Mains">
		<section class="pay_Sections">
			
				<!-- <h2 class="pay_Title">주문서</h2> -->
				<h3 class="pay_Title">주문서</h3>
				<div class="pay_MainContent">
					<div class="pay_FirstContent">
						<span class="pay_FirstContentTitle">주문 상품</span>
					</div>
					<form action="payment/paysucces" method="POST">
					<div class="pay_FirstContentArea">
						<img src="${ path }/img/product/${product.image}" class="pay_menuPhoto"> <span class="pay_FirstMemu">
							<span class="pay_FirstName" id="payFirstName">${product.name}</span>
							<p class="pay_subFirstName" id="paysubFirstName">${product.brand}</p>
						</span> 
						<span class="pay_number" id="paynumber">${quantity}개</span>
						 <span class="pay_paynumber" id="paypaynumber"> <fmt:formatNumber value="${price}" type="number" /> 원</span> 
						 <input type="hidden" name="prdNo" value="${product.no}"/> 
						 <input type="hidden" name="image" value="${product.image}"/> 
						 <input type="hidden" name="payFirstName" id="payFirstName" value="${product.name}" /> 
						 <input type="hidden" name="paysubFirstName" id="paysubFirstName" value="${product.brand}" /> 
						 <input type="hidden" name="paynumber" id="paynumber" value="${quantity}개" /> 
						 <input type="hidden" name="paypaynumber" id="paypaynumber" value="${price}" />						
					</div>

					<div class="pay_SecondContentArea">
						<div class="pay_SecondContent">
							<span class="pay_secondContentTitle">주문자 정보</span>
						</div>
						<div class="pay_userInfo">
							<div class="pay_Sender">
								<span class="pay_username">이름</span>
								 <span class="pay_usernames" id="username">${userInfo.name}</span>
								<!-- hidden input 태그 추가 -->
								<input type="hidden" name="username" id="username" value="${userInfo.name}" />
							</div>
							<div class="pay_Sender">
								<span class="pay_userPhone">연락처</span> <span
									class="pay_userPhones" id="userphone">${userInfo.phone}</span>
								<!-- hidden input 태그 추가 -->
								<input type="hidden" name="userphone" id="userphone"
									value="${userInfo.phone}" />
							</div>
						</div>
						<div class="pay_Sender">
							<span class="pay_userEmail">이메일</span> <span
								class="pay_userEmails" id="userEmail"> ${userInfo.email}</span>
							<br>
							<p>
								이메일을 통해 주문처리과정을 보내드립니다 <br> 정보변경은 맛슐랭>개인정보 수정 메뉴에서 가능합니다
							</p>
						</div>
						<!-- hidden input 태그 추가 -->
						<input type="hidden" name="useremail" id="useremail"
							value="${userInfo.email}" />
					</div>
					
					<div class="pay_thirdContent">
						<span class="pay_thirdContentTitle">배송 정보</span>
					</div>
					<div class="pay_ShippingInfo">
						<div class="pay_SenderInfo">
							<span class="pay_username">이름</span> 
							<span class="pay_usernames" id="shipname">${shippingInfo.shipName}</span>
							<!-- hidden input 태그 추가 -->
							<input type="hidden" name="shipName" id="shipName" value="${shippingInfo.shipName}" />
						</div>
						<div class="pay_Sender">
							<span class="pay_userPhone">연락처</span> 
							<span class="pay_userPhones" id="shipphone">${shippingInfo.phone}</span>
							<!-- hidden input 태그 추가 -->
							<input type="hidden" name="shipPhone" id="shipPhone" value="${shippingInfo.phone}" />
						</div>
						<div class="pay_Sender">
							<span class="pay_useraddress">배송지</span>
						</div>
						<span class="pay_useraddresss" id="shipaddress">${shippingInfo.shipAddress}</span>
						<!-- hidden input 태그 추가 -->
						<input type="hidden" name="shipAddress" value="${shippingInfo.shipAddress}" id="shipaddress" />
						<p class="pay_addressInfo" id="shipaddressdetail">${shippingInfo.shipAddressDetail}</p>
						<!-- hidden input 태그 추가 -->
						<input type="hidden" name="shipaddressdetail" value="${shippingInfo.shipAddressDetail}" id="shipaddressdetail" />
						<div class="pay_addresschangeArea">
							<a class="pay_addresschange" onclick="window.open('${ path }/payment/shipChange', '_blank', 'width=800, height=600'); return false;">변경</a>
						</div>
					</div>
					
					<div class="pay_DeliveryRequestInfoArea">
						<div class="pay_DeliveryRequestInfo">
							<span class="pay_DeliveryRequest">배송요청사항</span>
							 <input class="pay_DeliveryUserRequest" type="text" placeholder="예) 문 앞에 놔주세요" id="payDeliveryUserRequest" name="payDeliveryUserRequest">
							<p class="pay_UserRequest">배송 요청사항을 입력해주세요</p>
						</div>
					</div>
					
					<div class="pay_FiveContent">
						<span class="pay_fiveContentTitle">결제 수단</span>
					</div>
					<div id="overlay"></div>
					<div class="pay_payInfo">
						<div class="pay_payList">
							<div class="pay_Info">
								<div class="pay_kakaoArea">
									<input type="checkbox" id="pay_kakao" name="pay_check" value="pay_kakao"> <label for="pay_kakao">
									<img src="../img/all/kakao-pay.png"></label>
								</div>
								<!-- hidden input 태그 추가 -->
								<input type="hidden" id="pay_kakao_hidden" name="pay_kakao_hidden" value="카카오페이">
								<div class="pay_cardArea">
									<input type="checkbox" id="pay_card" name="pay_check" value="pay_card"> <label for="pay_card">신용카드</label>
								</div>
								<!-- hidden input 태그 추가 -->
								<input type="hidden" id="pay_card_hidden" name="pay_card_hidden" value="신용카드">
								<div class="pay_phoneArea">
									<input type="checkbox" id="pay_phone" name="pay_check" value="pay_phone"> <label for="pay_phone">휴대폰</label>
								</div>
								<!-- hidden input 태그 추가 -->
								<input type="hidden" id="pay_phone_hidden" name="pay_phone_hidden" value="휴대폰">
							</div>
						</div>
					</div>
					
					<div class="pay_sixContent">
						<span class="pay_sixContentTitle">결제 정보</span>
					</div>
					
					<div class="pay_payResultArea">
						<div class="pay_payResult">
							<span class="pay_paymentInfo">결제금액</span>
								 <span class="pay_payment">결제 금액</span> <span class="pay_pay"> <fmt:formatNumber value="${totalPrice}" type="number" /> 원
							</span>
							<!-- hidden input 태그 추가 -->
							<input type="hidden" name="totalPrice" id="totalPrice" value="${totalPrice}" />
						</div>
						<div class="pay_paymentInfo">
							<span class="pay_Product">ㄴ 상품금액</span>
								 <span class="pay_payMoney"> <fmt:formatNumber value="${price}" type="number" /> 원
							</span>
							<!-- hidden input 태그 추가 -->
							<input type="hidden" name="productPrice" id="productPrice" value="${price}" />
						</div>
						
						<div class="pay_paymentInfo">
							<span class="pay_Delivery">ㄴ 배송비</span>
							 <span class="pay_pay"> <fmt:formatNumber value="${shipPrice}" type="number" /> 원 </span>
							<!-- hidden input 태그 추가 -->
							<input type="hidden" class="shippingPrice" id="shippingPrice" name="shippingPrice" value="${totalPrice}" />
						</div>
						
						<div class="pay_finalResult">
							<span class="pay_Delivery">최종 결제 금액</span>
							 <span id="price" class="pay_Finalpay"> <fmt:formatNumber value="${totalPrice}" type="number" />원</span>
						</div>
					</form>
			<div class="pay_line"></div>
		</div>

			<div class="pay_sevenContent">
				<span class="pay_sevenContentTitle">개인정보 수집 및 동의</span>
			</div>
			<div class="pay_userInfoArea">
				<div class="pay_userInfotwo">
					<span class="pay_userInfoCheck">개인정보 수집 이용 처리 동의</span>
					<div class="memview1">약관보기</div>
				</div>
				<div class="pay_userInfotwo">
					<span class="pay_userInfoCheck">전자지금 결제대행 서비스 이용약관 동의</span>
					<div class="memview2">약관보기</div>
				</div>
				<div class="pay_userInfotwo">
					<span class="pay_userInfoCheckResult">위 내용을 확인 하였으며 결제에
						동의합니다.</span>
					<p class="pay_subInfo">※ 주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시
						결제하신 수단으로 환불됩니다.</p>
				</div>
			</div>
			<div class="memmodal_bg"></div>
			<!-- 모달창 2-->
			<div class="memmodalbox1">
				<h3>개인정보 수집 / 이용 동의(필수)</h3>
				<div class="memmodal_in1">
					밀슐랭은(는) 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스를 이용함과 동시에 온라인상에서 회사에
					제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. <br> 이에 밀슐랭는 통신비밀보호법,
					전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의
					개인정보보호 규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. <br> 밀슐랭는 개인정보
					취급방침을 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가
					취해지고 있는지 알려 드립니다 <br> <br> 밀슐랭는 개인정보 취급방침을 홈페이지 첫 화면에
					공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. <br> <br> 회사의
					개인정보 취급방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 이에
					따른 개인정보 취급방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 취급방침을 개정하는
					경우나 개인정보 취급방침 변경될 경우 쇼핑몰의 첫페이지의 개인정보취급방침을 통해 고지하고 있습니다. 이용자들께서는 사이트
					방문 시 수시로 확인하시기 바랍니다. <br> <br> 밀슐랭의 개인정보 취급방침은 다음과 같은 내용을
					담고 있습니다. <br> <br> 1. 개인정보 수집에 대한 동의 <br> 2. 개인정보의
					수집목적 및 이용목적 <br> 3. 수집하는 개인정보 항목 및 수집방법 <br> 4. 수집하는
					개인정보의 보유 및 이용기간 <br> 5. 수집한 개인정보의 공유 및 제공 <br> 6. 이용자 자신의
					개인정보 관리(열람,정정,삭제 등)에 관한 사항 <br> 7. 쿠키(cookie)의 운영에 관한 사항 <br>
					8. 비회원 고객의 개인정보 관리 <br> 9. 개인정보의 위탁처리 <br> 10. 개인정보관련
					의견수렴 및 불만처리에 관한 사항 <br> 11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처 <br>
					12. 고지의 의무 <br> <br> <br> <strong>1. 개인정보
						수집에 대한 동의</strong><br> 밀슐랭는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여
					「동의」버튼 또는 「취소」버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해 동의한
					것으로 봅니다. <br> <br> <strong>2. 개인정보의 수집목적 및 이용목적
					</strong><br> "개인정보"라 함은 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명등의 사항에 의하여
					당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할
					수 있는 것을 포함)를 말합니다. <br> <br> 대부분의 서비스는 별도의 사용자 등록이 없이
					언제든지 사용할 수 있습니다
					<div class="br"></div>
					그러나 밀슐랭는 회원서비스를 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여
					이용자 개인의 정보를 수집하고 있습니다. <br> <br> 밀슐랭는 이용자의 사전 동의 없이는 이용자의
					개인 정보를 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다. <br> <br> 첫째,
					이용자들이 제공한 개인정보를 바탕으로 보다 더 유용한 서비스를 개발할 수 있습니다. <br> 밀슐랭는 신규
					서비스개발이나 컨텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를 바탕으로 개발해야 할 서비스의 우선 순위를
					보다 더 효율적으로 정하고, 밀슐랭는 이용자들이 필요로 할 컨텐츠를 합리적으로 선택하여 제공할 수 있습니다. <br>
					<br> 둘째, 수집하는 개인정보 항목과 수집 및 이용목적은 다음과 같습니다. <br> -성명 ,
					아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용 <br> -이메일주소, 전화번호 :
					고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 신상품이나 이벤트 정보 등의 안내 <br>
					-은행계좌정보, 신용카드정보 : 서비스 및 부가 서비스 이용에 대한 요금 결제 <br> -주소, 전화번호 :
					청구서, 물품배송시 정확한 배송지의 확보 <br> -기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료 <br>
					-IP Address, : 불량회원의 부정 이용 방지와 비인가 사용 방지 <br> <br> <strong>3.
						수집하는 개인정보 항목 및 수집방법 </strong><br> 밀슐랭는 이용자들이 회원서비스를 이용하기 위해 회원으로 가입하실
					때 서비스 제공을 위한 필수적인 정보들을 온라인상에서 입력 받고 있습니다. <br> 회원 가입 시에 받는
					필수적인 정보는 이름, 이메일 주소 등입니다. 또한 양질의 서비스 제공을 위하여 이용자들이 선택적으로 입력할 수 있는
					사항으로서 전화번호 등을 입력 받고 있습니다. <br> <br> 또한 쇼핑몰 내에서의 설문조사나 이벤트
					행사 시 통계분석이나 경품제공 등을 위해 선별적으로 개인정보 입력을 요청할 수 있습니다. 그러나, 이용자의 기본적 인권
					침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록,
					건강상태 및 성생활 등)는 수집하지 않으며 부득이하게 수집해야 할 경우 이용자들의 사전동의를 반드시 구할 것입니다. <br>
					그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는 사용하지 않으며 외부로
					유출하지 않습니다. <br> <br> <strong>4. 수집하는 개인정보의 보유 및
						이용기간</strong><br> 이용자가 쇼핑몰 회원으로서 회사에 제공하는 서비스를 이용하는 동안 밀슐랭는 이용자들의
					개인정보를 계속적으로 보유하며 서비스 제공 등을 위해 이용합니다. 다만, 아래의 "6. 이용자 자신의 개인정보
					관리(열람,정정,삭제 등)에 관한 사항" 에서 설명한 절차와 방법에 따라 회원 본인이 직접 삭제하거나 수정한 정보,
					가입해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 디스크에서 완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로
					처리됩니다. <br> <br> 그리고 "3. 수집하는 개인정보 항목 및 수집방법"에서와 같이 일시적인
					목적 (설문조사, 이벤트, 본인확인 등)으로 입력 받은 개인정보는 그 목적이 달성된 이후에는 동일한 방법으로 사후 재생이
					불가능한 상태로 처리됩니다. <br> <br> 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는
					제공받은 목적이 달성되면 파기하는 것을 원칙으로 합니다. 그리고 상법, 전자상거래등에서의 소비자보호에 관한 법률 등
					관계법령의 규정에 의하여 보존할 필요가 있는 경우 밀슐랭는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. <br>
					이 경우 밀슐랭는 밀슐랭는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다. <br>
					- 계약 또는 청약철회 등에 관한 기록 : 5년 <br> - 대금결제 및 재화 등의 공급에 관한 기록 : 5년
					<br> - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 <br> <br> 밀슐랭는
					귀중한 회원의 개인정보를 안전하게 처리하며, 유출의 방지를 위하여 다음과 같은 방법을 통하여 개인정보를 파기합니다. <br>
					<br> - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다. <br> - 전자적
					파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다 <br> <strong>5.
						수집한 개인정보의 공유 및 제공 </strong> <br> 밀슐랭는 이용자들의 개인정보를 "2. 개인정보의 수집목적 및
					이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의
					개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br> - 이용자들이 사전에
					공개에 동의한 경우<br> - 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br> - 홈페이지에
					게시한 서비스 이용 약관 및 기타 회원 서비스 등의 이용약관 또는 운영원칙을 위반한 경우<br> - 자사
					서비스를 이용하여 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적인 조치를 취하기 위하여 개인정보를 공개해야
					한다고 판단되는 충분한 근거가 있는 경우 <br> - 기타 법에 의해 요구된다고 선의로 판단되는 경우 (ex.
					관련법에 의거 적법한 절차에 의한 정부/수사기관의 요청이 있는 경우 등) <br> - 통계작성, 학술연구나
					시장조사를 위하여 특정개인을 식별할 수 없는 형태로 광고주, 협력업체나 연구단체 등에 제공하는 경우 <br> -
					이용자의 서비스 이용에 따른 불만사항 및 문의사항(민원사항)의 처리를 위하여 파.항의 고객센터를 운영하는 전문업체에 해당
					민원사항의 처리에 필요한 개인 정보를 제공하는 경우 <br> <strong>6. 이용자 자신의
						개인정보 관리(열람,정정,삭제 등)에 관한 사항 </strong><br> 회원님이 원하실 경우 언제라도 당사에서 개인정보를
					열람하실 수 있으며 보관된 필수 정보를 수정하실 수 있습니다. <br>또한 회원 가입 시 요구된 필수 정보 외의
					추가 정보는 언제나 열람, 수정, 삭제할 수 있습니다. 회원님의 개인정보 변경 및 삭제와 회원탈퇴는 당사의 고객센터에서
					로그인(Login) 후 이용하실 수 있습니다. <br> <br> <strong>7.
						쿠키(cookie)의 운영에 관한 사항</strong><br> 당사는 회원인증을 위하여 Cookie 방식을 이용하고 있습니다.
					<br> 이는 로그아웃(Logout)시 자동으로 컴퓨터에 저장되지 않고 삭제되도록 되어 있으므로 공공장소나
					타인이 사용할 수 있는 컴퓨터를 사용 하 실 경우에는 로그인(Login)후 서비스 이용이 끝나시면 반드시
					로그아웃(Logout)해 주시기 바랍니다. <br> <br> ※ 쿠키 설정 거부 방법 <br>
					예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를
					저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. <br> <br> 설정방법
					예(인터넷 익스플로어의 경우) <br> : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보<br>
					<br> 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. <br>
					<br> <strong>8. 비회원고객의 개인정보관리</strong> <br> - 당사는 비회원 고객
					또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 당사는 비회원 주문의 경우 배송 및 대금 결제, 상품 배송에
					반드시 필요한 개인정보만을 고객님께 요청하고 있습니다. <br> - 당사에서 비회원으로 구입을 하신 경우 비회원
					고객께서 입력하신 지불인 정보 및 수령인 정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도
					사용되지 않습니다. <br> <br> <strong> 9. 개인정보의 위탁처리</strong> <br>
					서비스 향상을 위해서 귀하의 개인정보를 필요한 경우 동의 등 법률상의 요건을 구비하여 외부에 수집 · 취급 · 관리 등을
					위탁하여 처리할 있으며, 제 3자에 게 제공할 수 있습니다. <br> - 당사는 개인정보의 처리와 관련하여
					아래와 같이 업무를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을
					규정하고 있습니다. 또한 공유하는 정보는 당해 목적을 달성하기 위하여 필요한 최소한의 정보에 국한됩니다. <br>
					<br>
				</div>
				<div class="memmodal_btn_box1">
					<button class="memmodal_btn1">확인</button>
				</div>
			</div>
			<div class="memmodalbox2">
				<h3>개인정보 수집 이용 및 처리동의 (필수)</h3>
				<div class="memmodal_in2">
					<div class="pay_subtitle">
						<span>개인정보 수집 이용 및 처리 동의</span>
					</div>
					<table>
						<tr class="pay_Listget">
							<th>수집 목적</th>
							<th>수집 항목</th>
							<th>보유기간</th>
						</tr>
						<tr class="pay_Listget">
							<td>온라인 쇼핑 규매자에 대한 상품 결제 및 배송</td>
							<td>결제정보, 수취인명,휴대폰 번호,수취인 주소,구매상품정보</td>
							<td class="pay_day" rowspan="4">업무 목적 달성 후 파기 (단, 타 법령에 따라
								법령에서 규정한 기간 동안 보존)</td>
						</tr>
						<tr class="pay_Listget">
							<td>주류 구매 관리 및 신고</td>
							<td>구매자이름(성인인증정보를 이용함), 구매자 주소</td>
						</tr>
						<tr class="pay_Listget">
							<td>여행상품(숙박) 예약</td>
							<td>투숙자 정보(이름,휴대폰 번호)</td>
						</tr>
						<tr class="pay_Listget">
							<td>여행상품(항공)예약</td>
							<td>탑승자 정보(이름,휴대폰 번호),생년월일,성별</td>
						</tr>
					</table>
					<br> <br>
					<div class="pay_waring">
						<p>서비스 제공을 위해서 필요한 개인정보입니다.동의를 해 주셔야 서비스를 이용하실 수 있으며, 동의하지 않으실
							경우 서비스에 제한이 있을 수 있습니다.</p>
					</div>
				</div>
				<div class="memmodal_btn_box2">
					<button class="memmodal_btn2">확인</button>
				</div>
			</div>

			<div class="pay_pay_Productreview">
				<input type="button" id="payButton" value="결제하기" /> <input
					type="button" onclick="location.href='/'" value="홈으로 이동" />
			</div>
			</div>
		</section>
	</main>


	<!-- 푸터 -->
	<footer>
		<jsp:include page="./../layout/footer.jsp" />
	</footer>

	<!-- 필요한 js 밑에 추가-->
	<script type="text/javascript" src="${ path }/js/index.js"></script>
	<script type="text/javascript" src="${ path }/js/pay/payPage.js"></script>
	<script type="text/javascript" src="${ path }/js/pay/payModal.js"></script>




</body>

</html>