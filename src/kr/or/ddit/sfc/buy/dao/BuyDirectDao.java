package kr.or.ddit.sfc.buy.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.ProductVO;

public class BuyDirectDao implements IBuyDirectDao{

	// 싱글톤 
	private static IBuyDirectDao buyDirectDao = null;
	
	private BuyDirectDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static IBuyDirectDao getInstance() {
		if(buyDirectDao == null ) buyDirectDao = new BuyDirectDao();
		return buyDirectDao;
	}
	
	@Override
	public ProductVO directBuyInfo(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getInstance();
		ProductVO vo = session.selectOne("buy.buyDirect", map);
		session.close();
		return vo;
	}

}
