package com.mealchelin.mvc.product.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mealchelin.mvc.product.model.mapper.ProductMapper;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductMapper productMapper;
	
	@Override
	public List<Product> getProductList() {
		return productMapper.selectProductList();
	}

}
