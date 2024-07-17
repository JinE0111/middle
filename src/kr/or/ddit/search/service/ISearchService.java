package kr.or.ddit.search.service;

import java.util.List;

import kr.or.ddit.sfc.vo.ProductVO;

public interface ISearchService {
	
	public List<ProductVO> searchProd(String search);

}
