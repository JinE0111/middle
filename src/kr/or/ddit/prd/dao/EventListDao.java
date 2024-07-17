package kr.or.ddit.prd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.sfc.vo.ProductVO;

public class EventListDao implements IEventListDao{
	
	private static IEventListDao eventListDao = null;
	private EventListDao() {
		// TODO Auto-generated constructor stub
	}
	public static IEventListDao getInstance() {
		if(eventListDao == null) eventListDao = new EventListDao();
		return eventListDao;
	}
	
	
	@Override
	public List<ProductVO> eventList(String evtParam) {
		SqlSession session = MyBatisUtil.getInstance();
		List<ProductVO> eventList = session.selectList("prdList.eventList", evtParam);
		
		session.close();
		return eventList;
	}

}
