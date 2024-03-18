package com.mealchelin.mvc.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mealchelin.mvc.common.util.PageInfo;
import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.order.model.service.OrderService;
import com.mealchelin.mvc.order.model.vo.OrderProduct;
import com.mealchelin.mvc.order.model.vo.Orders;
import com.mealchelin.mvc.orderProduct.service.OrderProductService;
import com.mealchelin.mvc.pay.model.service.PayInfoService;
import com.mealchelin.mvc.pay.model.service.UserOrderPayService;
import com.mealchelin.mvc.pay.model.vo.Payment;
import com.mealchelin.mvc.product.model.service.ProductService;
import com.mealchelin.mvc.product.model.vo.Product;
import com.mealchelin.mvc.shippingLocation.model.service.ShippingLocationService;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketProductService;
import com.mealchelin.mvc.shoppingBasket.model.service.ShoppingBasketService;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasket;
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginMember")
public class PayController {

	private final PayInfoService payInfoService;
	private final ShippingLocationService shippingService;
	private final UserOrderPayService payService;
	private final ProductService productService;
	private final OrderService orderService;
	private final OrderProductService orderProductService;
	private final ShoppingBasketProductService sbpService;
	private final ShoppingBasketService sbService;

	
	@GetMapping("/payment/directpay")
	public ModelAndView directment(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember,
			@RequestParam int no, @RequestParam int quantity) {
		Product product = null;
		product = productService.getProductByNo(no);
		ShippingLocation shippingInfo = null;
		List<Payment> payInfoList = null;

		int price = 0;
		int shipPrice = 0;
		price = product.getPrice() * quantity;

		// 주문 상품
		product = productService.getProductByNo(no);
		// 기본배송지
		shippingInfo = shippingService.getDefaultShippingLocationByMemNo(loginMember.getMemberNo());

		if (price > 50000) {
		    shipPrice = 0;
		} else {
		    if (shippingInfo != null && "N".equals(shippingInfo.getMountain())) {
		        shipPrice = 3000;
		    } else {
		        shipPrice = 5000;
		    }
		}

		// 결제수단 표시
		payInfoList = payInfoService.selectByProductPay(loginMember.getMemberNo());

		log.info("shippingInfo = {}", shippingInfo);
		log.info("payInfoList = {}", payInfoList);

		modelAndView.addObject("userInfo", loginMember); // 추가 정보를 모델에 추가
		modelAndView.addObject("shippingInfo", shippingInfo); // 배송 정보를 모델에 추가
		modelAndView.addObject("product", product);
		modelAndView.addObject("no", no);
		modelAndView.addObject("quantity", quantity);
		modelAndView.addObject("price", price);
		modelAndView.addObject("shipPrice", shipPrice);
		modelAndView.setViewName("payment/directpay");

		System.out.println("price : " + price);

		return modelAndView;
	}
	
	
	@GetMapping("/payment/shipChange")
	public ModelAndView shipChange(
			ModelAndView modelAndView,
			@SessionAttribute Member loginMember) {
		
		List<ShippingLocation> list = null;
		list = shippingService.getShippingLocationListByLoginMember(loginMember.getMemberNo());
		modelAndView.addObject("list", list);
		
		
		modelAndView.setViewName("payment/shipChange");
		return modelAndView;
	}
	
	@PostMapping("/payment/shipChange")
	public String shipChange(
			@RequestParam("ckShipNo") int no) {
		
		ShippingLocation shipLocation = shippingService.getShippingLocationByShipNo(no);
		log.info(shipLocation.toString());
		
		return "";
	}

