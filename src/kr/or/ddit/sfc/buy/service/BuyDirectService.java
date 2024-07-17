package kr.or.ddit.sfc.buy.service;

import java.util.Map;

import kr.or.ddit.sfc.buy.dao.BuyDirectDao;
import kr.or.ddit.sfc.buy.dao.IBuyDirectDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class BuyDirectService implements IBuyDirectService{
	
	// 싱글톤 
	private static IBuyDirectService buyDirectService = null;
	
	private BuyDirectService() {
		// TODO Auto-generated constructor stub
	}
	
	public static IBuyDirectService getInstance() {
		if(buyDirectService == null ) buyDirectService = new BuyDirectService();
		return buyDirectService;
	}
	
	// dao 객체 생성
	IBuyDirectDao dao = BuyDirectDao.getInstance();
	
	
	@Override
	public ProductVO directBuyInfo(Map<String, Object> map) {
		return dao.directBuyInfo(map);
	}

}
