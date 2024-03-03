package com.mealchelin.mvc.pay.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.pay.model.vo.PayMent;


@Mapper
public interface PaymentMapper {

	
	public interface PaymentService {
	    void processPayment(PayMent payment);
	
	}

	public void insertPayment(PayMent payment);
}