	@GetMapping("/payment/pay")
	public ModelAndView cartpayment(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember) {
		List<ShoppingBasketProduct> shippingProductList = null;
		ShippingLocation shippingInfo = null;
		List<Payment> payInfoList = null;

		// 주문 상품
		shippingProductList = payService.getShippingList(loginMember.getMemberNo());

		// 배송정보
		shippingInfo = shippingService.getDefaultShippingLocationByMemNo(loginMember.getMemberNo());

		System.out.println(payInfoList);

		log.info("shippinginfo = {}", shippingInfo);
		log.info("payInfoList = {}", payInfoList);

		modelAndView.addObject("userInfo", loginMember); // 추가 정보를 모델에 추가
		modelAndView.addObject("shippingInfo", shippingInfo); // 배송 정보를 모델에 추가
		modelAndView.addObject("shippingBaketInfoList", shippingProductList); // 배송 정보를 모델에 추가
		modelAndView.setViewName("payment/pay");

		return modelAndView;
	}

	
	//order_product 에 insert 하는 ajax 요청
	// 장바구니 결제
	@PostMapping("/payment/saveOrderProduct")
	public ModelAndView saveOrderProduct(ModelAndView modelAndView, @RequestBody Map<String, Object> orderInfo,
			HttpSession session) {
		
		@SuppressWarnings("unchecked")
		List<String> productsCountList = (List<String>)orderInfo.get("productsCount");
		@SuppressWarnings("unchecked")
		List<String> prdNosList        = (List<String>)orderInfo.get("prdNos");
		@SuppressWarnings("unchecked")
		List<String> pricesList        = (List<String>)orderInfo.get("prices");
		String orderNo        = (String)orderInfo.get("orderNo");
		orderNo        = orderNo.replace("ORD", "").replace("-", "");
		
		List<OrderProduct> OrderProducts = new ArrayList<OrderProduct>();
		
		for (int i = 0; i < productsCountList.size(); i++) {
			OrderProduct tempOrderProduct = new OrderProduct();
			int prdNo    = Integer.parseInt(prdNosList.get(i));
			int quantity = Integer.parseInt(productsCountList.get(i).replace("개",""));
			int price = Integer.parseInt(pricesList.get(i));
			
			tempOrderProduct.setOrderNo(Long.parseLong(orderNo));
			tempOrderProduct.setProNo(prdNo);
			tempOrderProduct.setQuantity(quantity);
			tempOrderProduct.setTotalPrice(price);
			
			// 객체
			System.out.println("tempOrderProduct : " +  tempOrderProduct);
			
			// 객체의 리스트
			OrderProducts.add(tempOrderProduct);
			
		}
		
		int result = 0;
		log.info("{}", OrderProducts.size());
		for(int i = 0; i < OrderProducts.size(); i++) {
			System.out.println("test : " + OrderProducts.get(i));
			int proNo = OrderProducts.get(i).getProNo();
			int result2 = 0;
			
			result = payInfoService.saveOrderProduct(OrderProducts.get(i));
			result2 = productService.updateSellCount(proNo);
			log.info("상품 판매 후 판매량, 재고 수 변경 {}", result2);
		}
		
//		System.out.println("OrderProducts : " + OrderProducts);
		
		
		
		modelAndView.addObject("result",result);
		
		return modelAndView;
	}
	
	
	// 단일 상품 결재
		@PostMapping("/payment/paysucces")
		public ModelAndView paySuccess(ModelAndView modelAndView, @RequestBody Map<String, Object> orderInfo,
					HttpSession session) {
			
			// 세션에서 로그인한 회원 정보 가져오기
			Member member = (Member) session.getAttribute("loginMember");
			
			// 주문 정보에 회원 번호 설정
			Orders order = new Orders();
			order.setMemberNo(member.getMemberNo());

			// 주문 정보와 회원 정보를 담은 Map 생성
			orderInfo.put("order", order);
			orderInfo.put("member", member);

			// 결제 방식 추가
			log.info("orderInfo : {}",orderInfo);
			int shipNo = (int)orderInfo.get("shipNo");
			order.setShipNo(shipNo);

			String orderMembers = (String) orderInfo.get("orderNo");
			order.setOrderMembers(orderMembers);

			String paymentMethod = (String) orderInfo.get("paymentMethod");
			order.setPaymentMethod(paymentMethod);

			int payMent = (int) orderInfo.get("amount");
			order.setPayMent(payMent);

			String request = (String) orderInfo.get("quest");
			order.setRequest(request);
			
			// 주문 정보를 저장하고 결과를 반환
			int result = orderService.save(orderInfo);
			
			
			//가져온 orderInfo 에서 Orders 객체를 가져온다.
			order = (Orders)orderInfo.get("order");
			
			//결재시 생성한 주문번호에서 숫자값만 추출
			Long ordersNumbers = Long.parseLong(order.getOrderMembers().replace("ORD", "").replace("-", ""));
			
			//시퀀스로 생성된 orderNo로 ORDER_PRODUCT에 업데이트 해준다.
			result += orderService.updateOrderProduct(ordersNumbers, order.getOrderNo());
			
			// 로그인 멤버의 장바구니 리셋 
			int memNo = member.getMemberNo();
			// 장바구니 payment = 0
			// 장바구니 상품 멤버 번호에 맞는 상품들 전부 delete
			int result2 = sbpService.deleteSbpBySell(memNo);
			int result3 = sbService.resetSbPayment(memNo, 0);
			log.info("장바구니 상품 삭제하고 장바구니 금액 0으로 만듦 {}, {}", result3, result2);
			
			
			
			if (result > 0) {
				modelAndView.addObject("msg", "결제가 완료되었습니다");
			} else {
				modelAndView.addObject("msg", "결제에 실패하였습니다.");
			}

			modelAndView.setViewName("redirect:/payment/paysucces");
			return modelAndView;
		}

