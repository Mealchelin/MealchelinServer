package com.mealchelin.mvc.order.model.service;

import java.util.List;
import java.util.Map;

import com.mealchelin.mvc.order.model.vo.Orders;

public interface OrderService {
    int save(Map<String, Object> orderInfo);


	List<Orders> getOrderProductResultset(int memberNo);


}