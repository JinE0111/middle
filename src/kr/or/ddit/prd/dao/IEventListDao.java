package kr.or.ddit.prd.dao;

import java.util.List;

import kr.or.ddit.sfc.vo.ProductVO;

public interface IEventListDao {
	
	/**
	 * 이벤트의 해당품목을 가져오는 메서드
	 * @param param
	 * @return
	 */
	public List<ProductVO> eventList(String param);
}
