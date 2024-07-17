package kr.or.ddit.sfc.cart.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.cart.dao.CartListDaoImpl;
import kr.or.ddit.sfc.cart.dao.ICartDao;
import kr.or.ddit.sfc.vo.CartVO;

public class CartListServiceImpl implements ICartService{

	private static ICartService service;
	private ICartDao dao;
	
	private CartListServiceImpl() {
		dao = CartListDaoImpl.getInstance();
	}
	
	public static ICartService getInstance() {
		if(service == null) {
			service = new CartListServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<CartVO> cartList(String memId) {

		List<CartVO> cartList2 = null;
		
		try {
			cartList2 = dao.cartList(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cartList2;
	}

	@Override
	public int cartDel(CartVO cv) {
		int cartDel2 = 0;
		
		try {
			cartDel2 = dao.cartDel(cv);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cartDel2;
	}

	@Override
	public int valueUpdate(Map<String, Object> proCountList) {
		int cartValueList = 0;
		
		try {
			cartValueList = dao.valueUpdate(proCountList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cartValueList;
	}

		
}
