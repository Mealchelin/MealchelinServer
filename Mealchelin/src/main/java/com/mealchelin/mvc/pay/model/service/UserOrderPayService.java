package com.mealchelin.mvc.pay.model.service;

import java.util.List;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

public interface UserOrderPayService {

	List<ShoppingBasketProduct> getShippingList(int memberNo);


}
