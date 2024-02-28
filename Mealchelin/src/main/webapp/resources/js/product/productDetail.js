$(document).ready(() => {


    // 1. 수량 버튼으로 수량 바꾸기
    // 2. 수량에 맞는 총 상품 금액 표현하기
    let quantity = parseInt($('#pd-view-quantity').val());
    
    // 1) 하나 빼기 (최소값: 1)
    let minus = $('#pd-view-quantity-minus');
    minus.on('click', () => {
        if (quantity != 1) {
            $('#pd-view-quantity').val(quantity-=1)
            if (quantity < 10) {
                $('#pd-view-quantity').css("width", "10px")
            }
        }
        let price1 = quantity*18900;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#pd-view-totalPrice").html(price2 + "원");
    });

    // 2) 하나 더하기 (최대값: 99)
    let plus = $('#pd-view-quantity-plus');
    plus.on('click', () => {
        if (quantity != 99) {
            $('#pd-view-quantity').val(quantity+=1)
            if (quantity >= 10) {
                $('#pd-view-quantity').css("width", "16px")
            }
        }
        let price1 = quantity*18900;
        let price2 = price1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#pd-view-totalPrice").html(price2 + "원");
    });
    
    // 3. 장바구니 / 구매하기 버튼 둘 다 submit 보내기
    



});