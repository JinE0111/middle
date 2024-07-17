package kr.or.ddit.sfc.main.service;

import java.util.List;

import kr.or.ddit.sfc.main.dao.IMainDao;
import kr.or.ddit.sfc.main.dao.MainDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class MainService implements IMainService{
	
	// 싱글톤
	private static IMainService mainService = null;
	private MainService() {
		// TODO Auto-generated constructor stub
	}
	public static IMainService getInstance() {
		if(mainService == null ) mainService = new MainService();
		return mainService;
	}
	
	// dao 객체 가져오기
	IMainDao dao = MainDao.getInstance();
	
	@Override
	public List<ProductVO> bestSeller() {
		return dao.bestSeller();
	}
	
}
