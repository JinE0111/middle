package kr.or.ddit.sfc.dao;

import java.sql.SQLException;

import kr.or.ddit.sfc.service.IMemUpdateDao;
import kr.or.ddit.sfc.service.MemUpdateDaoImpl;
import kr.or.ddit.sfc.vo.MemberVO;

public class MemUpdateServiceImpl implements IMemUpdateService{
	
	private static IMemUpdateService service;
	private IMemUpdateDao dao;
	
	private MemUpdateServiceImpl() {
		dao = MemUpdateDaoImpl.getInstance();
	}
	
	public static IMemUpdateService getInstance() {
		if(service == null) {
			service = new MemUpdateServiceImpl();
		}
		return service;
	}

	@Override
	public int memUpdate(MemberVO mv) {
		int cnt = 0;
		try {
			cnt = dao.memUpdate(mv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}


}
