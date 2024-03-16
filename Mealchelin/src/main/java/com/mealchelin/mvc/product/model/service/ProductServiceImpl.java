package com.mealchelin.mvc.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<Product> getProductNewList() {
		return productMapper.selectProductNewList();
	}
	@Override
	public List<Product> getProductNewListByHome() {
		return productMapper.selectProductNewListByHome();
	}

	@Override
	public List<Product> getProductBestList() {
		return productMapper.selectProductBestList();
	}

	@Override
	public List<Product> getProductListOrderByNo(PageInfo pageInfo, String category, String name) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductListOrderByNo(rowBounds, category, name);
	}

	@Override
	public int getProductSearchCount(String category, String name) {
		return productMapper.selectProductSearchCount(category,name);
	}

	@Override
	@Transactional
	public int save(Product product) {
		int result = 0;
		
		if (product.getNo() > 0) {
			// update
			result = productMapper.updateProduct(product);
		} else {
			// insert
			result = productMapper.insertProduct(product);
		}
		return result;
	}

	@Override
	public int getProductCountBySearch(String result) {
		return productMapper.selectProductCountByResult(result);
	}

	@Override
	public List<Product> getProductListBySearch(String result, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return productMapper.selectProductListBySearch(result, rowBounds);
	}

	@Override
	public Product getProductAllByNo(int no) {
		return productMapper.selectProductAllByNo(no);
	}

	@Override
	public int delete(Product product) {
		return productMapper.updateStatus(product);
	}

	@Override
	public int updateSellCount(int proNo) {
		return productMapper.updateSellCount(proNo);
	}

}