	//결제완료페이지 
	@GetMapping("/payment/paysucces")
	public ModelAndView paySuccessView(ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember
			) {
		
		
		modelAndView.addObject("loginMember", loginMember);
		modelAndView.setViewName("payment/paysucces");
		return modelAndView;
	}
	
	
	//주문내역페에지
	@GetMapping("/mypage/payInquiry")
	public ModelAndView payInquiry(ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(defaultValue = "1") int page
			) {

	    List<Orders> orders = null;
	    
	    
	    int paylistCount = 0;
		PageInfo pageInfo = null;
		List<Orders> list = null;
		log.info(loginMember.toString());
		
				
		paylistCount = orderService.getPayListCount(loginMember.getMemberNo());
		pageInfo = new PageInfo(page, 3, paylistCount, 5);
//		list = orderService.getPayListList(pageInfo);
		
		System.out.println(paylistCount);
				
		log.info("Page Number : {}", page);
		log.info("List Count : {}", paylistCount);

	    // getOrderPayResult 메서드를 호출하여 마지막 주문 1건을 가져옵니다.
	    orders = orderService.selectProductPayResultset(pageInfo, loginMember.getMemberNo());
	    
	    // 로그에 주문 목록을 출력합니다.
	    log.info("Orders: {}", orders);

	    // ModelAndView에 주문 목록을 추가하고, 뷰 이름을 설정하여 반환합니다.
	    modelAndView.addObject("pageInfo", pageInfo);
	    modelAndView.addObject("orders", orders);
	    modelAndView.addObject("list", list);
	    modelAndView.setViewName("mypage/payInquiry");

	    return modelAndView;
	}
	
	
	
	
	//주문상세페이지
	@GetMapping("/mypage/payDetails")
	public ModelAndView payDetails(ModelAndView modelAndView,
	                                @SessionAttribute("loginMember") Member loginMember,
	                                @RequestParam int orderNo) {
		ShippingLocation shippingInfo = null;
	    Orders orders = null;
	    List<Orders> result = null;

	    // 사용자의 주문 목록을 가져옵니다.
	    result = orderService.selectPayInfo(orderNo);

	    ShippingLocation shipInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());

