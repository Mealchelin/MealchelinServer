package com.mealchelin.mvc.order.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.mapper.OrderMapper;
import com.mealchelin.mvc.order.model.vo.Orders;

@Service
public class OrderServiceImpl implements OrderService {
    
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int save(Map<String, Object> orderInfo) {
        // 주문 정보와 회원 정보 추출
        Orders order = (Orders) orderInfo.get("order");
        Member member = (Member) orderInfo.get("member");
        
        // 회원 번호 설정
        order.setMemberNo(member.getMemberNo());
    
        // 주문 정보 DB에 저장
        return orderMapper.insertOrder(order);
    }

	
	
	
	
	
}
