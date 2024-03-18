package com.mealchelin.mvc.shippingLocation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;


@Mapper
public interface ShippingLocationMapper {

	
	ShippingLocation selectFindByNo(@Param("orderNo") int orderNo);
	
	int insertShippingLocation(ShippingLocation shippingLocation);

	List<ShippingLocation> selectShippingLocationListByLoginMember(@Param("memberNo") int memberNo);

	int selectShippingLocationCountByMemberNo(@Param("memberNo") int memberNo);

	int updateStatus(@Param("shipNo") int shipNo);

	int setShipNoForChangeDefaultLocation(@Param("shipNo") int shipNo);

	ShippingLocation selectShippingLocationByShipNo(@Param("no") int no);

	ShippingLocation selectDefaultShippingLocationByMemNo(@Param("memNo") int memberNo);
	
	

}
