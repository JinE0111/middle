package kr.or.ddit.prd.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.prd.dao.IPrdDetailDao;
import kr.or.ddit.prd.dao.PrdDetailDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class PrdDetailService implements IPrdDetailService{
	
	// dao 객체 생성
	IPrdDetailDao dao = PrdDetailDao.getInstance();
	
	// service 싱글톤 패턴 
	private static IPrdDetailService prdDetailService = null;
	
	private PrdDetailService() {
		// TODO Auto-generated constructor stub
	}
	
	public static IPrdDetailService getInstance() {
		if(prdDetailService == null) prdDetailService = new PrdDetailService();
		return prdDetailService;
	}
	
	
	@Override
	public  ProductVO proDetail(String proCode) {
		// TODO Auto-generated method stub
		return dao.proDetail(proCode);
	}
	
	@Override
	public String categorySelect(String category) {
		// TODO Auto-generated method stub
		return dao.categorySelect(category);
	}

}
