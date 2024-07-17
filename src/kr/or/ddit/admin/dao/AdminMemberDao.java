package kr.or.ddit.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MyBatisUtil;
import kr.or.ddit.sfc.controller.AdminMemberController;
import kr.or.ddit.sfc.vo.MemberVO;

public class AdminMemberDao implements IAdminMemberDao{
	private static final Logger SQL_LOGGER = LogManager.getLogger("log4jexam.sql.Query");
	private static final Logger PARAM_LOGGER = LogManager.getLogger("log4jexam.sql.Parameter");
	private static final Logger RESULT_LOGGER = LogManager.getLogger(AdminMemberDao.class);
	// 싱글톤
	private static IAdminMemberDao adminMemberDao = null;
	private AdminMemberDao() {
		// TODO Auto-generated constructor stub
	}
	public static IAdminMemberDao getInstance() {
		if(adminMemberDao == null) adminMemberDao = new AdminMemberDao();
		return adminMemberDao;
	}
	
	@Override
	public List<MemberVO> memberList(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getInstance();
		List<MemberVO> memList = session.selectList("admin.memberList", map);
		RESULT_LOGGER.fatal(" dao memList>>>>>>>>>>>>>>>>>>>>>: " + memList);
		session.close();
		return memList;
	}
	@Override
	public int memberCnt() {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = session.selectOne("admin.memberCnt");
		session.close();
		return cnt;
	}
	@Override
	public int memberDel(Map<String,Object> map) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = session.update("admin.memberDel", map);
		if(cnt>0) {
			session.commit();
		}
		session.close();
		return cnt;
	}
	
	@Override
	public List<MemberVO> memberSearch(String searchWord) {
		SqlSession session = MyBatisUtil.getInstance();
		
		List<MemberVO> list = session.selectList("admin.memberSearch", searchWord);
		
		session.close();
		
		return list;
	}
}
