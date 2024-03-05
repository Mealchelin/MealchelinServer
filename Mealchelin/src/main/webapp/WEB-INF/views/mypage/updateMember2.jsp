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
    <!-- 필요한 css -->
    <link rel="stylesheet" href="${ path }/css/mypage/updateMember2.css">
    
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
            <h3 class="myTitle">내 정보수정</h3>
                <form action="" method="post">
                    <div class="myInputBox">
                        <div class="myInputDiv1">
                            <label for="myMemberName" >이름</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="text" class="mymemberIp" name="myMemberName" id="myMemberName" value="이주연">
                        </div>
                        
                        <br>

                        <div class="myInputDiv1">
                            <label for="myMemberId">아이디</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="text" class="mymemberIp" name="myMemberId" id="myMemberId" value="juyeon123 ">
                        </div>
                        
                        <br>
                        
                        <div class="myInputDiv1">
                            <label for="myMemberPwd">비밀번호</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="password"  class="mymemberIp" name="myMemberPwd" id="myMemberPwd" 
                                placeholder="비밀번호를 입력해주세요" style="margin-bottom: -10px;">
                        </div>
                        <div class="mySubText mySubText1" style="margin-bottom: 10px;"></div>
                
                        
                        <div class="myInputDiv1">
                            <label for="myMemberPwd2">비밀번호 확인</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="password"  class="mymemberIp" name="myMemberPwd2" id="myMemberPwd2" 
                            placeholder="비밀번호를 한번 더 입력해주세요" style="margin-bottom: -10px;">
                        </div>
                        <div class="mySubText mySubText2" style="margin-bottom: 10px;"></div>
                        
                        
                        <div class="myInputDiv1">
                            <label for="myMemberPhone">휴대폰</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="text"  class="mymemberIp" name="myMemberPhone" id="myMemberPhone" value="01011112222">
                        </div>
                        
                        <br>
                        
                        <div class="myInputDiv1">
                            <label for="myMemberEmail">이메일</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="email"  class="mymemberIp" name="myMemberEmail" id="myMemberEmail" value="juyeon123@iei.or.kr">
                        </div>
                        
                        <br>
                        
                        <div class="myInputDiv1">
                            <label for="myMemberAdress">주소</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="text" name="myMemberAdress" id="myMemberAdress" placeholder="우편번호 검색" readonly>
                        </div>
                        <button type="button" class="myInputBtn1">우편번호 검색</button>
                        <br>
                        <div class="myInputDiv1">
                            <input type="text"  class="mymemberIp" name="myMemberAdress2" id="myMemberAdress2" placeholder="주소를 입력해주세요" readonly>
                        </div>
                        <br>
                        <div class="myInputDiv2">
                            <input type="text"  class="mymemberIp" name="myMemberAdress3" id="myMemberAdress3" placeholder="상세주소를 입력해주세요">
                        </div>
                        
                        <br>
                        
                        <div class="myInputDiv1">
                            <label for="myMemberBdate">생년월일</label>
                        </div>
                        <div class="myInputDiv2">
                            <input type="text"  class="mymemberIp"  name="myMemberBdate" id="myMemberBdate" value="990111">
                        </div>
                    </div>
                    <div class="myBtnGroup">
                        <button class="myStatus" type="submit">탈퇴하기</button>
                        <button class="myUpdate" type="submit">회원정보수정</button>
                    </div>
                </form>
                
            </section>
        </main>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="./../layout/footer.jsp" />
    </footer>
    
    <!-- 필요한 js 밑에 추가-->
    <script type="text/javascript" src="${ path }/js/index.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${ path }/js/mypage/updateMember2.js"></script>
   
</body>

</html>