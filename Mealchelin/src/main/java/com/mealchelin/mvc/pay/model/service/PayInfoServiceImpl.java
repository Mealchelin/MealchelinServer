package com.mealchelin.mvc.pay.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
}
