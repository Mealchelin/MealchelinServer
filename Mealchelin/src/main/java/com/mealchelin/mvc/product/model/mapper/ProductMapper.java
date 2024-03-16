package com.mealchelin.mvc.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.product.model.vo.Product;

@Mapper
public interface ProductMapper {

	int selectProductCount();

	int selectProductCountByCategory(@Param("category") String category);
	
	List<Product> selectProductList(RowBounds rowBounds);

	List<Product> selectProductListByCategory(@Param("category") String category, RowBounds rowBounds);
	
	List<Product> selectProductListBySort(@Param("sort") String sort, RowBounds rowBounds);

	List<Product> selectProductListByCategoryAndSort(@Param("category") String category, @Param("sort") String sort, RowBounds rowBounds);

	
	Product selectProductByNo(@Param("no") int no);

	List<Product> selectProductNewList();

	List<Product> selectProductBestList();

	List<Product> selectProductListOrderByNo(RowBounds rowBounds, @Param("category") String category, @Param("name") String name);

	int selectProductSearchCount(@Param("category") String category, @Param("name") String name);

	int insertProduct(Product product);
	

	int selectProductCountByResult(@Param("result") String result);

	List<Product> selectProductListBySearch(@Param("result") String result, RowBounds rowBounds);

	List<Product> selectProductNewListByHome();

	Product selectProductAllByNo(@Param("no") int no);

	int updateProduct(Product product);

	int updateStatus(Product product);

	int updateSellCount(@Param("no") int no);

}
