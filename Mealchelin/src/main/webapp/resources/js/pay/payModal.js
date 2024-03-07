document.getElementById('payButton').addEventListener('click', function() {
            var selectedMethod = getSelectedMethod();
            openPaymentPage(selectedMethod);
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


 function openPaymentPage(method) {
    switch (method) {
        case 'pay_kakao':
            // Method 1에 해당하는 결제창 열기
            IMP.init('imp31687115');
            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                merchant_uid: "ORD20184231-0001123151550",   // 주문번호
                name: getProductName(), // 상품명을 가져옴
                amount: getProducPrice(),                         // 숫자 타입
                buyer_email: "tjddus@gmail.com",
                buyer_name: "백성연",
                buyer_tel: "010-0000-0000",
                buyer_addr: "서울 동작구 가로수길 109",
                buyer_postcode: "01181",
                m_redirect_url : '{/paysucces}'
            }, function (rsp) { // callback
                if(rsp.success){
                    console.log(rsp);
                    // 결제 성공 시 AJAX를 통해 서버에 데이터 전송
                    var data = {
                        orderNo: "ORD20184231-0001123151550", // 주문번호
                        productName: getProductName(), // 상품명을 가져옴
                        amount: getProducPrice(), // 결제 금액
                        buyerEmail: "tjddus@gmail.com", // 구매자 이메일
                        buyerName: "백성연", // 구매자 이름
                        buyerTel: "010-0000-0000", // 구매자 전화번호
                        buyerAddr: "서울 동작구 가로수길 109", // 구매자 주소
                        buyerPostcode: "01181" // 구매자 우편번호
                    };

                    // AJAX를 통해 데이터를 서버에 전송
                    $.ajax({
                        type: "POST",
                        url: "/paysucces", // 서버의 엔드포인트 URL
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
				    pg : 'mobilians',
				    pay_method : 'card',
				    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
				    name : '<c:out value="${shippingBaketInfoList.name}" />',
				    amount : 1004,
				    buyer_email : 'test@portone.io',
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678',  //필수 
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456',
				    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}'
				}, 
				function(rsp) { // callback 로직
					//* ...중략... *//
					 $('#overlay').hide();
				});
                    break;
                              
                case 'pay_phone':
                    // Method 3에 해당하는 결제창 열기
                    IMP.init('imp31687115');
                    
                     $('#overlay').show();
                     
                     
                   	 IMP.request_pay({
				      pg: "mobilians",
				      pay_method: "phone",
				      merchant_uid: "ORD20180131-012232323150",   // 주문번호
				      name: "안동식 순살찜닭 외 2개",
				      amount: 100,                         // 숫자 타입
				      buyer_email: "tjddus@gmail.com",
				      buyer_name: "백성연",
				      buyer_tel: "010-0000-0000",
				      buyer_addr: "서울 동작구 가로수길 109",
				      buyer_postcode: "01181",
				      m_redirect_url : '{pay/pay}'
				    }, function (rsp) { // callback
				      	if(rsp.success){
				      		console.log(rsp)
				      	}else{
				      		console.log(rsp)
				      	}
				      	 $('#overlay').hide();
				    });        
                    break;
                default:
                    alert('결제 방법을 선택해주세요.');
                    break;
            }
        }
        
        // 상품명을 가져오는 함수
function getProductName() {
    var productName = $('.pay_FirstName').text(); // 상품명을 클래스 이름이 'pay_FirstName'인 요소에서 가져옴
    var productBrand = $('.pay_subFirstName').text(); // 브랜드명을 클래스 이름이 'pay_subFirstName'인 요소에서 가져옴
    return productName + ' ' + productBrand; // 상품명과 브랜드명을 결합하여 반환
}

function getProducPrice() {
   var finalPayAmount = $('.shippingPrice').text(); 
}









