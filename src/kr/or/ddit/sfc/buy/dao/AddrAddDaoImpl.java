package kr.or.ddit.sfc.buy.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MyBatisUtil;
import kr.or.ddit.sfc.jjim.dao.IJjimDao;
import kr.or.ddit.sfc.jjim.dao.jjimDaoImpl;
import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.MemberVO;

public class AddrAddDaoImpl implements IAddrAddDao {
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	            LogManager.getLogger(AddrAddDaoImpl.class);
	   
		private static IJjimDao jjimDao;

	private static IAddrAddDao addrAddDao;
	
	private AddrAddDaoImpl() {
	}
	
	public static IAddrAddDao getInstance() {
		if(addrAddDao == null) {
			addrAddDao = new AddrAddDaoImpl();
		}
		return addrAddDao;
	}

	@Override
	public List<AddrAddVO> displayAddrAdd(String mv) {
		SqlSession session = MyBatisUtil.getInstance(true);
		List<AddrAddVO> AAList = new ArrayList<AddrAddVO>();
		try {
			AAList = session.selectList("addrAdd.selectAddrAdd",mv);
			RESULT_LOGGER.fatal("AAList: " + AAList);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return AAList;
	}

	@Override
	public int deleteAddrAdd(AddrAddVO reAV) {
		SqlSession session = MyBatisUtil.getInstance(true);
		int cnt=0;
		try {
			cnt = session.delete("addrAdd.delectAddrAdd",reAV);
			RESULT_LOGGER.fatal("delete: " + cnt);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertAddrAdd(AddrAddVO inAV) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt=0;
		try {
			cnt = session.insert("addrAdd.insertAddrAdd",inAV);
			RESULT_LOGGER.fatal("Daoimpl insert:>>>>>>>>>>>>>>>>>>>>>>>> " + cnt);
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

//	@Override
//	public List<AddrAddVO> displayAddrAdd(String mv) {
//		SqlSession session = MyBatisUtil.getInstance(true);
//		List<AddrAddVO> addrAddList = new ArrayList<AddrAddVO>();
//		try {
//			addrAddList = session.selectList("addrAdd.selectAddrAdd",mv);
//			RESULT_LOGGER.fatal("display:>>>>>>>>>>>>>>>>>>>>> " + addrAddList);
//		} catch (PersistenceException e) {
//			e.printStackTrace();
//		}finally {
//			session.close();
//		}
//		return addrAddList;
//	}
}
