package kr.or.ddit.prd.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IPrdDetailService {
	/**
	 * 상품 상세정보 가져오는 메소드
	 * @param proCode
	 * @return
	 */
	public ProductVO proDetail(String proCode);
	
	/**
	 * 카테고리 조회
	 * @param param
	 * @return
	 */
	public String categorySelect(String param);
}
