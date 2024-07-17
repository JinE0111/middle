package kr.or.ddit.sfc.main.service;

import java.util.List;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IMainService {
	/**
	 * 베스트 셀러 출력용
	 * @return
	 */
	public List<ProductVO> bestSeller();
}
