package com.mealchelin.mvc.pay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {

	private int prdNo;
	
    private int memberNo;
    
    private int totalPrice;
    
    private int price;
    
    private int payment;
	
}
