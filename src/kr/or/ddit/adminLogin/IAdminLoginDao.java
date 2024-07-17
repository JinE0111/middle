package kr.or.ddit.adminLogin;

import kr.or.ddit.sfc.vo.AdminVO;

public interface IAdminLoginDao {
	
	public AdminVO getMember(AdminVO mvo);
	
	public boolean checkMember(String memId);
}
