package kr.or.ddit.sfc.service;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.MemberVO;

public class MemUpdateDaoImpl extends MyBatisDao implements IMemUpdateDao{

	private static MemUpdateDaoImpl dao;
	
	private MemUpdateDaoImpl() {}
	
	public static IMemUpdateDao getInstance() {
		if(dao == null) {
			dao = new MemUpdateDaoImpl();
		}
		return dao;

	}

	@Override
	public int memUpdate(MemberVO mv){
		
		return update("member.memUpdate",mv);
	}
}
