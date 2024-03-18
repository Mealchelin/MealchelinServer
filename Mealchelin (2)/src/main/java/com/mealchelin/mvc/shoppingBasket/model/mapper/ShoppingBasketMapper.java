package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;

@Mapper
public interface ShoppingBasketMapper {
	
	int insertShoppingBasket(int memberNo);
	
	int findShoppingBasketProduct();
	
	ShoppingBasket selectGetBasket(int memberNo);

	int updateBasket(ShoppingBasket shoppingBasket);

	int updatePayment(@Param("memNo") int memNo, @Param("reset") int reset);
}
