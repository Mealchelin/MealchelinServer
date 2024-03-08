package com.mealchelin.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.MultipartFileUtil;
import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product")
public class AdminProductController {
	private final ProductService productService;
	private final ResourceLoader resourceLoader;
	
	@GetMapping("/adProduct")
	public ModelAndView adProduct(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="", name = "ad_product_se") String category,
			@RequestParam(defaultValue="", name = "ad_memberSearch") String name) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		// 1. 전체 검색
		// 2. 카테고리 선택 후 검색
		// 3. 상품명 검색
		// 4. 카테고리 + 상품명 검색
		
		
		listCount = productService.getProductSearchCount(category, name);
		
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = productService.getProductListOrderByNo(pageInfo, category, name);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		
		modelAndView.setViewName("admin/product/adProduct");
		return modelAndView;
	}
	
	@GetMapping("/write")
	public ModelAndView adProductWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/write");
		
		return modelAndView;
	}
	
	@PostMapping("/write")
	public ModelAndView adProductWrite(
			ModelAndView modelAndView,
			Product product,
			@RequestParam("upfile") MultipartFile upfile) {
		
		log.info(product.toString());
		log.info("isEmpty: {}", upfile.isEmpty()); // 비어있으면(업로드 안했으면) true, 했으면 false
		
		log.info("File Name: {}", upfile.getOriginalFilename()); // 업로드했으면 "파일명", 안했으면 ""(빈문자열) 리턴
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String originalFileName = null;
				
			try {
				location = resourceLoader.getResource("resources/img/product").getFile().getPath();
				System.out.println(location);
				originalFileName = MultipartFileUtil.save(upfile, location);
				
				if (originalFileName != null) {
					product.setImage(upfile.getOriginalFilename());
//					product.setRenamedFilename(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		log.info(product.toString());
		
		int result = 0;
		result = productService.save(product);
		if (result > 0) {
			modelAndView.addObject("msg", "상품 등록 완료");
			modelAndView.addObject("location", "/admin/product/write");
		} else {
			modelAndView.addObject("msg", "상품 등록 실패");
			modelAndView.addObject("location", "/admin/product/write");
		}
			modelAndView.setViewName("common/msg");

		modelAndView.addObject("closeWindowScript", "<script>window.close();</script>");
//		modelAndView.setViewName("admin/product/write");
		return modelAndView;
	}
	
	@GetMapping("/edit")
	public ModelAndView adProductEdit(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/product/edit");
		
		return modelAndView;
	}
}
