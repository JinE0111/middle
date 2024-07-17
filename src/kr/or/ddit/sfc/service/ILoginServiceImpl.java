package kr.or.ddit.sfc.service;

import java.util.List;

import kr.or.ddit.sfc.dao.ILoginDao;
import kr.or.ddit.sfc.dao.LoginDaoImpl;
import kr.or.ddit.sfc.vo.MemberVO;

public class ILoginServiceImpl implements ILoginService {

	private static ILoginService service;
	private ILoginDao dao;		//부가적 다오 
	
	private ILoginServiceImpl() {
		dao = LoginDaoImpl.getInstance(); //메인 다오
	}
	
	public static ILoginService getInstace() {
		
		if(service == null) service = new ILoginServiceImpl();
		return service;
	}
	@Override
	public boolean checkMember(String memId) {
		return dao.checkMember(memId);
	}

	@Override
	public MemberVO getMember(MemberVO mvo) {
		return dao.getMember(mvo);
	}
}
