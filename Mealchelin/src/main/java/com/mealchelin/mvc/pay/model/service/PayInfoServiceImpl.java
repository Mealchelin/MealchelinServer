package com.mealchelin.mvc.pay.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.order.model.vo.OrderProduct;
import com.mealchelin.mvc.pay.model.mapper.PaymentMapper;
import com.mealchelin.mvc.pay.model.vo.Payment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PayInfoServiceImpl implements PayInfoService {

    private final PaymentMapper paymentMapper;

    @Override
    public List<Payment> selectByProductPay(int memberNo) {
    	return paymentMapper.selectByProductPay(memberNo);
    }

	@Override
	@Transactional
	public int saveOrderProduct(OrderProduct orderProducts) {
		return paymentMapper.insertSaveOrderProduct(orderProducts);
//		return 0;
		
		//컨트롤러에서 처리하면 문제가생길수있으니 서비스 쪽에서 성공하면 커밋 실패하면 전부다 롤백되게 하는거 나중에 수정해보기 
		
		
		
		
	}
}
