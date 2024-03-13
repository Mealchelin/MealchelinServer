package com.mealchelin.mvc.order.model.service;

import java.util.HashMap;
import java.util.List;
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
    
//        String orderNoStr = order.getOrderMembers().replace("ORD", "").substring(0, 9);
//        
//        System.out.println(orderNoStr);
//        
//        int orderNum = Integer.parseInt(orderNoStr);
//        order.setOrderNo(orderNum);
        
        
        // 주문 정보 DB에 저장
        return orderMapper.insertOrder(order);
    }

	

	@Override
	public List<Orders> getOrderProductResultset(int memberNo) {
		return orderMapper.selectProductResultset(memberNo);
	}


	//결재 성공 후에 결재 주문 번호로 ORDER_PRODUCT 테이블의 orderNO를 수정해준다.
	@Override
	public int updateOrderProduct(Long ordersNumbers, int orderNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ordersNumbers", ordersNumbers);
		map.put("orderNo"      , orderNo);
		return orderMapper.updateProductResultset(map);
	}



	@Override
	public List<Orders> getOrderPayResult() {
		return orderMapper.selectProductPayResultset();
	}





	
	
}
