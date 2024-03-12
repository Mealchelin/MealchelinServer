package com.mealchelin.mvc.order.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.order.model.vo.Orders;


@Mapper
public interface OrderMapper {
    int insertOrder(Orders order);
    
    List<Orders> selectProductResultset(int memberNo);
    
    
}
