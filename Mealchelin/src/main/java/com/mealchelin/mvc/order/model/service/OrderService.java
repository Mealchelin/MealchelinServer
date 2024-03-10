package com.mealchelin.mvc.order.model.service;

import java.util.Map;

public interface OrderService {
    int save(Map<String, Object> orderInfo);
}