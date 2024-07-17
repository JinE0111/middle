package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sf.order.service.IOrderService;
import kr.or.ddit.sf.order.service.OrderServiceImpl;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.OrderVO;

/**
 * Servlet implementation class MyOrder
 */
@WebServlet("/MyOrder.do")
public class MyOrder extends HttpServlet {
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(MyOrder.class);
	private static final long serialVersionUID = 1L;
       
    public MyOrder() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// id가져오기
    	MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
    	String memId = mv.getMemId();
    	// id가 없을 시 로그인 창으로 이동
    	if(memId == null) {
    		request.getRequestDispatcher("/login").forward(request, response);
    	}
    	
    	IOrderService orderService = OrderServiceImpl.getInstance();
    	List<OrderVO> orderList = orderService.orderList(memId);
    	
    	RESULT_LOGGER.fatal("orderList >>>>>>>> " + orderList);
    	request.setAttribute("orderList", orderList);
    	
    	
    	request.getRequestDispatcher("/myPage.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
