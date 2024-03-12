package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;

@Mapper
public interface ShoppingBasketMapper {
	
	int insertShoppingBasket(ShoppingBasket shoppingBasket);
	
	int findShoppingBasketProduct();
}
