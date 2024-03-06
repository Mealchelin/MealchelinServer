package com.mealchelin.mvc.shoppingBasket.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.shoppingBasket.model.mapper.ShoppingBasketMapper;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShoppingBasketServiceImpl implements ShoppingBasketService {

	private final ShoppingBasketMapper shoppingBasketMapper;
	
	
	@Override
	@Transactional
	public int save(ShoppingBasket shoppingBasket) {
		int result = 0;
		
		if (result > 0) {
			// update 
		} else {
			//insert 
			result = shoppingBasketMapper.insertShoppingBasket(shoppingBasket);
		}
		return result;
	}

}
