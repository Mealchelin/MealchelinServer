$(document).ready(()=>{

    // 1. 수량 버튼으로 수량 바꾸기
    // 2. 수량에 맞는 총 상품 금액 표현하기
    let quantity = parseInt($('.myCounter-quantity').val());

    // 카운터 
     // 1) 하나 빼기 (최소값: 1)
    $('.myCounter-minus').on('click', () => { 
        $('.myCounter-quantity').val(quantity -= 1);
        if (quantity == 0) {
        alert('수량은 1개부터 가능합니다.');
        $('.myCounter-quantity').val(quantity = 1);  
        } 
    
    });

      // 1) 하나 더하기(최대값:99)
    $('.myCounter-plus').on('click', () => { 
        $('.myCounter-quantity').val(quantity += 1);
        if (quantity == 99) {
        alert('수량은 99개까지 가능합니다.');
        $('.myCounter-quantity').val(quantity = 99);  
        } 
    
    });
    
});