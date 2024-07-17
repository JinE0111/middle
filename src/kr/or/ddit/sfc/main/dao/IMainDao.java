package kr.or.ddit.sfc.main.dao;

import java.util.List;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IMainDao {
	
	/**
	 * 베스트 셀러 출력용
	 * @return
	 */
	public List<ProductVO> bestSeller();
}
