package kr.or.ddit.prd.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.ProductVO;

public class PrdListDao implements IPrdListDao{
	
	//싱글톤 
	private static PrdListDao prdListDao = null;
	
	private PrdListDao() {}
	
	public static IPrdListDao getInstance() {
		if(prdListDao == null) prdListDao = new PrdListDao();
		return prdListDao;
	}

	@Override
	public int prdCnt(String category) throws SQLException{
		// MyBatisUtil 객체 생성
		SqlSession session = MyBatisUtil.getInstance();
		// TODO Auto-generated method stub
		int cnt = session.selectOne("prdList.countList",category);
		session.close();
		return cnt;
	}

	@Override
	public List<ProductVO> pageRange(Map<String, Object> map) {
		// MyBatisUtil 객체 생성
		SqlSession session = MyBatisUtil.getInstance();
		List<ProductVO> list = session.selectList("prdList.rangeList",map);
		session.close();
		return list;
	} 


}
