package com.mealchelin.mvc.orderProduct.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.order.model.vo.OrderProduct;

@Mapper
public interface OrderProductMapper {

	OrderProduct insectOrderProduct();
	
	
}
