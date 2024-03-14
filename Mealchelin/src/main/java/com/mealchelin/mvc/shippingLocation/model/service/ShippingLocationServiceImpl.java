package com.mealchelin.mvc.shippingLocation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealchelin.mvc.member.model.vo.Member;
import com.mealchelin.mvc.shippingLocation.model.mapper.ShippingLocationMapper;
import com.mealchelin.mvc.shippingLocation.model.vo.ShippingLocation;

import lombok.RequiredArgsConstructor;




@Service
@RequiredArgsConstructor
public class ShippingLocationServiceImpl implements ShippingLocationService {
	
	@Autowired
	private ShippingLocationMapper mapper;
	
	// 멤버가 가지고 있는 배송지 개수 조회
	@Override
	public int getShippingLocationCountByMemberNo(int memberNo) {
		return mapper.selectShippingLocationCountByMemberNo(memberNo);
	}
	
	@Override
	public ShippingLocation getShippingInfoByInfo(int memberNo) {
		return mapper.selectFindByNo(memberNo);
	}

	@Override
	@Transactional
	public int save(ShippingLocation shippingLocation) {
		int result = 0;
		
		if(shippingLocation.getShipNo() > 0) {
			// update 
		} else {
			// insert
			int count = this.getShippingLocationCountByMemberNo(shippingLocation.getMemberNo());
			if (count > 4) {
				// 최대 5개까지만 저장 가능하게 함
				result = 2;
			} else {
				result = mapper.insertShippingLocation(shippingLocation);
			}
		}
		
		return result;
	}

	// 로그인 멤버 번호를 이용한 배송지 리스트 받아오기
	@Override
	public List<ShippingLocation> getShippingLocationListByLoginMember(int memberNo) {
		return mapper.selectShippingLocationListByLoginMember(memberNo);
	}

	// 배송지 삭제(status N 으로 변경)
	@Override
	@Transactional
	public int delete(Member loginMember, int shipNo) {
		int result = 0;
		int count = this.getShippingLocationCountByMemberNo(loginMember.getMemberNo());
		if (count < 2 ) {
			result = 2;
		} else {
			result = mapper.updateStatus(shipNo);
		}
		return result;
	}

	@Override
	public int changeDefaultLocation(int shipNo) {
		return mapper.setShipNoForChangeDefaultLocation(shipNo);
	}


	

}
