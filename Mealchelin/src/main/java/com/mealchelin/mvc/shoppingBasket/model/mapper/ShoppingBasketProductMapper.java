package com.mealchelin.mvc.shoppingBasket.model.mapper;

import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import com.mealchelin.mvc.shoppingBasket.model.vo.ShoppingBasketProduct;
=======
import com.mealchelin.mvc.shoppingBasketProduct.model.vo.ShoppingBasketProduct;
>>>>>>> origin/feature/pay_sy

@Mapper
public interface ShoppingBasketProductMapper {

	int insertSbp(ShoppingBasketProduct sbp);

}
