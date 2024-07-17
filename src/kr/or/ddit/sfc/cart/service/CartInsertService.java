package kr.or.ddit.sfc.cart.service;

import java.util.Map;

import kr.or.ddit.sfc.cart.dao.CartInsertDao;
import kr.or.ddit.sfc.cart.dao.ICartInsertDao;
import kr.or.ddit.sfc.vo.CartVO;

public class CartInsertService implements ICartInsertService{

	// 싱글톤 
	
	private static ICartInsertService cartInsert = null;
	private CartInsertService() {
		// TODO Auto-generated constructor stub
	}
	public static ICartInsertService getInstance() {
		if(cartInsert == null) cartInsert = new CartInsertService();
		return cartInsert;
	}
	
	// dao 객체
	ICartInsertDao dao = CartInsertDao.getInstance();
	
	@Override
	public int cartInsert(CartVO map) {
		// TODO Auto-generated method stub
		return dao.cartInsert(map);
	}

}
