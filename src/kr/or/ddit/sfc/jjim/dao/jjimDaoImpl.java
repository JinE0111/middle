package kr.or.ddit.sfc.jjim.dao;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.JjimVo;


public class jjimDaoImpl implements IJjimDao {
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
   private static final Logger RESULT_LOGGER = 
            LogManager.getLogger(jjimDaoImpl.class);
   
	private static IJjimDao jjimDao;
	
	private jjimDaoImpl() {
	}
	public static IJjimDao getInstance() {
		if(jjimDao == null) {
			jjimDao = new jjimDaoImpl();
		}
		return jjimDao;
	}
	@Override
	public List<JjimVo> displayjjim(MemberVO mv) {
		SqlSession session = MyBatisUtil.getInstance(true);
		
		List<JjimVo> jjimList = new ArrayList<JjimVo>();
		try {
			jjimList = session.selectList("jjim_member.selectAllJjim",mv);
//			SQL_LOGGER.debug("jjimList : " + jjimList);
			RESULT_LOGGER.fatal("jjimList: " + jjimList);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return jjimList;
	}

	/**
	 * 삭제
	 */
	@Override
	public int removeJjim(JjimVo reJV) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = session.delete("jjim_member.delectJjim",reJV);
			RESULT_LOGGER.fatal("cnt: " + cnt);
			if(cnt >0) {
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
	public int insertJjim(JjimVo inJV) {
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = session.insert("jjim_member.insertJjim",inJV);
			RESULT_LOGGER.fatal("찜 추가cnt: " + cnt);
			if(cnt >0) {
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
