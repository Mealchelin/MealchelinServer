package com.mealchelin.mvc.pay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayMent {

	private int payMent;
	
	private int price;
	
	private int totalPrice;
	
}
