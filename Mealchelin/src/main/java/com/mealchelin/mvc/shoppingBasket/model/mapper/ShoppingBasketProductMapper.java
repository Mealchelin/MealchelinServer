package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


@Mapper
public interface ShoppingBasketProductMapper {

	int insertSbp(ShoppingBasketProduct sbp);
	
	 List<ShoppingBasketProduct> selectByProduct(@Param("memberNo") int memberNo); // 반환 타입 수정

	ShoppingBasketProduct selectSbpByNo(@Param("prdNo") int prdNo, @Param("memNo") int memNo);

}
