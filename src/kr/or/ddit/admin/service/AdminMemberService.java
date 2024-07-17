package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.dao.AdminMemberDao;
import kr.or.ddit.admin.dao.IAdminMemberDao;
import kr.or.ddit.sfc.vo.MemberVO;

public class AdminMemberService implements IAdminMemberService{
	
	//싱글톤
	private static IAdminMemberService adminMemberService = null;
	
	private AdminMemberService() {
		// TODO Auto-generated constructor stub
	}
	
	public static IAdminMemberService getInstance() {
		if(adminMemberService == null) adminMemberService = new AdminMemberService();
		return adminMemberService;
	}
	
	// dao 객체 생성 
	IAdminMemberDao dao = AdminMemberDao.getInstance();
	
	
	@Override
	public List<MemberVO> memberList(Map<String, Object> map) {
		return dao.memberList(map);
	}

	@Override
	public int memberCnt() {
		return dao.memberCnt();
	}

	@Override
	public int memberDel(Map<String,Object> map) {
		return dao.memberDel(map);
	}

	@Override
	public List<MemberVO> memberSearch(String searchWord) {
		// TODO Auto-generated method stub
		return dao.memberSearch(searchWord);
	}

}
