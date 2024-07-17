package kr.or.ddit.sfc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.MemberVO;



public class LoginDaoImpl implements ILoginDao{
	
	private static ILoginDao dao;
	
	public static ILoginDao getInstance() {
		if(dao == null) {
			dao = new LoginDaoImpl();
		}
		return dao;
	}
	@Override
	public int SignUpMember(MemberVO mv) {
		return 0;
	}
	
	@Override
	public boolean checkMember(String memId) {
		boolean isExist = false; // 디폴트 - false, true가 중요하기 때문에
		
		SqlSession session = MyBatisUtil.getInstance(true); // 오토커밋 허용

		try {
			int cnt = session.selectOne("log.checkMember", memId);
			if(cnt>0) {
				isExist = true; // 정보가 존재하면 true
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return isExist;
	}
	
	@Override
	public MemberVO getMember(MemberVO mvo) {
		
		SqlSession session = MyBatisUtil.getInstance(true); // 오토커밋 허용

		MemberVO mv = new MemberVO();
		
		
		try {
			mv = session.selectOne("log.logMember", mvo);
			System.out.println(mv);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return mv;
	}
}
	