$(document).ready(()=>{

    // 전체 체크박스 
    $('#mycheckerAll').click(function(){
        if($('#mycheckerAll').prop("checked")){
            $('.mychecker').prop("checked", true);
        } else {
            $('.mychecker').prop("checked", false);
        }
    });

    // 1. 수량 버튼으로 수량 바꾸기
    // 2. 수량에 맞는 총 상품 금액 표현하기
    let quantity = parseInt($('#my-view-quantity1').val());
    let quantity2 = parseInt($('#my-view-quantity2').val());

    // 카운터 
     // 1) 하나 빼기 (최소값: 1)
    $('#my-view-quantity-minus1').on('click', () => { 
        $('#my-view-quantity1').val(quantity -= 1);
        if (quantity == 0) {
        alert('수량은 1개부터 가능합니다.');
        $('#my-view-quantity1').val(quantity = 1);  
        } 
        let price1 = quantity*12000;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#my-view-totalPrice1").html(price2 + "원");
        
    
    });

      // 1) 하나 더하기(최대값:99)
    $('#my-view-quantity-plus1').on('click', () => { 
        $('#my-view-quantity1').val(quantity += 1);
        if (quantity == 99) {
        alert('수량은 99개까지 가능합니다.');
        $('#my-view-quantity1').val(quantity = 99);  
        } 
        let price1 = quantity*12000;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#my-view-totalPrice1").html(price2 + "원"); 

    
    });

       // 카운터 
     // 1) 하나 빼기 (최소값: 1)
    $('#my-view-quantity-minus2').on('click', () => { 
        $('#my-view-quantity2').val(quantity2 -= 1);
        if (quantity2 == 0) {
        alert('수량은 1개부터 가능합니다.');
        $('#my-view-quantity2').val(quantity2 = 1);  
        } 
        let price1 = quantity2*12000;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#my-view-totalPrice2").html(price2 + "원");

    
    });

      // 1) 하나 더하기(최대값:99)
    $('#my-view-quantity-plus2').on('click', () => { 
        $('#my-view-quantity2').val(quantity2 += 1);
        if (quantity2 == 99) {
        alert('수량은 99개까지 가능합니다.');
        $('#my-view-quantity2').val(quantity2 = 99);  
        } 
        let price1 = quantity2*12000;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#my-view-totalPrice2").html(price2 + "원"); 
    });

    
});