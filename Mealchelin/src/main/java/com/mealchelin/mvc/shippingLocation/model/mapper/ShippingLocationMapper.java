package com.mealchelin.mvc.shippingLocation.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;




@Mapper
public interface ShippingLocationMapper {

	
	ShippingLocation selectFindByNo(@Param("memberNo") int memberNo);
	
	
	
	

}
