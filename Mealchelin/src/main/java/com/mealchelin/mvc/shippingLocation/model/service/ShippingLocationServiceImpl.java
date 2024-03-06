package com.mealchelin.mvc.shippingLocation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.shippingLocation.model.mapper.ShippingLocationMapper;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

import lombok.RequiredArgsConstructor;




@Service
@RequiredArgsConstructor
public class ShippingLocationServiceImpl implements ShippingLocationService {
	
	@Autowired
	private ShippingLocationMapper mapper;
	
	@Override
	public ShippingLocation getShippingInfoByInfo(int memberNo) {
		return mapper.selectFindByNo(memberNo);
	}


	

}
