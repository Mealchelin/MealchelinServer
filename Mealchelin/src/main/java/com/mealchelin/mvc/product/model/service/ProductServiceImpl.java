package com.mealchelin.mvc.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.mealchelin.mvc.common.util.PageInfo;
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
	public List<Product> getProductList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductList(rowBounds);
	}

	@Override
	public List<Product> getProductListByCategory(String category, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductListByCategory(category, rowBounds);
	}

	@Override
	public List<Product> getProductList(String sort, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductListBySort(sort, rowBounds);
	}

	@Override
	public List<Product> getProductListByCategory(String category, String sort, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductListByCategoryAndSort(category, sort, rowBounds);
	}

	
	@Override
	public Product getProductByNo(int no) {
		return productMapper.selectProductByNo(no);
	}

}
