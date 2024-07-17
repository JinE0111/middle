package kr.or.ddit.adminLogin;

import kr.or.ddit.sfc.vo.AdminVO;

public class AdminLoginServiceImpl implements IAdminService{
	
	private static IAdminService service;
	private IAdminLoginDao dao;
	
	private AdminLoginServiceImpl() {
		dao = AdminLoginDaoImpl.getInstance();
	}
	
	public static IAdminService getInstance() {
		
		if(service == null) service = new AdminLoginServiceImpl(); 
		return service;
	}
	
	@Override
	public AdminVO getMember(AdminVO avo) {
		return dao.getMember(avo);
	}

	@Override
	public boolean checkMember(String memId) {
		return dao.checkMember(memId);
	}

}
