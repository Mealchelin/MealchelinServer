$(document).ready(()=>{

	totalCalc();
    
    // 1. 수량 버튼으로 수량 바꾸기
    // 2. 수량에 맞는 총 상품 금액 표현하기
    //let quantity = parseInt($('.myCounter-quantity').val());
    $('.counter').on('click', function(event) { 
        let prdNo = $(this).closest('tr.mytr').find('.hiddenNo').val();
        let plusMinusVal = $(this).prop('class').split(' ');
        let quantityEle = $(this).siblings('.myCounter-quantity');
        let quantity = parseInt(quantityEle.val());
        let hiddenPrice = $(this).siblings('.hiddenPrice').val();
    
        if (plusMinusVal.includes('myCounter-plus')) {
            quantity++;
        } else {
            quantity = Math.max(1, quantity - 1);
        }
    
        let totalPrice = quantity * parseInt(hiddenPrice); // totalPrice 계산
    
        $.ajax({
            type : "POST",
            url : "/mypage/updateQuantity",
            dataType : "json",
            data : {
                "prdNo" : prdNo,
                "quantity": quantity,
                "totalPrice": totalPrice
            },
            error : function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(data){
                if (data.success) {
                    quantityEle.val(quantity);
                    let resultStr = (totalPrice+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';

                    $(event.target).closest('tr.mytr').find('.myProductPrice').text(resultStr);
                    totalCalc(); 
                } else {
                    alert('수량 업데이트에 실패했습니다.');
                }
            }
        });
    });


    $(document).on('click', 'a.deleteProduct', function(event) {
    	let prdNo = $(this).closest('tr.mytr').find('.hiddenNo').val();
	    
	    $.ajax({
	        type : "POST",
	        url : "/mypage/shoppingBasketDelete",
	        dataType : "json",
	        data : {"prdNo" : prdNo},
	        error : function(request, status, error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        },
	        success : function(data){
	            if(data.success){
                    $(event.target).parents('tr.mytr').remove();
                    //myAllPrice
                    totalCalc();
                } else {
                    alert('삭제를 다시 시도해주세요.')
                }
	        }
	    });
		
    });
    
});

    function totalCalc()
    {
        let totalCalcEle = $('div.myAllPrice');
        let myProductPriceEle = $('div.myProductPrice');

        let totalPrice = 0;

        myProductPriceEle.each((idx, element) => 
        {
            let priceStr = $(element).text().replace(/[^0-9]/gi, '').replace('원', '');
            totalPrice += parseInt(priceStr);
        });
        // console.log(totalPrice);
        
        let resultStr = (totalPrice+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';

        totalCalcEle.text(resultStr);

    }

    $('.finalbtn').on('click', function(event) { 
        let myProductPriceEle = $('div.myProductPrice');

        let totalPrice = 0;
        
        myProductPriceEle.each((idx, element) => 
        {
            let priceStr = $(element).text().replace(/[^0-9]/gi, '').replace('원', '');
            totalPrice += parseInt(priceStr);
        });
        
        if (totalPrice == 0) {
        	alert("최소 1개의 상품이 담겨 있어야 합니다.");
        	event.preventDefault();
        } else {
	        $.ajax({
		        type : "POST",
		        url : "/mypage/shoppingBasketTotal",
		        dataType : "json",
		        data : {"payment" : totalPrice},
		        error : function(request, status, error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        },
		        success : function(data){
	                if(data.success){
	                    location.href="/payment/pay";
	                } else {
	                    alert('구매하기 버튼을 다시 눌러주세요.')
	                }
	            }
		    });
        }

    });
