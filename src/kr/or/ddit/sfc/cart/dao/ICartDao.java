package kr.or.ddit.sfc.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.CartVO;

public interface ICartDao {
	public List<CartVO> cartList(String memId) throws SQLException;
	
	public int cartDel(CartVO cv) throws SQLException;
	
	public int valueUpdate(Map<String, Object> proCountList) throws SQLException;
}
