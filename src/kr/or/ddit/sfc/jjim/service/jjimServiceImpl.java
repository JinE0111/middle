package kr.or.ddit.sfc.jjim.service;

import java.util.List;

import kr.or.ddit.sfc.jjim.dao.IJjimDao;
import kr.or.ddit.sfc.jjim.dao.jjimDaoImpl;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.JjimVo;

public class jjimServiceImpl implements IJjimService {
	private static IJjimService jjimService;
	
	private IJjimDao jjimDao;
	
	private  jjimServiceImpl() {
		jjimDao = jjimDaoImpl.getInstance();
	}
	public static IJjimService getInstance() {
		if(jjimService == null ) {
			jjimService = new jjimServiceImpl();
		}
		return jjimService;
	}

	@Override
	public List<JjimVo> displayjjim(MemberVO mv) {
		return jjimDao.displayjjim(mv);
	}
	@Override
	public int removeJjim(JjimVo reJV) {
		int cnt = jjimDao.removeJjim(reJV);
		return cnt;
	}
	@Override
	public int insertJjim(JjimVo inJV) {
		int cnt = jjimDao.insertJjim(inJV);
		return cnt;
	}
	
}