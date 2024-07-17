package kr.or.ddit.search.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class SearchDaoImpl extends MyBatisDao implements ISearchDao{
	
	private static SearchDaoImpl dao;
	
	private SearchDaoImpl() {}
	
	public static ISearchDao getInstance() {
		if(dao == null) {
			dao = new SearchDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<ProductVO> search(String search) throws SQLException {
		
		return selectList("search.searchName", search);
	}

}
