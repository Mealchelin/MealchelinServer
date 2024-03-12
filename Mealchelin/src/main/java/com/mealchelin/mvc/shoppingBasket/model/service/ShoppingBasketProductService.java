package com.mealchelin.mvc.shoppingBasket.model.service;


import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


public interface ShoppingBasketProductService {

	int save(ShoppingBasketProduct sbp);

	ShoppingBasketProduct findSbpByNo(int prdNo, int memberNo);

	int getSbpCountByMemberNo(int memberNo);
	
	

}
