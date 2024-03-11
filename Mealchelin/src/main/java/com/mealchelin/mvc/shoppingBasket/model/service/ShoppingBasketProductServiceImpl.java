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
	public ShoppingBasketProduct findSbpByNo(int prdNo, int memberNo) {
		return sbpMapper.selectSbpByNo(prdNo, memberNo);
	}
	
	@Override
	public int getSbpCountByMemberNo(int memberNo) {
		return sbpMapper.selectSbpCountByMemberNo(memberNo);
	}
	
	@Override
	@Transactional
	public int save(ShoppingBasketProduct sbp) {
		int resultCode = 0;
		int prdNo = sbp.getPrdNo();
		int memberNo = sbp.getMemberNo();
		ShoppingBasketProduct sbp2 = this.findSbpByNo(prdNo, memberNo);
		int count = this.getSbpCountByMemberNo(memberNo);
		
		// 멤버 번호가 같으면서 상품 번호가 같은것이 있으면
		if (sbp2 == null) {
			// 멤버 번호에 대한 장바구니 상품이 최대 5개까지만 insert -> 5개보다 작을 떄까지 
			if (count < 5) {
				resultCode = sbpMapper.insertSbp(sbp);
			} else {
				resultCode = 3;
			}
		} else {
			resultCode = 2;
		}
		
		return resultCode;
	}
	
	

}
