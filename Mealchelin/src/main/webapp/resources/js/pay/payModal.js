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
				      merchant_uid: "ORD20180131-00000150",   // 주문번호
				      name: "안동식 순살찜닭 외 2개",
				      amount: 47100,                         // 숫자 타입
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
				    name : '주문명:결제테스트',
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
				      merchant_uid: "ORD20180131-0000150",   // 주문번호
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





























function requestPay() {


    IMP.request_pay({
      pg: "kakaopay",
      pay_method: "kakaopay",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      	if(rsp.success){
      		console.log(rsp)
      	}else{
      		console.log(rsp)
      	}
      	
    });
  }
  function requestPay() {


    IMP.request_pay({
      pg: "mobilians",
      pay_method: "card ",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      	if(rsp.success){
      		console.log(rsp)
      	}else{
      		console.log(rsp)
      	}
      	
    });
  }
  function requestPay() {


    IMP.request_pay({
      pg: "mobilians",
      pay_method: "phone",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      	if(rsp.success){
      		console.log(rsp)
      	}else{
      		console.log(rsp)
      	}
      	
    });
  }