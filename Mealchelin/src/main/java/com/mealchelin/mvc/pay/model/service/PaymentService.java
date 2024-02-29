package com.mealchelin.mvc.pay.model.service;

import com.siot.IamportRestClient.response.Payment;

public interface PaymentService {

	void processPayment(Payment payment);

}
