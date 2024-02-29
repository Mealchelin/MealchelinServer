package com.mealchelin.mvc.pay.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.siot.IamportRestClient.response.Payment;

@Mapper
public interface PaymentMapper {

	
	public interface PaymentService {
	    void processPayment(Payment payment);
	
	}

	public void insertPayment(Payment payment);
}
