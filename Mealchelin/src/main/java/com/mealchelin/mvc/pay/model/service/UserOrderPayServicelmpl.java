package com.mealchelin.mvc.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.shoppingBasket.model.mapper.ShoppingBasketProductMapper;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserOrderPayServicelmpl implements UserOrderPayService {

	@Autowired
	private final ShoppingBasketProductMapper mapper;
	
	
	@Override
    public List<ShoppingBasketProduct> getShippingList(int memberNo) {
        return mapper.selectByProduct(memberNo);
    }
	
	


	
	
	

}
