package kr.or.ddit.sfc.cart.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.CartVO;

public interface ICartService {
	public List<CartVO> cartList(String memId);

	public int cartDel(CartVO cv);
	
	public int valueUpdate(Map<String, Object> proCountList);
}
