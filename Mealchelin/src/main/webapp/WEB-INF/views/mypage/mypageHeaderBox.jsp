<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>밀슐랭</title>
    <link rel="stylesheet" href="${ path }/css/mypage/mypageHeaderBox.css">
</head>
<body>
    <!-- 메인 파트 코드 진행-->
    <main>
        <!-- 회색 박스 -->
        <section class="myGraybox">
            <div class="myGrayboxIn">
                <div class="myGrayboxLeft">
                    <div>
                        <img src="../img/all/face.png" alt="얼굴사진">
                        <p><span>이주연님</span> 안녕하세요</p>
                        <a href="#"><button class="myBtn1">내 정보 수정</button></a><br>
                            <a href="#"><button class="myBtn2">배송지 관리</button></a>
                    </div>
                </div>
                <div class="myGrayboxRight">
                    <a href="#" class="myboxRight myBox1">
                        <div class="myboxRightDiv">
                            <img class="myboxRightImg1" src="../img/all/order.png" alt="주문내역">
                            <div class="myboxRightText">주문내역</div>
                            <img class="myboxRightImg2" src="../img/all/mypage-arrow.png"
                            onmouseout='this.src="../img/all/mypage-arrow.png"',
                            onmouseover='this.src="../img/all/mypage-active.png"' alt="빈화살표">
                        </div>
                    </a>
                    <a href="#" class="myboxRight myBox1">
                        <div class="myboxRightDiv">
                            <img class="myboxRightImg1" src="../img/all/cart.png" alt="주문내역">
                            <div class="myboxRightText">장바구니</div>
                            <img class="myboxRightImg2" src="../img/all/mypage-arrow.png"
                            onmouseout='this.src="../img/all/mypage-arrow.png"',
                            onmouseover='this.src="../img/all/mypage-active.png"' alt="빈화살표">
                        </div>
                    </a>
                    <a href="#" class="myboxRight myBox1">
                        <div class="myboxRightDiv">
                            <img class="myboxRightImg1" src="../img/all/review.png" alt="주문내역">
                            <div class="myboxRightText">상품리뷰</div>
                            <img class="myboxRightImg2" src="../img/all/mypage-arrow.png"
                            onmouseout='this.src="../img/all/mypage-arrow.png"',
                            onmouseover='this.src="../img/all/mypage-active.png"' alt="빈화살표">
                        </div>
                    </a>
                    <a href="#" class="myboxRight myBox1">
                        <div class="myboxRightDiv">
                            <img class="myboxRightImg1" src="../img/all/1by1.png" alt="주문내역">
                            <div class="myboxRightText">1:1 문의</div>
                            <img class="myboxRightImg2" src="../img/all/mypage-arrow.png"
                            onmouseout='this.src="../img/all/mypage-arrow.png"',
                            onmouseover='this.src="../img/all/mypage-active.png"' alt="빈화살표">
                        </div>
                    </a>
                </div>
            </div>
        </section>
    </main>
</body>
</html>