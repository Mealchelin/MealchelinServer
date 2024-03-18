package com.mealchelin.mvc.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderProduct {

	
	
//상품번호
private int proNo;

//주문 번호
private long orderNo;

// 상품 수량 
private int quantity;


//상품 총가격
private int totalPrice;
	

}
