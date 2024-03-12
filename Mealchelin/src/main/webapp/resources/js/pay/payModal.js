document.getElementById('payButton').addEventListener('click', function() {
			let price = document.getElementById('price').innerText;
			let split = price.split(',', 2)
			let split2 = (split[0] + split[1]).split('원');
			let split3 = parseInt(split2[0]);
			
			let quest = document.getElementById('payDeliveryUserRequest').value;
			
			
			//체크박스별 결제방식 
        function getSelectedMethod() {
            var checkboxes = document.getElementsByName('pay_check');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    return checkboxes[i].value;
                }
            }
            return null;
        }
        
         var selectedMethod = getSelectedMethod();
            openPaymentPage(selectedMethod, split3);

			//확인
			console.log(getusername());
			console.log(getuserphone());
			console.log(getuserEmail());
			console.log(getProductName());
			console.log(getProductAdress());
			console.log(price);     
			console.log(quest);     
			
			
			console.log(createOrderNum());
			console.log(typeof createOrderNum());

			
        });


function getusername() {
   	var username = document.getElementById('username').innerText;
    return username;
}
function getuserphone() {
   var userphone = document.getElementById('userphone').innerText;
    return userphone;
}
function getuserEmail() {
   var userEmail = document.getElementById('userEmail').innerText;
    return userEmail;
}
        // 상품명을 가져오는 함수
function getProductName() {
    var productName = $('#payFirstName').text(); // 상품명을 클래스 이름이 'pay_FirstName'인 요소에서 가져옴
    var productBrand = $('#paysubFirstName').text(); // 브랜드명을 클래스 이름이 'pay_subFirstName'인 요소에서 가져옴
    return productName + ' ' + productBrand; // 상품명과 브랜드명을 결합하여 반환
}

//주소명 가져오는 함수 
function getProductAdress() {
    var shipaddress = $('#shipaddress').text(); // 상품명을 클래스 이름이 'pay_FirstName'인 요소에서 가져옴
    var shipaddressdetail = $('#shipaddressdetail').text(); // 브랜드명을 클래스 이름이 'pay_subFirstName'인 요소에서 가져옴
    return shipaddress + ' ' + shipaddressdetail; // 상품명과 브랜드명을 결합하여 반환
    

}

function getquest(){
	let quest = document.getElementById('payDeliveryUserRequest').value; // 상품명을 클래스 이름이 'pay_FirstName'인 요소에서 가져옴
	 return quest;
}





