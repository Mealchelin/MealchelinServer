package com.mealchelin.mvc.shoppingBasket.model.service;

import org.springframework.stereotype.Service;

import com.mealchelin.mvc.shoppingBasket.model.mapper.ShoppingBasketProductMapper;
<<<<<<< HEAD
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;
=======
import com.mealchelin.mvc.shoppingBasketProduct.model.vo.ShoppingBasketProduct;
>>>>>>> origin/feature/pay_sy

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
