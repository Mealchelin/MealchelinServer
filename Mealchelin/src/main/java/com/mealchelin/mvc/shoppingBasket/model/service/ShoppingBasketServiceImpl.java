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
	public int save(int memberNo) {
		int result = 0;
		
		if (result > 0) {
			// update 
		} else {
			//insert 
			result = shoppingBasketMapper.insertShoppingBasket(memberNo);
		}
		return result;
	}


	@Override
	public ShoppingBasket getBasket(int memberNo) {
		
		return shoppingBasketMapper.selectGetBasket(memberNo);
	}

}
