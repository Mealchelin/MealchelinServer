package com.mealchelin.mvc.shoppingBasket.model.service;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;

public interface ShoppingBasketService {

	int save(int memberNo);

	ShoppingBasket getBasket(int memberNo);

	int updateSbByNo(ShoppingBasket shoppingBasket);

	int resetSbPayment(int memNo, int reset);

}
