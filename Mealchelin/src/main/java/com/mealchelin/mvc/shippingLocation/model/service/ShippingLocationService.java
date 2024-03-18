package com.mealchelin.mvc.shippingLocation.model.service;

import java.util.List;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

public interface ShippingLocationService {


	ShippingLocation getShippingInfoByInfo(int memberNo);

	int save(ShippingLocation shippingLocation);

	List<ShippingLocation> getShippingLocationListByLoginMember(int memberNo);

	int getShippingLocationCountByMemberNo(int memberNo);

	int delete(Member loginMember, int shipNo);

	int changeDefaultLocation(int shipNo);

	ShippingLocation getShippingLocationByShipNo(int no);

	ShippingLocation getDefaultShippingLocationByMemNo(int memberNo);

	

	
	
}