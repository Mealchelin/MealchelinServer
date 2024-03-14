package com.mealchelin.mvc.order.model.service;

import java.util.List;
import java.util.Map;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.vo.Orders;

public interface OrderService {
    int save(Map<String, Object> orderInfo);


	List<Orders> getOrderProductResultset(int memberNo);

	int updateOrderProduct(Long ordersNumbers, int orderNo);

	List<Orders> selectProductPayResultset(PageInfo pageInfo, int memberNo);


	int getPayListCount();


	List<Orders> selectPayInfo(int member);


	Orders selectPayInfoOne(int orderNo);




	
	


}