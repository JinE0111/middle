package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MyBatisUtil;
import kr.or.ddit.sfc.buy.dao.AddrAddDaoImpl;
import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.AdminDeliVO;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.DeliStatusVO;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.NoticeVO;

public class AdminDaoImpl extends MyBatisDao implements IAdminDao{
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	            LogManager.getLogger(AdminDaoImpl.class);

	private static AdminDaoImpl dao;
	
	private AdminDaoImpl() {}
	
	public static IAdminDao getInstance() {
		if(dao == null) {
			dao = new AdminDaoImpl();
		}
		return dao;
	}
	
	@Override
	public AdminVO adminLogin(AdminVO avo){
		// TODO Auto-generated method stub
		return selectOne("admin.adminLogin", avo);
	}

	@Override
	public List<AdminDeliVO> adminDeli(Map<String, Object> map){
		// TODO Auto-generated method stub
		return selectList("admin.adminDeli", map);
	}

	@Override
	public List<DeliStatusVO> deliStatus(){
		// TODO Auto-generated method stub
		return selectList("admin.deliStatus");
	}
	@Override
	public int adminDoorInsert(DoorVO dv) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = session.insert("admin.adminDoorInsert", dv);
			update("admin.adminDoorY",dv); //찬우가 된다고 했음
				if(cnt > 0) {
					session.commit();
				}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int deliStatUpdate(AdminDeliVO advo) throws SQLException {
		// TODO Auto-generated method stub
		return update("admin.deliStatUpdate", advo);
	}

	@Override
	public int noticeInsert(NoticeVO nv) {
		return insert("admin.noticeInsert", nv);
	}

	@Override
	public int deliCnt(){
		// TODO Auto-generated method stub
		return selectOne("admin.deliCnt");
	}

}
