document.getElementById('payButton').addEventListener('click', function() {
			let test = document.getElementById('test').innerText;
			
			let split = test.split(',', 2)
			
			let split2 = (split[0] + split[1]).split('원');
			console.log(parseInt(split2[0]));
			
			let split3 = parseInt(split2[0]);
			console.log(split3);

            var selectedMethod = getSelectedMethod();
            openPaymentPage(selectedMethod, split3);
        });

        function getSelectedMethod() {
            var checkboxes = document.getElementsByName('pay_check');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    return checkboxes[i].value;
                }
            }
            return null;
        }






 function openPaymentPage(method, test) {
    switch (method) {
        case 'pay_kakao':
    // Method 1에 해당하는 결제창 열기
    IMP.init('imp31687115');
    IMP.request_pay({
        pg: "kakaopay.TCSUBSCRIP",
        pay_method: "card",
        merchant_uid: createOrderNum(),   // 주문번호
        name: getProductName(), // 상품명을 가져옴
        amount: test,   // 숫자 타입
        buyer_email: userEmail,
        buyer_name: userName,
        buyer_tel: userPhone,
        buyer_addr: userAddress,
        m_redirect_url : '{/paysucces}'
    }, function (rsp) { 
    // callback
        if(rsp.success){
            uid = rsp.imp_uid;
         
            // 결제 성공 시 AJAX를 통해 서버에 데이터 전송
            var data = {
                orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: finalPayAmount, // 결제 금액
                buyerEmail: userEmail.textContent, // 구매자 이메일
                buyerName: userName.textContent,// 구매자 이름
                buyerTel: userPhone.textContent, // 구매자 전화번호
                buyerAddr: userAddress.textContent, // 구매자 주소
            };
            // AJAX를 통해 데이터를 서버에 전송
            
            $.ajax({        
                type: "POST",
                url: '/paysucces' + rsp.imp_uid,
                data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    console.log("결제 정보가 성공적으로 전송되었습니다.");
                    console.log(response); // 서버 응답 확인
                },
                error: function(error) {
                    console.error("결제 정보 전송 중 오류가 발생했습니다.");
                    console.error(error); // 오류 내용 확인
                }
            });
        } else {
            console.log(rsp);
        }
    });        
    break;

   
   
   
   
   
   
   
   
                case 'pay_card':
    // Method 2에 해당하는 결제창 열기
    IMP.init('imp31687115');
    $('#overlay').show();
    IMP.request_pay({
        pg: 'mobilians',
        pay_method: 'card',
        merchant_uid: createOrderNum(), // 상점에서 생성한 고유 주문번호
        name: getProductName(), // 상품명을 가져옴
        amount: finalPayAmount,
        buyer_email: userEmail,
        buyer_name: userName,
        buyer_tel: userPhone,
        buyer_addr: userAddress,
        m_redirect_url : '{/paysucces}'
    }, function(rsp) { // callback 로직
        //* ...중략... *//
        $('#overlay').hide();

        // 결제 요청이 성공적으로 완료된 경우
        if (rsp.success) {
            // 결제 정보를 서버로 전송
            var data = {
                merchant_uid: createOrderNum(), // 결제 고유 번호
                orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: finalPayAmount, // 결제 금액
                buyerEmail: userEmail, // 구매자 이메일
                buyerName: userName,// 구매자 이름
                buyerTel: userPhone, // 구매자 전화번호
                buyerAddr: userAddress, // 구매자 주소
            };

            // 결제 정보를 서버로 전송하는 AJAX 요청
            $.ajax({
                type: "POST",
                url: '/paysucces', // 결제 정보 전송을 처리하는 서버의 URL
                data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    console.log("결제 정보가 성공적으로 전송되었습니다.");
                    console.log(response); // 서버 응답 확인
                },
                error: function(error) {
                    console.error("결제 정보 전송 중 오류가 발생했습니다.");
                    console.error(error); // 오류 내용 확인
                }
            });
        } else {
            console.log(rsp);
        }
    });
    break;

                  
                  
                  
                  
                              
              case 'pay_phone':
    // Method 3에 해당하는 결제창 열기
    IMP.init('imp31687115');
    $('#overlay').show();
    IMP.request_pay({
        pg: "mobilians",
        pay_method: "phone",
        merchant_uid: createOrderNum(), // 주문번호
        name: getProductName(),
        amount: 1004,                         // 숫자 타입
        buyer_email: userEmail,
        buyer_name: userName,
        buyer_tel: userPhone,
        buyer_addr: userAddress,
        m_redirect_url : '{/paysucces}'
    }, function(rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            // 결제 성공 시 서버로 결제 정보 전송
            var data = {
                merchant_uid: createOrderNum(), // 결제 고유 번호
                orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: getProducPrice(), // 결제 금액
                buyerEmail: userEmail, // 구매자 이메일
                buyerName: userName,// 구매자 이름
                buyerTel: userPhone, // 구매자 전화번호
                buyerAddr: userAddress, // 구매자 주소
            };

            // AJAX를 통해 결제 정보를 서버로 전송
            $.ajax({
                type: "POST",
                url: '{pay/pay}', // 결제 정보 전송을 처리하는 서버의 URL
                data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    console.log("결제 정보가 성공적으로 전송되었습니다.");
                    console.log(response); // 서버 응답 확인
                },
                error: function(error) {
                    console.error("결제 정보 전송 중 오류가 발생했습니다.");
                    console.error(error); // 오류 내용 확인
                }
            });
        } else {
            console.log(rsp);
        }
        $('#overlay').hide();
    });
    break;
default:
    alert('결제 방법을 선택해주세요.');
    break;

        
        
        
        
        
        
        
        
        
        // 상품명을 가져오는 함수
function getProductName() {
    var productName = $('.pay_FirstName').text(); // 상품명을 클래스 이름이 'pay_FirstName'인 요소에서 가져옴
    var productBrand = $('.pay_subFirstName').text(); // 브랜드명을 클래스 이름이 'pay_subFirstName'인 요소에서 가져옴
    return productName + ' ' + productBrand; // 상품명과 브랜드명을 결합하여 반환
}

var finalPayAmount = document.querySelector('.pay_Finalpay').innerText;


function createOrderNum() {
    // 현재 시간을 기반으로 주문번호 생성
    const timestamp = Date.now();
    // 랜덤한 숫자를 추가하여 주문번호 생성
    const randomNum = Math.floor(Math.random() * 10000);
    // 주문번호 생성
    const orderNum = `ORD${timestamp}-${randomNum}`;
    return orderNum;
}


var productName = getProductName(); // 상품명 가져오기
            var userEmail = document.querySelector('.pay_userEmails').textContent.trim(); // 이메일 정보 가져오기
            var userName = document.querySelector('.pay_usernames').textContent.trim(); // 이름 정보 가져오기
            var userPhone = document.querySelector('.pay_userPhones').textContent.trim(); // 연락처 정보 가져오기
            var userAddress = document.querySelector('.pay_useraddresss').textContent.trim(); // 주소 정보 가져오기


};

};


