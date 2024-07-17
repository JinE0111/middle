package kr.or.ddit.sf.order.service;

import java.util.List;

import kr.or.ddit.sf.order.dao.IOrderDao;
import kr.or.ddit.sf.order.dao.OrderDaoImpl;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.OrderVO;

public class OrderServiceImpl implements IOrderService{

	private static IOrderService service;
	private IOrderDao dao;
	
	private OrderServiceImpl() {
		dao = OrderDaoImpl.getInstance();
	}
	
	public static IOrderService getInstance() {
		if(service ==  null) {
			service = new OrderServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<OrderVO> orderList(String memId) {
		List<OrderVO> orderList = null;
		
		try {
			orderList = dao.orderList(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderList;
	}
	
}
