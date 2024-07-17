package kr.or.ddit.prd.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IPrdListService {
	
	/**
	 * 상품 개수 조회
	 * @param category 
	 * @param param
	 * @return
	 */
	public int prdCnt(String category) throws SQLException;
	
	/**
	 * 페이지 범위별 게시물 조회
	 * @param map
	 * @return
	 */
	public List<ProductVO> pageRange(Map<String, Object> map);
}
