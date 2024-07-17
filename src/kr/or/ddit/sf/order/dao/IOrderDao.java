package kr.or.ddit.sf.order.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.vo.OrderVO;

public interface IOrderDao {
	public List<OrderVO> orderList(String memId) throws SQLException;
}
