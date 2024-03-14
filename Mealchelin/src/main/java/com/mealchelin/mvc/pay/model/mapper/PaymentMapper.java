package com.mealchelin.mvc.pay.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.order.model.vo.OrderProduct;
import com.mealchelin.mvc.pay.model.vo.Payment;

@Mapper
public interface PaymentMapper {

	 List<Payment> selectByProductPay(int memberNo);

	void insertPayment(Payment payment);

	int insertSaveOrderProduct(OrderProduct orderProducts);

	

}
