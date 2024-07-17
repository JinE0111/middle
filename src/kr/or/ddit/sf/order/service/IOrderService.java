package kr.or.ddit.sf.order.service;

import java.util.List;

import kr.or.ddit.sfc.vo.OrderVO;

public interface IOrderService {
	public List<OrderVO> orderList(String memId);
}
