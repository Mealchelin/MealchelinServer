package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


@Mapper
public interface ShoppingBasketProductMapper {

	int insertSbp(ShoppingBasketProduct sbp);

	ShoppingBasketProduct selectSbpByNo(@Param("prdNo") int prdNo, @Param("memNo") int memNo);

}
