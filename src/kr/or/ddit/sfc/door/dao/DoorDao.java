package kr.or.ddit.sfc.door.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MyBatisUtil;
import kr.or.ddit.sfc.buy.dao.AddrAddDaoImpl;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;

public class DoorDao implements IDoorDao{
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	            LogManager.getLogger(DoorDao.class);
	   
	//싱글톤
		private static DoorDao instance =null;
		
		private DoorDao() {
			
		}
		
		public static DoorDao getInstance() {
			if(instance == null) {
				instance = new DoorDao();
			}
			return instance;
		}
		
		
	@Override
	public List<DoorVO> display(MemberVO mv) {
		SqlSession session = MyBatisUtil.getInstance(true);
		List<DoorVO> list = new ArrayList<DoorVO>();
		try {
			list = session.selectList("door.selectAllDoor",mv);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	public DoorVO doorDetail(DoorVO param) {
		SqlSession session = MyBatisUtil.getInstance(true);
		DoorVO dv = new DoorVO();
		try {
			dv = session.selectOne("door.selectDetailDoor",param);
			RESULT_LOGGER.fatal("dv>>>>>>>>>>>>>>>>>>>>>: " + dv);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dv;
	}

	@Override
	public int insertDoor(DoorVO dv) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = session.insert("door.insertDoor",dv);
			RESULT_LOGGER.fatal("insertDoor>>>>>>>>>>>>>>>>>>>>>: " + cnt);
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

}
