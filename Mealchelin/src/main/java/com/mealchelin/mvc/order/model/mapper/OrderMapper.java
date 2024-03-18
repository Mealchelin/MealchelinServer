package com.mealchelin.mvc.order.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.mealchelin.mvc.order.model.vo.Orders;


@Mapper
public interface OrderMapper {
    int insertOrder(Orders order);
    
    List<Orders> selectProductResultset(int memberNo);

	int updateProductResultset(Map<String, Object> map);
	
	List<Orders> selectProductPayResultset(RowBounds rowBounds, int loginMember);

	int selectPayCount(@Param("memberNo") int loginMember);

	int selectadOrderCount(@Param("shipStatus") String shipStatus, @Param("memId") String memId);

	List<Orders> selectadOrderAll(RowBounds rowBounds, @Param("shipStatus") String shipStatus, @Param("memId") String memId);

	Orders selectOrderByNo(@Param("orderNo") int no);

	int updateAdOrders(Orders orders);

	List<Orders> selectadMainOrderList();
 
//	List<Orders> selectAll(RowBounds rowBounds);
    
	List<Orders> selectPayInfo(int orderNo);
	
 	Orders selectOrderAll(int orderNo);

	void updateCancelStatus(int orderNo);

	int updateCancleReason(Map<String, Object> params);



 	
 	
 	
 	
    
}
