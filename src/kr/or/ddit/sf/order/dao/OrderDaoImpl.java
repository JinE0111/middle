package kr.or.ddit.sf.order.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.OrderVO;

public class OrderDaoImpl extends MyBatisDao implements IOrderDao{

	private static OrderDaoImpl dao;
	
	private OrderDaoImpl() {}
	
	public static IOrderDao getInstance() {
		if(dao == null) {
			dao = new OrderDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<OrderVO> orderList(String memId) throws SQLException {

		return selectList("order.orderList",memId);
	}
	
}