	    // 산간 여부 확인 후 변수에 저장
	    shippingInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());
	    

	    orders = orderService.selectOrderAll(orderNo);

	    // 각 주문 항목의 가격과 수량을 곱하여 총 가격을 계산합니다.
	    List<Double> totalPrices = new ArrayList<>();
	    for (Orders item : result) {
	        double totalPrice = item.getPrice() * item.getCountQ();
	        totalPrices.add(totalPrice);
	    }

	    // ModelAndView에 주문 목록과 주문 상세 정보를 추가하고, 뷰 이름을 설정하여 반환합니다.
	    modelAndView.addObject("loginMember", loginMember);
	    modelAndView.addObject("result", result);
	    modelAndView.addObject("shipInfo", shipInfo);
	    modelAndView.addObject("orders", orders);
	    modelAndView.addObject("totalPrices", totalPrices); // 총 가격을 추가합니다.
	    modelAndView.addObject("shippingInfo", shippingInfo); // 총 가격을 추가합니다.
	    modelAndView.setViewName("mypage/payDetails");

	    return modelAndView;
	}




	//주문취소페이지
	@GetMapping("/mypage/payDelete")
	public ModelAndView payDelete(ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember,
            @RequestParam int orderNo
			) {
		ShippingLocation shippingInfo = null;
	    Orders orders = null;
	    List<Orders> result = null;

	    // 사용자의 주문 목록을 가져옵니다.
	    result = orderService.selectPayInfo(orderNo);

	    ShippingLocation shipInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());

	    // 산간 여부 확인 후 변수에 저장
	    shippingInfo = shippingService.getShippingInfoByInfo(loginMember.getMemberNo());
	    
	    orders = orderService.selectOrderAll(orderNo);

	    // 각 주문 항목의 가격과 수량을 곱하여 총 가격을 계산합니다.
	    List<Double> totalPrices = new ArrayList<>();
	    for (Orders item : result) {
	        double totalPrice = item.getPrice() * item.getCountQ();
	        totalPrices.add(totalPrice);
	    }
	    

	    // ModelAndView에 주문 목록과 주문 상세 정보를 추가하고, 뷰 이름을 설정하여 반환합니다.
	    modelAndView.addObject("loginMember", loginMember);
	    modelAndView.addObject("result", result);
	    modelAndView.addObject("shipInfo", shipInfo);
	    modelAndView.addObject("orders", orders);
	    modelAndView.addObject("totalPrices", totalPrices); // 총 가격을 추가합니다.
	    modelAndView.addObject("shippingInfo", shippingInfo); // 총 가격을 추가합니다.
		
		modelAndView.setViewName("mypage/payDelete");
		

		return modelAndView;
	}
	


	//주문취소완료페이지
	@GetMapping("/payment/payCncel")
	public ModelAndView payCncelView(ModelAndView modelAndView,
	                                  @SessionAttribute("loginMember") Member loginMember,
	                                  @RequestParam Map<String, String> params) {
	    int orderNo = Integer.parseInt(params.get("orderNo"));
	    String cancelReason = params.get("cancelReason");

	    // 주문 취소 처리 로직을 수행합니다.
	    boolean success = orderService.cancelOrder(orderNo);

	    // 주문 취소 사유를 업데이트합니다.
	    Map<String, Object> updateParams = new HashMap<>();
	    updateParams.put("orderNo", orderNo);
	    updateParams.put("cancelReason", cancelReason);
	    int updateResult = orderService.updateCancleReasonSave(updateParams);

	    if (success) {
	        modelAndView.addObject("msg", "주문 취소를 성공하였습니다");
	        modelAndView.addObject("cancelSuccess", true);
	        modelAndView.addObject("updateResult", updateResult);
	        modelAndView.addObject("location", "/");
	    } else {
	        modelAndView.addObject("msg", "주문 취소를 실패하였습니다");
	        modelAndView.addObject("cancelSuccess", false);
	        modelAndView.addObject("location", "/mypage/payDetails?orderNo=" + orderNo);
	    }

	    modelAndView.setViewName("payment/payCncel");
	    return modelAndView;
	}





	
	
	
	
	
	
	
}
	
	