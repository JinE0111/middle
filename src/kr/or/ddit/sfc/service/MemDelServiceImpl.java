package kr.or.ddit.sfc.service;

import kr.or.ddit.sfc.dao.IMemDelDao;
import kr.or.ddit.sfc.dao.MemDeleteDaoImpl;
import kr.or.ddit.sfc.vo.MemberVO;

public class MemDelServiceImpl implements IMemDelService{
	
	private static IMemDelService service;
	private IMemDelDao dao;
	
	private MemDelServiceImpl() {
		dao = MemDeleteDaoImpl.getInstance();
	}
	
	public static IMemDelService getInstance() {
		if(service == null) {
			service = new MemDelServiceImpl();
		}
		return service;
	}

	@Override
	public int memDel(String memId) {
		int memChk = 0;
		
		try {
			memChk = dao.memDel(memId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return memChk;
	}

}
