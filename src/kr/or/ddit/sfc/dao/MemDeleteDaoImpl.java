package kr.or.ddit.sfc.dao;

import java.sql.SQLException;

import kr.or.ddit.sfc.common.MyBatisDao;

public class MemDeleteDaoImpl extends MyBatisDao implements IMemDelDao{
	
	private static MemDeleteDaoImpl dao;
	
	private MemDeleteDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public static IMemDelDao getInstance() {
		if(dao == null) {
			dao = new MemDeleteDaoImpl();
		}
		return dao;

	}

	@Override
	public int memDel(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return update("member.memDelete", memId);
	}
}
