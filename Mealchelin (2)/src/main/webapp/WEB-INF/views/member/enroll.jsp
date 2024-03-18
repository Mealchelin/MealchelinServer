
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <link rel="stylesheet" href="${ path }/css/member/enroll.css">
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
        <section>
            <form method="post" class="memEnrollSubmit">
            <h3 class="memTitle">회원가입</h3>
            <div class="memEnrollBox">
                    <table class="memEnrollTable">
                        <tr>
                            <td class="memtd">이름</td>
                            <td><input type="text" name="name" class="memTdIp" placeholder="이름을 입력해주세요" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="memtd">아이디</td>
                            <td>
                                <input type="text" name="id" class="memTdIp" id="memID" placeholder="아이디을 입력해주세요" required>
                                <button class="memIdcheck" type="button">중복확인</button>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p class="memP" id="memregId"></p></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="memtd">비밀번호</td>
                            <td><input type="password" name="password" class="memTdIp" id="memPwd" placeholder="비밀번호를 입력해주세요" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p class="memP" id="memregPwd"></p></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="memtd">비밀번호 확인</td>
                            <td><input type="password" class="memTdIp" id="memPwd2" placeholder="비밀번호를 한번 더 입력해주세요" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p class="memP" id="memregPwd2"></p></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="memtd">휴대폰</td>
                            <td><input type="text" name="phone" class="memTdIp" placeholder="-빼고, 숫자만 입력해주세요" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="memtd">이메일</td>
                            <td><input type="email" name="email" class="memTdIp" placeholder="ex juyeon123@iei.or.kr" required></td>
                            <td></td>
                        </tr>
                    <tr>
                        <td class="memtd">주소</td>
                        <td><input type="text" name="postalCode" placeholder="우편번호 검색" id="memAdPost" class="memTdIpsmall" readonly required>
                            <button type="button" id="memtdButton" class="memtdBtn">우편번호 검색</button></td>
                        <td></td>
                    </tr> 
                    <tr>
                        <td class="memtd"></td>
                        <td><input type="text" name="address" class="memTdIp"  id="mem_Ad" placeholder="주소를 입력해주세요" readonly required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="addressDetail" class="memTdIp" id="memDetail_Ad" placeholder="상세주소를 입력해주세요" ></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="memtd">생년월일</td>
                        <td><input type="text" name="birth" class="memTdIp" placeholder="ex 900101" required></td>
                        <td></td>
                    </tr>
                    </table>
                  
            </div>
                
                <!-- 이용약관 -->
                <div class="memtermsBox">
                    <table>
                        <tr>
                            <td class="memtd1" >이용약관 동의</td>
                            <td class="memtd2" ><input type="checkbox" name="memchecker" id="memcheckerAll" class="memchecker"><label for="memcheckerAll" class="memAlldiv">전체 동의 합니다.</label></td>
                            <td class="memtd3" ><div></div></td>
                        </tr>
                        <tr>
                            <td><div style="height: 5px;"></div></td>
                        </tr>
                        <tr>
                            <td class="memtd1" ></td>
                            <td class="memtd2 memtd2-2"><input type="checkbox" name="memchecker" id="memchecker1" class="memchecker"><label for="memchecker1">이용약관 동의<span class="memspan">(필수)</span></label></td>
                            <td class="memtd3" ><div class="memview1">약관보기</div></td>
                        </tr>
                        <tr>
                            <td><div></div></td>
                        </tr>
                        <tr>
                            <td class="memtd1"></td>
                            <td class="memtd2 memtd2-2" ><input type="checkbox" name="memchecker" id="memchecker2" class="memchecker"><label for="memchecker2">개인정보 수집 / 이용 동의<span class="memspan">(필수)</span></label></td>
                            <td class="memtd3" ><div class="memview2">약관보기</div></td>
                        </tr>
                        <tr>
                            <td><div></div></td>
                        </tr>
                        <tr>
                            <td class="memtd1" ></td>
                            <td class="memtd2 memtd2-2" ><input type="checkbox" name="memchecker" id="memchecker3" class="memchecker"><label for="memchecker3">본인은 만 14세 이상입니다.<span class="memspan">(필수)</span></label></td>
                            <td class="memtd3"></td>
                        </tr>
                    </table>
                </div>
            <button class="memEnroll" type="button">가입하기</button>
        </form>   
        </section>
        <section>
            <!-- 모달창 -->
            <div class="memmodalbox1">
                <h3>이용약관(필수)</h3>
                <div class="memmodal_in1">
                        <strong>제12조(수신확인통지·구매신청 변경 및 취소)</strong><br>
                        ① "쇼핑몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
                        <br>
                        ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.
                        <br>
                        ③ "쇼핑몰"은 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.
                        <br><br>
                        <strong>제13조(배송)</strong><br>
                        "쇼핑몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "쇼핑몰"의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다.
                        <br><br>
                        
                        <strong>제14조(환급, 반품 및 교환)</strong> <br>
                        ① "쇼핑몰"은 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다.
                        <br>
                        ② 다음 각 호의 경우에는 "쇼핑몰"은 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다.
                        <br>1. 배송된 재화가 주문내용과 상이하거나 "쇼핑몰"이 제공한 정보와 상이할 경우
                        <br>2. 배송된 재화가 파손, 손상되었거나 오염되었을 경우
                        <br>3. 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우
                        <br>4. 방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우
                        <br><br>

                        <strong>제15조(개인정보보호)</strong><br>
                        ① "쇼핑몰"은 이용자의 정보 수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다<br>
                        다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. <br>
                        1. 희망ID(회원의 경우) <br>
                        2. 비밀번호(회원의 경우) <br>
                        3. 이름 <br>
                        4. 별명 <br>
                        5. E-MAIL <br>
                        6. 주소 <br>
                        7. 전화번호 <br>
                        8. 휴대번호 <br>
                        9. 메일링서비스 <br>
                        10. SMS 수신여부 <br><br>

                        ② "쇼핑몰"이 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. <br>
                        ③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "쇼핑몰"이 집니다. 다만, 다음의 경우에는 예외로 합니다. <br>
                        1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우<br>
                        2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우<br>
                        ④ "쇼핑몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조 제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                        <br>
                        ⑤ 이용자는 언제든지 "쇼핑몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "쇼핑몰"은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "쇼핑몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                        <br>
                        ⑥ "쇼핑몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
                        <br>
                        ⑦ "쇼핑몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
                        <br><br>

                        <strong>제16조("쇼핑몰"의 의무)</strong> <br>
                        ① "쇼핑몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.
                        <br>
                        ② "쇼핑몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
                        <br>
                        ③ "쇼핑몰"이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
                        <br>
                        ④ "쇼핑몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
                        <br><br>

                        <strong>제17조( 회원의 ID 및 비밀번호에 대한 의무)</strong><br>
                        ① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
                        <br>
                        ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
                        <br>
                        ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "쇼핑몰"에 통보하고 "쇼핑몰"의 안내가 있는 경우에는 그에 따라야 합니다.
                        <br><br>

                        <strong>제18조(이용자의 의무)</strong><br>
                        이용자는 다음 행위를 하여서는 안 됩니다. <br>
                        1. 신청 또는 변경 시 허위내용의 등록 <br>
                        2. "쇼핑몰"에 게시된 정보의 변경 <br>
                        3. "쇼핑몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시 <br>
                        4. "쇼핑몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해 <br>
                        5. "쇼핑몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 <br>
                        6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 홈페이지에 공개 또는 게시하는 행위 <br><br>


                        <strong>제19조(연결"쇼핑몰"과 피연결"쇼핑몰" 간의 관계)</strong> <br>
                        ① 상위 "쇼핑몰"과 하위 "쇼핑몰"이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "쇼핑몰"(웹 사이트)이라고 하고 후자를 피연결 "쇼핑몰"(웹사이트)이라고 합니다.
                        <br>
                        ② 연결 "쇼핑몰"은 피연결 "쇼핑몰"이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 "쇼핑몰"의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
                        <br><br>

                        <strong>제20조(저작권의 귀속 및 이용제한)</strong><br>
                        ① "쇼핑몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "쇼핑몰"에 귀속합니다. <br>

                        ② 이용자는 "쇼핑몰"을 이용함으로써 얻은 정보를 "쇼핑몰"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
                        <br><br>

                        <strong>제21조(분쟁해결) </strong>
                        ① "쇼핑몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.
                        <br>
                        ② "쇼핑몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
                        <br>
                        ③ "쇼핑몰"과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
                        <br><br>

                        <strong>제22조(재판권 및 준거법)</strong><br>
                        ① "쇼핑몰"과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.
                        <br>
                        ② "쇼핑몰"과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.
                        <br>
                </div>
                <div class="memmodal_btn_box1">
                    <button class="memmodal_btn1">확인</button>
                </div>
            </div>
            <div class="memmodal_bg"></div>

            <!-- 모달창 2-->
            <div class="memmodalbox2">
                <h3>개인정보 수집 / 이용 동의(필수)</h3>
                <div class="memmodal_in2">
                    밀슐랭은(는) 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스를
                    이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고
                    있습니다. <br> 이에 밀슐랭는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에
                    관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및
                    정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. <br> 밀슐랭는 개인정보 취급방침을 통하여
                    이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해
                    어떠한 조치가 취해지고 있는지 알려 드립니다
                    <br><br>

                    밀슐랭는 개인정보 취급방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실
                    수 있도록 조치하고 있습니다.
                    <br><br>
                    회사의 개인정보 취급방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여
                    수시로 변경될 수 있고, 이에 따른 개인정보 취급방침의 지속적인 개선을 위하여 필요한 절차를
                    정하고 있습니다. 그리고 개인정보 취급방침을 개정하는 경우나 개인정보 취급방침 변경될 경우
                    쇼핑몰의 첫페이지의 개인정보취급방침을 통해 고지하고 있습니다. 이용자들께서는 사이트 방문 시
                    수시로 확인하시기 바랍니다. <br><br>

                    밀슐랭의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다. <br><br>

                    1. 개인정보 수집에 대한 동의 <br>
                    2. 개인정보의 수집목적 및 이용목적 <br>
                    3. 수집하는 개인정보 항목 및 수집방법 <br>
                    4. 수집하는 개인정보의 보유 및 이용기간 <br>
                    5. 수집한 개인정보의 공유 및 제공 <br>
                    6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항 <br>
                    7. 쿠키(cookie)의 운영에 관한 사항 <br>
                    8. 비회원 고객의 개인정보 관리 <br>
                    9. 개인정보의 위탁처리 <br>
                    10. 개인정보관련 의견수렴 및 불만처리에 관한 사항 <br>
                    11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처 <br>
                    12. 고지의 의무 <br><br>
                    <br>
                    <strong>1. 개인정보 수집에 대한 동의</strong><br>

                    밀슐랭는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 「동의」버튼 또는
                    「취소」버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해
                    동의한 것으로 봅니다. <br><br>

                    <strong>2. 개인정보의 수집목적 및 이용목적 </strong><br>

                    "개인정보"라 함은 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명등의 사항에 의하여
                    당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와
                    용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다. <br><br>

                    대부분의 서비스는 별도의 사용자 등록이 없이 언제든지 사용할 수 있습니다<div class="br"></div>
                    그러나 밀슐랭는 회원서비스를 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의
                    서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다. <br> <br>

                    밀슐랭는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와
                    같이 이용하고 있습니다. <br><br>

                    첫째, 이용자들이 제공한 개인정보를 바탕으로 보다 더 유용한 서비스를 개발할 수 있습니다. <br>
                    밀슐랭는 신규 서비스개발이나 컨텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를
                    바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 밀슐랭는 이용자들이 필요로
                    할 컨텐츠를 합리적으로 선택하여 제공할 수 있습니다. <br><br>

                    둘째, 수집하는 개인정보 항목과 수집 및 이용목적은 다음과 같습니다. <br>
                    -성명 , 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용 <br>
                    -이메일주소, 전화번호 : 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 
                    새로운 서비스 및 신상품이나 이벤트 정보 등의 안내 <br>
                    -은행계좌정보, 신용카드정보 : 서비스 및 부가 서비스 이용에 대한 요금 결제 <br>
                    -주소, 전화번호 : 청구서, 물품배송시 정확한 배송지의 확보 <br>
                    -기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료 <br>
                    -IP Address, : 불량회원의 부정 이용 방지와 비인가 사용 방지 <br><br>

                    <strong>3. 수집하는 개인정보 항목 및 수집방법 </strong><br>

                    밀슐랭는 이용자들이 회원서비스를 이용하기 위해 회원으로 가입하실 때 서비스 제공을 위한 필수적인
                    정보들을 온라인상에서 입력 받고 있습니다. <br> 회원 가입 시에 받는 필수적인 정보는 이름, 이메일 주소
                    등입니다. 또한 양질의 서비스 제공을 위하여 이용자들이 선택적으로 입력할 수 있는 사항으로서
                    전화번호 등을 입력 받고 있습니다. <br> <br>

                    또한 쇼핑몰 내에서의 설문조사나 이벤트 행사 시 통계분석이나 경품제공 등을 위해 선별적으로
                    개인정보 입력을 요청할 수 있습니다. 그러나, 이용자의 기본적 인권 침해의 우려가 있는 민감한
                    개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및
                    성생활 등)는 수집하지 않으며 부득이하게 수집해야 할 경우 이용자들의 사전동의를 반드시 구할
                    것입니다. <br>
                    그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는
                    사용하지 않으며 외부로 유출하지 않습니다. <br><br>

                    <strong>4. 수집하는 개인정보의 보유 및 이용기간</strong><br>

                    이용자가 쇼핑몰 회원으로서 회사에 제공하는 서비스를 이용하는 동안 밀슐랭는 이용자들의 개인정보를
                    계속적으로 보유하며 서비스 제공 등을 위해 이용합니다. 다만, 아래의 "6. 이용자 자신의 개인정보
                    관리(열람,정정,삭제 등)에 관한 사항" 에서 설명한 절차와 방법에 따라 회원 본인이 직접
                    삭제하거나 수정한 정보, 가입해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 디스크에서
                    완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로 처리됩니다. <br><br>

                    그리고 "3. 수집하는 개인정보 항목 및 수집방법"에서와 같이 일시적인 목적 (설문조사, 이벤트,
                    본인확인 등)으로 입력 받은 개인정보는 그 목적이 달성된 이후에는 동일한 방법으로 사후 재생이
                    불가능한 상태로 처리됩니다. <br><br>

                    귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기하는 것을
                    원칙으로 합니다. 그리고 상법, 전자상거래등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여
                    보존할 필요가 있는 경우 밀슐랭는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. <br>
                    이 경우 밀슐랭는 밀슐랭는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다. <br>

                    - 계약 또는 청약철회 등에 관한 기록 : 5년 <br>
                    - 대금결제 및 재화 등의 공급에 관한 기록 : 5년 <br>
                    - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 <br><br>

                    밀슐랭는 귀중한 회원의 개인정보를 안전하게 처리하며, 유출의 방지를 위하여 다음과 같은 방법을
                    통하여 개인정보를 파기합니다. <br><br>

                    - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다. <br>
                    - 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다 <br>


                    <strong>5. 수집한 개인정보의 공유 및 제공 </strong> <br>

                    밀슐랭는 이용자들의 개인정보를 "2. 개인정보의 수집목적 및 이용목적"에서 고지한 범위 내에서
                    사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의
                    개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br>

                    - 이용자들이 사전에 공개에 동의한 경우<br>
                    - 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br>
                    - 홈페이지에 게시한 서비스 이용 약관 및 기타 회원 서비스 등의 이용약관 또는 운영원칙을
                    위반한 경우<br>
                    - 자사 서비스를 이용하여 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적인 조치를
                    취하기 위하여 개인정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우 <br>
                    - 기타 법에 의해 요구된다고 선의로 판단되는 경우 (ex. 관련법에 의거 적법한 절차에 의한
                    정부/수사기관의 요청이 있는 경우 등) <br>
                    - 통계작성, 학술연구나 시장조사를 위하여 특정개인을 식별할 수 없는 형태로 광고주, 협력업체나
                    연구단체 등에 제공하는 경우 <br>
                    - 이용자의 서비스 이용에 따른 불만사항 및 문의사항(민원사항)의 처리를 위하여 파.항의
                    고객센터를 운영하는 전문업체에 해당 민원사항의 처리에 필요한 개인 정보를 제공하는 경우 <br>

                    <strong>6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항 </strong><br>

                    회원님이 원하실 경우 언제라도 당사에서 개인정보를 열람하실 수 있으며 보관된 필수 정보를
                    수정하실 수 있습니다. <br>또한 회원 가입 시 요구된 필수 정보 외의 추가 정보는 언제나 열람,
                    수정, 삭제할 수 있습니다. 회원님의 개인정보 변경 및 삭제와 회원탈퇴는 당사의 고객센터에서
                    로그인(Login) 후 이용하실 수 있습니다. <br> <br>

                    <strong>7. 쿠키(cookie)의 운영에 관한 사항</strong><br>

                    당사는 회원인증을 위하여 Cookie 방식을 이용하고 있습니다. <br> 이는 로그아웃(Logout)시 자동으로
                    컴퓨터에 저장되지 않고 삭제되도록 되어 있으므로 공공장소나 타인이 사용할 수 있는 컴퓨터를
                    사용 하 실 경우에는 로그인(Login)후 서비스 이용이 끝나시면 반드시 로그아웃(Logout)해 주시기
                    바랍니다. <br><br>

                    ※ 쿠키 설정 거부 방법 <br>
                    예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써
                    모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수
                    있습니다. <br> <br>

                    설정방법 예(인터넷 익스플로어의 경우) <br>
                    : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보<br><br>

                    단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. <br><br>

                    <strong>8. 비회원고객의 개인정보관리</strong> <br>
                    - 당사는 비회원 고객 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 당사는 비회원
                    주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보만을 고객님께 요청하고
                    있습니다. <br>

                    - 당사에서 비회원으로 구입을 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인
                    정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다. <br><br>

                    <strong> 9. 개인정보의 위탁처리</strong> <br>
                    서비스 향상을 위해서 귀하의 개인정보를 필요한 경우 동의 등
                    법률상의 요건을 구비하여 외부에 수집 · 취급 · 관리 등을 위탁하여 처리할 있으며, 제 3자에
                    게 제공할 수 있습니다. <br>
                    - 당사는 개인정보의 처리와 관련하여 아래와 같이 업무를 위탁하고 있으며, 관계 법령에 따라
                    위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 또한
                    공유하는 정보는 당해 목적을 달성하기 위하여 필요한 최소한의 정보에 국한됩니다. <br><br>

                </div>
                <div class="memmodal_btn_box2">
                    <button class="memmodal_btn2">확인</button>
                </div>
            </div>
        </section>
    </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${ path }/js/main.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${ path }/js/member/enroll.js"></script>
    <script>
	 // 아이디 중복 체크 
	    $('.memIdcheck').on('click',()=>{
	        let userId = $('#memID').val().trim();
	    	
	    	
	        if (userId === ''){
	            alert('아이디를 입력해주세요.');
	        } else {
	            $.ajax({
	                type:'get',
	                url: '${ path }/member/idCheck',
	                dataType: 'json',
	                data : {
	                    userId
	                },
	                success : (obj) => {
	                    console.log(obj);
	
	                    if(obj.duplicate){
	                        alert('이미 사용중인 아이디 입니다.');
	                        $('#memID').val('');
	                    } else {
	                        alert('사용 가능한 아이디 입니다.');
	                    }
	                },
	                error: (error) => {
	                    console.log(error);
	                }
	            });
	
	        }
	    	
	
	    }) ;
	
	
	
	    
    </script>
</body>


</html>