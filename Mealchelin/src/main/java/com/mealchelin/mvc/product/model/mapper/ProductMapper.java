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
	
	List<Product> selectProductList(@Param("sort") String sort);

	List<Product> selectProductListByCategory(@Param("category") String category, @Param("param1") String sort);

}
