package kr.or.ddit.sfc.dao;

import java.sql.SQLException;


public interface IMemDelDao {
	public int memDel(String memId) throws SQLException;
}
