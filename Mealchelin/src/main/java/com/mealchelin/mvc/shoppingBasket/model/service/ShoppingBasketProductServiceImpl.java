package com.mealchelin.mvc.shoppingBasket.model.service;

import org.springframework.stereotype.Service;

import com.mealchelin.mvc.shoppingBasket.model.mapper.ShoppingBasketProductMapper;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShoppingBasketProductServiceImpl implements ShoppingBasketProductService {
	
	private final ShoppingBasketProductMapper sbpMapper;

	@Override
	public int save(ShoppingBasketProduct sbp) {
		return sbpMapper.insertSbp(sbp);
	}

}
