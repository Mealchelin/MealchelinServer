package com.mealchelin.mvc.pay.model.service;

import java.util.List;

import com.mealchelin.mvc.pay.model.vo.Payment;

public interface PayInfoService {


	List<Payment> selectByProductPay(int memberNo);

}
