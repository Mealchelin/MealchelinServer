package com.mealchelin.mvc.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mealchelin.mvc.product.model.vo.Product;

@Mapper
public interface ProductMapper {

	int selectProductCount();

	int selectProductCountByCategory(@Param("category") String category);
	
	List<Product> selectProductList();

	List<Product> selectProductListByCategory(@Param("category") String category);
	
	// sort 는 동적 mapper 문법 찾아보기
	List<Product> selectProductList(@Param("category") String sort);

	List<Product> selectProductListByCategory(@Param("category") String category, String sort);

}
