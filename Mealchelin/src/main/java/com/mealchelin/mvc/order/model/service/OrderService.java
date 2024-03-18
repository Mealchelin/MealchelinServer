package com.mealchelin.mvc.order.model.service;

import java.util.List;
import java.util.Map;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.order.model.vo.Orders;

public interface OrderService {
    int save(Map<String, Object> orderInfo);

	List<Orders> getOrderProductResultset(int memberNo);

	int updateOrderProduct(Long ordersNumbers, int orderNo);

	List<Orders> selectProductPayResultset(PageInfo pageInfo, int loginMember);

	int getPayListCount(int loginMember);

	int getadOrderCount(String shipStatus, String memId);

	List<Orders> getadOrderList(PageInfo pageInfo, String shipStatus, String memId);

	Orders getAdOrderByNo(int no);

	int adOrderSave(Orders orders);

	List<Orders> getadMainOrderList();

//	List<Orders> getPayListList(PageInfo pageInfo);

	//리스트
	List<Orders> selectPayInfo(int orderNo);

	Orders selectOrderAll(int orderNo);


	 boolean cancelOrder(int orderNo);

	


	
	
	

}