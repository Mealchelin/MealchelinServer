package com.mealchelin.mvc.orderProduct.service;

import org.springframework.stereotype.Service;

import com.mealchelin.mvc.order.model.vo.OrderProduct;
import com.mealchelin.mvc.orderProduct.mapper.OrderProductMapper;

import lombok.RequiredArgsConstructor;




@Service
@RequiredArgsConstructor
public class OrderProductServicelmpl implements OrderProductService {
	
	private OrderProductMapper orderProductMapper;
	
	@Override
	public OrderProduct insave(OrderProduct orderProduct) {
		return orderProductMapper.insectOrderProduct();
	}
	

	


}
