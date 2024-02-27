package com.mealchelin.mvc.product.model.service;

import java.util.List;

import com.mealchelin.mvc.product.model.vo.Product;

public interface ProductService {

	int getProductCount();

	int getProductCountByCategory(String category);
	
	List<Product> getProductList();

	List<Product> getProductListByCategory(String category);

	List<Product> getProductList(String sort);
	
	List<Product> getProductListByCategory(String category, String sort);



}
