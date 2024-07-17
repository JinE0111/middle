package kr.or.ddit.sfc.cart.service;

import java.util.Map;

import kr.or.ddit.sfc.vo.CartVO;

public interface ICartInsertService {
	
	/**
	 * 장바구니 추가 메서드
	 * @param map 추가할 정보를 담은 map
	 * @return 추가 성공시 1, 실패시 0을 반환 
	 */
	public int cartInsert(CartVO map);
}
