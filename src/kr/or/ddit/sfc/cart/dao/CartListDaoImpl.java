package kr.or.ddit.sfc.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.CartVO;

public class CartListDaoImpl extends MyBatisDao implements ICartDao{

	private static CartListDaoImpl dao;

	// 싱글톤
	private CartListDaoImpl() {}
	
	public static ICartDao getInstance() {
		if(dao == null) {
			dao = new CartListDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<CartVO> cartList(String memId) throws SQLException {
		
		return selectList("cart.cartList", memId);
	}

	@Override
	public int cartDel(CartVO cv) throws SQLException {
		// TODO Auto-generated method stub
		return delete("cart.cartDelete", cv);
	}

	@Override
	public int valueUpdate(Map<String, Object> proCountList) throws SQLException {
		// TODO Auto-generated method stub
		return update("cart.cartUpdate", proCountList);
	}

}
