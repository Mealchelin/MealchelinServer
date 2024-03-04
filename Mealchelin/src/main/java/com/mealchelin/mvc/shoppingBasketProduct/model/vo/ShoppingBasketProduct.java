package com.mealchelin.mvc.shoppingBasketProduct.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingBasketProduct {


	
	private int prdNo;
	
	private int MemNo;
	
	private int quantity;
	
	private int totalPrice;

	
}
