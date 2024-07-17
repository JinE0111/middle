package kr.or.ddit.sfc.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.ProductVO;

public class MainDao implements IMainDao{

	// 싱글톤
	private static IMainDao mainDao = null;
	private MainDao() {
		// TODO Auto-generated constructor stub
	}
	public static IMainDao getInstance() {
		if(mainDao == null) mainDao = new MainDao();
		return mainDao;
	}
	
	@Override
	public List<ProductVO> bestSeller() {
		SqlSession session = MyBatisUtil.getInstance();
		List<ProductVO> list = session.selectList("main.bestSeller");
		session.close();
		return list;
	}

}