function createOrderNum() {
    // 현재 시간을 기반으로 주문번호 생성
    const timestamp = Date.now();
    // 랜덤한 숫자를 추가하여 주문번호 생성
    const randomNum = Math.floor(Math.random() * 10000);
    // 주문번호 생성
    const orderNum = `ORD${timestamp}-${randomNum}`;
    return orderNum;
};





 function openPaymentPage(method, split3) {
    switch (method) {
        case 'pay_kakao':
    // Method 1에 해당하는 결제창 열기
    IMP.init('imp31687115');
    IMP.request_pay({
        pg: "kakaopay.TCSUBSCRIP",
        pay_method: "card",
        merchant_uid: createOrderNum(),   // 주문번호
        name: getProductName(), // 상품명을 가져옴
        amount: split3,   // 숫자 타입
        buyer_email: getuserEmail(),
        buyer_name: getusername(),
        buyer_tel: getuserphone(),
        buyer_addr: getProductAdress(),
        quest : getquest(),
        m_redirect_url : '/payment/paysucces/'
    }, function (rsp) { 
    // callback
        if(rsp.success){
            uid = rsp.imp_uid;
         
            // 결제 성공 시 AJAX를 통해 서버에 데이터 전송
            var data = {
                orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: split3, // 결제 금액
                buyerEmail: getuserEmail(), // 구매자 이메일
                buyerName: getusername(),// 구매자 이름
                buyerTel: getuserphone(), // 구매자 전화번호
                buyerAddr: getProductAdress(), // 구매자 주소
                paymentMethod: '카카오페이', // 결제 방식 추가
                quest : getquest()
            };
            // AJAX를 통해 데이터를 서버에 전송
            
            
            console.log(data);
            $.ajax({  
                  
			    type: "POST",
			    url: '/payment/paysucces/',
			    data: JSON.stringify(data),
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    success: function(response) {
			        console.log("결제 정보가 성공적으로 전송되었습니다.");
			        console.log(response);
			        window.location.href = '/payment/paysucces'; // GET 요청 보냄
			    },
			    error: function(error) {
			        console.error("결제 정보 전송 중 오류가 발생했습니다.");
			        console.error(error);
			    }
			});
                    // 결제가 완료되면 페이지를 리다이렉트하여 완료 페이지로 이동합니다.
                    window.location.href = '/payment/paysucces'; // 리다이렉트할 URL을 지정합니다.
                } else {
                    console.log(rsp);
                }
            });        
    break;


              case 'pay_card':
    IMP.init('imp31687115');
    $('#overlay').show();
    IMP.request_pay({
        pg: 'mobilians',
        pay_method: "card",
        merchant_uid: createOrderNum(),   // 주문번호
        name: getProductName(), // 상품명을 가져옴
        amount: split3,   // 숫자 타입
        buyer_email: getuserEmail(),
        buyer_name: getusername(),
        buyer_tel: getuserphone(),
        buyer_addr: getProductAdress(),
        quest : getquest(),
        m_redirect_url : '/payment/paysucces/'
    }, function(rsp) {
        $('#overlay').hide();
        if (rsp.success) {
            var data = {
               orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: split3, // 결제 금액
                buyerEmail: getuserEmail(), // 구매자 이메일
                buyerName: getusername(),// 구매자 이름
                buyerTel: getuserphone(), // 구매자 전화번호
                buyerAddr: getProductAdress(), // 구매자 주소
                paymentMethod: '신용카드', // 결제 방식 추가
                quest : getquest()
            };

    console.log(data);
            $.ajax({  
                  
			    type: "POST",
			    url: '/payment/paysucces/',
			    data: JSON.stringify(data),
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    success: function(response) {
			        console.log("결제 정보가 성공적으로 전송되었습니다.");
			        console.log(response);
			        window.location.href = '/payment/paysucces'; // GET 요청 보냄
			    },
			    error: function(error) {
			        console.error("결제 정보 전송 중 오류가 발생했습니다.");
			        console.error(error);
			    }
			});
                    // 결제가 완료되면 페이지를 리다이렉트하여 완료 페이지로 이동합니다.
                    window.location.href = '/payment/paysucces'; // 리다이렉트할 URL을 지정합니다.
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
        merchant_uid: createOrderNum(),   // 주문번호
        name: getProductName(), // 상품명을 가져옴
        amount: split3,   // 숫자 타입
        buyer_email: getuserEmail(),
        buyer_name: getusername(),
        buyer_tel: getuserphone(),
        buyer_addr: getProductAdress(),
        quest : getquest(),
        m_redirect_url : '/payment/paysucces/'
   }, function(rsp) {
        $('#overlay').hide();
        if (rsp.success) {
            var data = {
               orderNo: createOrderNum(), // 주문번호
                productName: getProductName(), // 상품명을 가져옴
                amount: split3, // 결제 금액
                buyerEmail: getuserEmail(), // 구매자 이메일
                buyerName: getusername(),// 구매자 이름
                buyerTel: getuserphone(), // 구매자 전화번호
                buyerAddr: getProductAdress(), // 구매자 주소
                paymentMethod: '신용카드', // 결제 방식 추가
                quest : getquest()
            };

    console.log(data);
            $.ajax({  
                  
			    type: "POST",
			    url: '/payment/paysucces/',
			    data: JSON.stringify(data),
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    success: function(response) {
			        console.log("결제 정보가 성공적으로 전송되었습니다.");
			        console.log(response);
			        window.location.href = '/payment/paysucces'; // GET 요청 보냄
			    },
			    error: function(error) {
			        console.error("결제 정보 전송 중 오류가 발생했습니다.");
			        console.error(error);
			    }
			});
                    // 결제가 완료되면 페이지를 리다이렉트하여 완료 페이지로 이동합니다.
                    window.location.href = '/payment/paysucces'; // 리다이렉트할 URL을 지정합니다.
                } else {
                    console.log(rsp);
                }
            });        
    break;
default:
    alert('결제 방법을 선택해주세요.');
    break;

        

};

}
