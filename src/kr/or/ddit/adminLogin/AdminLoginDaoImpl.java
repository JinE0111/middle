package kr.or.ddit.adminLogin;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.AdminVO;

public class AdminLoginDaoImpl implements IAdminLoginDao{
	
	private static IAdminLoginDao dao;
	
	public static IAdminLoginDao getInstance() {
		if(dao == null) {
			dao = new AdminLoginDaoImpl();
		}
		
		return dao;
		
	}

	@Override
	public AdminVO getMember(AdminVO mvo) {
		SqlSession session = MyBatisUtil.getInstance(true);	
		
		AdminVO vo = new AdminVO();
		
		try {
			vo = session.selectOne("admin.adminLogin",mvo);
		}catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return vo;
	}

	@Override
	public boolean checkMember(String memId) {
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			int cnt = session.selectOne("admin.checkAdmin", memId);
			if(cnt>0) {
				isExist = true;
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return isExist;
		
	}
	
}
