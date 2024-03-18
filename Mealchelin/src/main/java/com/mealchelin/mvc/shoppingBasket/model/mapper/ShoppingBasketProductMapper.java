package com.mealchelin.mvc.shoppingBasket.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


@Mapper
public interface ShoppingBasketProductMapper {

	int insertSbp(ShoppingBasketProduct sbp);
	
	List<ShoppingBasketProduct> selectByProduct(@Param("memberNo") int memberNo); // 반환 타입 수정

	ShoppingBasketProduct selectSbpByNo(@Param("prdNo") int prdNo, @Param("memberNo") int memberNo);

	int selectSbpCountByMemberNo(@Param("memberNo") int memberNo);

	List<ShoppingBasketProduct> selectSbpAllbyMemNo(ShoppingBasketProduct shoppingBasketProduct);

	int deleteSbpByNo(@Param("prdNo") int prdNo, @Param("memberNo") int memberNo);

	int updateSbpByNo(ShoppingBasketProduct shoppingBasketProduct);

	int deleteSbpBySell(@Param("memberNo") int memberNo);

}
