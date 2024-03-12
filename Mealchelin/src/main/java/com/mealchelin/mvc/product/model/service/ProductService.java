package com.mealchelin.mvc.product.model.service;

import java.util.List;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.product.model.vo.Product;

public interface ProductService {

	int getProductCount();

	int getProductCountByCategory(String category);
	
	List<Product> getProductList(PageInfo pageInfo);

	List<Product> getProductListByCategory(String category, PageInfo pageInfo);

	List<Product> getProductList(String sort, PageInfo pageInfo);
	
	List<Product> getProductListByCategory(String category, String sort, PageInfo pageInfo);

	
	Product getProductByNo(int no);

	List<Product> getProductNewList();

	List<Product> getProductBestList();

	List<Product> getProductListOrderByNo(PageInfo pageInfo, String category, String name);

	int getProductSearchCount(String category, String name);

	int save(Product product);


}
