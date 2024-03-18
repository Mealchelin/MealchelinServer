package com.mealchelin.mvc.shoppingBasket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingBasket {
	
		private int memberNo;
		
		private int payment;
		
		private int shipNo;

}
