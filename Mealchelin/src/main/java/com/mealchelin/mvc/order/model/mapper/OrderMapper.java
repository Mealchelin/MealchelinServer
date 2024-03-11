package com.mealchelin.mvc.order.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.order.model.vo.Orders;


@Mapper
public interface OrderMapper {
    int insertOrder(Orders order);
    
    
    
    
}
