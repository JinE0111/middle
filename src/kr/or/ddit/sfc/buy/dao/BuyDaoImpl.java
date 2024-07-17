package kr.or.ddit.sfc.buy.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.controller.Cart;
import kr.or.ddit.sfc.vo.BuyDetailVO;
import kr.or.ddit.sfc.vo.BuyVO;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

public class BuyDaoImpl extends MyBatisDao implements IBuyDao{

	private static BuyDaoImpl dao;
	
	private BuyDaoImpl() {}
	
	public static IBuyDao getInstance() {
		if(dao == null) {
			dao = new BuyDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<CartVO> buy(String memId) {
		return selectList("buy.buyName", memId);
	}

	@Override
	public void buyListInsert(BuyVO buy) {
		insert("buy.buyAdd", buy);
	}

	@Override
	public List<ProductVO> buyProductList(String memId) {
		return selectList("buy.buyProductList", memId);
	}

	@Override
	public void buyDetailInsert(BuyDetailVO bui) {
		update("buy.buyDetailInsert", bui);
	}

	@Override
	public void buyAfter(String memId) {
		delete("buy.buyDelete", memId);
		
	}

}
