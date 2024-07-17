package kr.or.ddit.prd.service;

import java.util.List;

import kr.or.ddit.prd.dao.EventListDao;
import kr.or.ddit.prd.dao.IEventListDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class EventListService implements IEventListService{
	
	private static IEventListService eventListService = null;
	private EventListService() {
		// TODO Auto-generated constructor stub
	}
	public static IEventListService getInstance() {
		if(eventListService == null) eventListService = new EventListService();
		return eventListService;
	}
	
	// dao 객체
	IEventListDao dao = EventListDao.getInstance();
	
	@Override
	public List<ProductVO> eventList(String param) {
		return dao.eventList(param);
	}
	
}
