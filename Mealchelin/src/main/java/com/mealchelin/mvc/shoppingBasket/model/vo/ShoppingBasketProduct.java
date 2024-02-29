package com.mealchelin.mvc.shoppingBasket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingBasketProduct {
	private int prdNo;
	
	private int memNo;
	
	private int quantity;
	
	private int totalPrice;
}
