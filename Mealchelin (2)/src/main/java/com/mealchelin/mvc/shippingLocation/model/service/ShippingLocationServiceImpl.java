package com.mealchelin.mvc.shippingLocation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	@Transactional
	public int save(ShippingLocation shippingLocation) {
		int result = 0;
		
		if(result > 0) {
			// update 
		} else {
			// insert
			
			result = mapper.insertShippingLocation(shippingLocation);
		}
		
		return result;
	}


	

}
