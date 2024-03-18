package com.mealchelin.mvc.shippingLocation.model.service;

import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

public interface ShippingLocationService {


	ShippingLocation getShippingInfoByInfo(int memberNo);

	int save(ShippingLocation shippingLocation);

	

	
	
}
