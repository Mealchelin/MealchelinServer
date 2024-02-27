package com.mealchelin.mvc.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mealchelin.mvc.product.model.vo.Product;

@Mapper
public interface ProductMapper {

	List<Product> selectProductList();

	int selectProductCount();

}
