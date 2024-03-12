package com.mealchelin.mvc.product.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketProductService;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService productService;
	private final ShoppingBasketProductService sbpService;

	// 주소와 화면 연결
	// + 카테고리 선택
	@GetMapping("/list")
	public ModelAndView list(
			ModelAndView modelAndView,
			@RequestParam(defaultValue="") String category,
			@RequestParam(defaultValue="") String sort,
			@RequestParam(defaultValue="1") int page) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		if (category.equals("")) {
			listCount = productService.getProductCount();
		} else {
			listCount = productService.getProductCountByCategory(category);
		}
		
		pageInfo = new PageInfo(page, 5, listCount, 16);
		
		// 리스트는 카테고리 + 분류 방식에 영향
		// 1. 전부 없을 때
		// 2. 카테고리만 있을 때
		// 3. 분류만 있을 때
		// 4. 카테고리 + 분류일 때
		
		if (category.equals("") && sort.equals("")) {
			list = productService.getProductList(pageInfo);
		} else if (!category.equals("") && sort.equals("")) {
			list = productService.getProductListByCategory(category,pageInfo);
		} else if (category.equals("") && !sort.equals("")) {
			list = productService.getProductList(sort, pageInfo);
		} else if (!category.equals("") && !sort.equals("")) {
			list = productService.getProductListByCategory(category, sort, pageInfo);
		}
		
//		log.info("List: {}", list);
		
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		
//		modelAndView.setViewName("redirect:/product/list");
		modelAndView.setViewName("product/list");
		return modelAndView;
	}
	
	@GetMapping("/new")
	public ModelAndView	newList(
			ModelAndView modelAndView) {
		
		List<Product> list = null;
		list = productService.getProductNewList();
		String newList = "1";
		modelAndView.addObject("list", list);
		modelAndView.addObject("newList", newList);
		modelAndView.setViewName("product/newBest");
		return modelAndView;
	}
	
	@GetMapping("/best")
	public ModelAndView	bestList(
			ModelAndView modelAndView) {
		
		List<Product> list = null;
		list = productService.getProductBestList();
		String bestList = "1";
		modelAndView.addObject("list", list);
		modelAndView.addObject("bestList", bestList);
		modelAndView.setViewName("product/newBest");
		return modelAndView;
	}
	
	@GetMapping("/view")
	public ModelAndView view(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		Product product = null;
		product = productService.getProductByNo(no);
		// no에 맞는 상품 조회해서 add 
		modelAndView.addObject("product", product);
		modelAndView.setViewName("product/view");
		
		return modelAndView; 
	}
	
	// 장바구니에 추가
	@PostMapping("/shoppingBasket")
	public ModelAndView shop(
			@SessionAttribute("loginMember") Member loginMember,
			ModelAndView modelAndView,
			@RequestParam int no,
			@RequestParam int quantity) {
		
		int resultCode = 0;
		Product product = null;
		ShoppingBasketProduct sbp = new ShoppingBasketProduct();
		product = productService.getProductByNo(no);
		int totalPrice = product.getPrice() * quantity;
		
		sbp.setPrdNo(product.getNo());
		sbp.setMemberNo(loginMember.getMemberNo());
		sbp.setQuantity(quantity);
		sbp.setTotalPrice(totalPrice);
		
		resultCode = sbpService.save(sbp);
		
		if (resultCode == 1) {
			modelAndView.setViewName("redirect:/mypage/shoppingBasket");
		} else if (resultCode == 2) {
			modelAndView.addObject("msg", "이미 장바구니에 담긴 상품입니다.");
			modelAndView.addObject("location", "/product/view?no="+no);
			modelAndView.setViewName("common/msg");
		} else {
			modelAndView.addObject("msg", "장바구니에 저장 가능한 최대 상품 개수는 5개입니다.");
			modelAndView.addObject("location", "/product/view?no="+no);  
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	// 구매하기
	// 상품페이지에서 구매버튼 눌렀을 때
	@PostMapping("/purchase")
	public ModelAndView purchase(
			ModelAndView modelAndView,
			@RequestParam int no,
			@RequestParam int quantity
			) {
		
		Product product = null;
		product = productService.getProductByNo(no);
		
		log.info("purchase product product: {}", product);
		
		modelAndView.addObject("product", product);
		modelAndView.addObject("no", no);
		modelAndView.addObject("quantity", quantity);
		modelAndView.setViewName("redirect:/payment/directpay");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid 
			, @RequestParam(value="fileName") String fileName
			, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		//서버에 저장된 이미지 경로 
		String real = session.getServletContext().getRealPath("/resources/img/product");
		String sDirPath = real+ "/" + uid + "_" + fileName; 
		File imgFile = new File(sDirPath); 
		
		//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
		if(imgFile.isFile()){ byte[] buf = new byte[1024]; 
		int readByte = 0; 
		int length = 0; 
		byte[] imgBuf = null; 
		
		FileInputStream fileInputStream = null; 
		ByteArrayOutputStream outputStream = null; 
		ServletOutputStream out = null; 
		
		try{ 
			fileInputStream = new FileInputStream(imgFile); 
			outputStream = new ByteArrayOutputStream(); 
			out = response.getOutputStream(); 
			
			while((readByte = fileInputStream.read(buf)) != -1){ 
				outputStream.write(buf, 0, readByte); 
				} 
			
			imgBuf = outputStream.toByteArray(); 
			length = imgBuf.length; 
			out.write(imgBuf, 0, length); 
			out.flush(); 
			
		}catch(IOException e){ 
			e.getMessage();
		}finally { 
			outputStream.close();
			fileInputStream.close();
			out.close();
			} 
		} 
	}
	
	@GetMapping("/search")
	public ModelAndView search(
			ModelAndView modelAndView,
			@RequestParam String result,
			@RequestParam(defaultValue="1") int page) {
		
		List<Product> list = null;
		int listCount = 0;
		PageInfo pageInfo = null; 
		
		
		listCount = productService.getProductCountBySearch(result);
		
		
		pageInfo = new PageInfo(page, 5, listCount, 16);
		
		list = productService.getProductListBySearch(result, pageInfo);
		
		log.info("{}", list);
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		
		modelAndView.setViewName("product/search");
		
		
		return modelAndView;
	}
	
}
