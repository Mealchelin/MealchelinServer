package com.mealchelin.mvc.order.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.vo.Orders;


@Mapper
public interface OrderMapper {
    int insertOrder(Orders order);
    
    List<Orders> selectProductResultset(int memberNo);

	int updateProductResultset(Map<String, Object> map);
	
	List<Orders> selectProductPayResultset(RowBounds rowBounds, int loginMember);

	int selctPayConut();

    
	List<Orders> selectPayInfo(int orderNo);
	
	Orders selectPayInfoOne(int orderNo);
    
}
