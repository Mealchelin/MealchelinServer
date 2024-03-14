package com.mealchelin.mvc.shoppingBasket.model.service;


import java.util.List;

import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


public interface ShoppingBasketProductService {

	int save(ShoppingBasketProduct sbp);

	ShoppingBasketProduct findSbpByNo(int prdNo, int memberNo);

	int getSbpCountByMemberNo(int memberNo);

	List<ShoppingBasketProduct> getBasketlist(ShoppingBasketProduct shoppingBasketProduct);

	ShoppingBasketProduct getSbpByNo(int prdNo, int memberNo);

	int deleteSbpByNo(int prdNo, int memberNo);

	int updateSbpByNo(ShoppingBasketProduct shoppingBasketProduct);

}
