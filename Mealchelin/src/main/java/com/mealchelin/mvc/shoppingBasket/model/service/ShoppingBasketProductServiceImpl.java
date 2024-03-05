package com.mealchelin.mvc.shoppingBasket.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.shoppingBasket.model.mapper.ShoppingBasketProductMapper;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShoppingBasketProductServiceImpl implements ShoppingBasketProductService {
	
	private final ShoppingBasketProductMapper sbpMapper;

	@Override
	public ShoppingBasketProduct findSbpByNo(int prdNo, int memNo) {
		return sbpMapper.selectSbpByNo(prdNo, memNo);
	}
	
	@Override
	@Transactional
	public int save(ShoppingBasketProduct sbp) {
		int result = 0;
		int prdNo = sbp.getPrdNo();
		int memNo = sbp.getMemberNo();
		ShoppingBasketProduct sbp2 = this.findSbpByNo(prdNo, memNo);
		
		
		// 멤버 번호가 같으면서 상품 번호가 같은것이 있으면
		if (sbp2 != null) {
			result = 0;
		} else {
			result = sbpMapper.insertSbp(sbp);
		}
		
		return result;
	}

}
