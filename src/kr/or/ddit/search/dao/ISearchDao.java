package kr.or.ddit.search.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.vo.ProductVO;

public interface ISearchDao {
	public List<ProductVO> search(String search) throws SQLException;
}
