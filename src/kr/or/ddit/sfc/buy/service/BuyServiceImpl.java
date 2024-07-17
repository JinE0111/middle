package kr.or.ddit.sfc.buy.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.buy.dao.BuyDaoImpl;
import kr.or.ddit.sfc.buy.dao.IBuyDao;
import kr.or.ddit.sfc.vo.BuyDetailVO;
import kr.or.ddit.sfc.vo.BuyVO;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

public class BuyServiceImpl implements IBuyService{

	private static IBuyService service;
	private IBuyDao dao;
	
	private BuyServiceImpl() {
		dao = BuyDaoImpl.getInstance();
	}
	
	public static IBuyService getInstance() {
		if(service == null) {
			service = new BuyServiceImpl();
		}
		return service;
	}

	@Override
	public List<CartVO> buyProd(String memId) {
		List<CartVO> buyProd = null;
		
		try {
			buyProd = dao.buy(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return buyProd;
	}

	@Override
	public void buyListInsert(BuyVO buy) {
		try {
			dao.buyListInsert(buy);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductVO> buyProductList(String memId) {
		List<ProductVO> buyProductList = null;
		try {
			buyProductList = dao.buyProductList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyProductList;
	}

	@Override
	public void buyDetailInsert(BuyDetailVO bui) {
		try {
			dao.buyDetailInsert(bui);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void buyAfter(String memId) {
		try {
			dao.buyAfter(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
