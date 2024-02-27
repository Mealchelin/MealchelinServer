package com.mealchelin.mvc.product.model.service;

import java.util.List;

import com.mealchelin.mvc.product.model.vo.Product;

public interface ProductService {

	List<Product> getProductList();

	int getProductCount();
	
}
