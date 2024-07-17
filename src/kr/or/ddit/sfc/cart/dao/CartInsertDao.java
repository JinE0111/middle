package kr.or.ddit.sfc.cart.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.cart.service.CartInsertService;
import kr.or.ddit.sfc.cart.service.ICartInsertService;
import kr.or.ddit.sfc.vo.CartVO;

public class CartInsertDao implements ICartInsertDao{
	
	// 싱글톤 
	private static ICartInsertDao cartInsert = null;
	private CartInsertDao() {
	}
	public static ICartInsertDao getInstance() {
		if(cartInsert == null) cartInsert = new CartInsertDao();
		return cartInsert;
	}
	
	@Override
	public int cartInsert(CartVO map) {
		SqlSession session = MyBatisUtil.getInstance();
		
		int rst = session.insert("cart.cartInsert", map);
		
		if(rst > 0) {
			session.commit();
			System.out.println("인서트 성공");
		}
		
		session.close();
		
		return rst;
	}
	
}
