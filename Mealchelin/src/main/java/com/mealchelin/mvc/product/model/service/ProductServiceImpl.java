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
	public int getProductCount() {
		return productMapper.selectProductCount();
	}

	@Override
	public int getProductCountByCategory(String category) {
		return productMapper.selectProductCountByCategory(category);
	}
	
	@Override
	public List<Product> getProductList() {
		return productMapper.selectProductList();
	}

	@Override
	public List<Product> getProductListByCategory(String category) {
		return productMapper.selectProductListByCategory(category);
	}

	@Override
	public List<Product> getProductList(String sort) {
		return productMapper.selectProductList(sort);
	}

	@Override
	public List<Product> getProductListByCategory(String category, String sort) {
		return productMapper.selectProductListByCategory(category, sort);
	}

}
