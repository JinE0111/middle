package kr.or.ddit.adminLogin;

import kr.or.ddit.sfc.vo.AdminVO;

public interface IAdminService {
	
	public AdminVO getMember(AdminVO avo);
	
	public boolean checkMember(String memId);
}
