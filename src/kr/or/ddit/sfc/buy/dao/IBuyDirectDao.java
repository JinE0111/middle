package kr.or.ddit.sfc.buy.dao;

import java.util.Map;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IBuyDirectDao {
	
	/**
	 * 바로구매하기 눌렀을때 필요한 상품 정보를 출력한다 
	 * @return
	 */
	public ProductVO directBuyInfo(Map<String, Object> map);
}
