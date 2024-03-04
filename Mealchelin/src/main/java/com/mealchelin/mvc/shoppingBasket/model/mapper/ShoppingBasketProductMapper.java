package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


@Mapper
public interface ShoppingBasketProductMapper {

	int insertSbp(ShoppingBasketProduct sbp);

}
