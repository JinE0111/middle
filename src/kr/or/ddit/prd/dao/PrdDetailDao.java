package kr.or.ddit.prd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.ProductVO;

public class PrdDetailDao implements IPrdDetailDao{
	
	// 싱글톤
	private static PrdDetailDao prdDetailDao = null;
	
	private PrdDetailDao() {}
	
	public static IPrdDetailDao getInstance() {
		if(prdDetailDao == null) prdDetailDao = new PrdDetailDao();
		return prdDetailDao;
	}
	
	@Override
	public ProductVO proDetail(String proCode) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		ProductVO proInfo = session.selectOne("prdList.proDetail", proCode);
		
		session.close();
		
		return proInfo;
	}
	
	@Override
	public String categorySelect(String proCode) {
		// MyBatisUtil 객체 생성
		SqlSession session = MyBatisUtil.getInstance();
		
		String category = null;
		try {
			category = session.selectOne("prdList.category",proCode);
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return category;
	}
}
