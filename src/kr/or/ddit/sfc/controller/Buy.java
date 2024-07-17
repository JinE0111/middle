package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.buy.service.BuyServiceImpl;
import kr.or.ddit.sfc.buy.service.IBuyService;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/Buy.do")
public class Buy extends HttpServlet {
	 private static final Logger SQL_LOGGER = 
         LogManager.getLogger("log4jexam.sql.Query");
   private static final Logger PARAM_LOGGER = 
         LogManager.getLogger("log4jexam.sql.Parameter");
   private static final Logger RESULT_LOGGER = 
         LogManager.getLogger(Buy.class);

	private static final long serialVersionUID = 1L;
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 유저 id 얻어옴
		String memId = request.getParameter("memId");
//		String memId = "a002";
		System.out.println(memId);
		
		IBuyService service = BuyServiceImpl.getInstance();
		
		List<CartVO> buyList = service.buyProd(memId);
		
		RESULT_LOGGER.fatal("Buy result: " + buyList);
		
		if(buyList != null) { 
			request.setAttribute("buyList", buyList);
			request.setAttribute("memId", memId);
			 
			System.out.println("buyList >>> " + buyList);
			System.out.println(request.getRequestDispatcher("/buy.jsp"));
			
			request.getRequestDispatcher("/buy.jsp").forward(request, response);
			
 		} else {
			request.getRequestDispatcher("/login").forward(request, response);
		}
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
