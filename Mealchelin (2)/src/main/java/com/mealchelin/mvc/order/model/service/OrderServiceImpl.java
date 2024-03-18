package com.mealchelin.mvc.order.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.common.util.PageInfo;
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
	public List<Orders> selectProductPayResultset(PageInfo pageInfo, int loginMember) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return orderMapper.selectProductPayResultset(rowBounds, loginMember);
	}

	@Override
	public int getPayListCount(int loginMember) {
		return orderMapper.selectPayCount(loginMember);
	}

	@Override
	public int getadOrderCount(String shipStatus, String memId) {
		return orderMapper.selectadOrderCount(shipStatus, memId);
	}

	@Override
	public List<Orders> getadOrderList(PageInfo pageInfo, String shipStatus, String memId) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return orderMapper.selectadOrderAll(rowBounds, shipStatus, memId);
	}

	@Override
	public Orders getAdOrderByNo(int no) {
		return orderMapper.selectOrderByNo(no);
	}

	@Override
	public int adOrderSave(Orders orders) {
		return orderMapper.updateAdOrders(orders);
	}

	@Override
	public List<Orders> getadMainOrderList() {
		return orderMapper.selectadMainOrderList();
	}


	//리스트
	@Override
	public List<Orders> selectPayInfo(int orderNo) {
		return orderMapper.selectPayInfo(orderNo);
	}



	@Override
	public Orders selectOrderAll(int orderNo) {
		return orderMapper.selectOrderAll(orderNo);
	}


	@Override
    @Transactional
    public boolean cancelOrder(int orderNo) {
        try {
            // 주문 취소 로직 수행
            orderMapper.updateCancelStatus(orderNo); // 매퍼를 통해 취소 상태 업데이트
            return true; // 성공적으로 주문이 취소됨을 반환
        } catch (Exception e) {
            // 주문 취소 실패 시 로그를 남기고 실패를 반환
            System.err.println("Failed to cancel order: " + e.getMessage());
            return false;
        }
    }



	@Override
	@Transactional
	public int updateCancleReasonSave(Map<String, Object> params) {
	    return orderMapper.updateCancleReason(params);
	}




	
	






	
	
	
	
}
