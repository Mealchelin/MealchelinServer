package com.mealchelin.mvc.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.pay.model.mapper.PaymentMapper;
import com.mealchelin.mvc.pay.model.vo.PayMent;

@Service
public class PaymentServicelmpl implements PaymentService {

	private PaymentMapper paymentMapper;

	@Autowired
	public void PaymentServiceImpl(PaymentMapper paymentMapper) {
		this.paymentMapper = paymentMapper;
	}

	@Override
	public void processPayment(PayMent payment) {
		paymentMapper.insertPayment(payment);
	}

<<<<<<< HEAD
=======
	
<<<<<<< HEAD
	 private PaymentMapper paymentMapper;
	 
	 

	    @Autowired
	    public void PaymentServiceImpl(PaymentMapper paymentMapper) {
	        this.paymentMapper = paymentMapper;
	    }

	    @Override
	    public void processPayment(PayMent payment) {
	        paymentMapper.insertPayment(payment);
	    }
=======
>>>>>>> origin/feature/pay_sy
	
	
>>>>>>> parent of ff83659 (성연 240304)
}
