package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.cart.service.CartListServiceImpl;
import kr.or.ddit.sfc.cart.service.ICartService;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;


@WebServlet("/Cart.do")
public class Cart extends HttpServlet {
	 private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(Cart.class);
	
	
	private static final long serialVersionUID = 1L;

	public Cart() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 장바구니 목록 조회
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user"); // id가져오기
		
		// id가 없을 시 로그인 창으로 이동
		if(mv == null) {
			request.getRequestDispatcher("/login").forward(request, response);
		}
		
		ICartService cartService = CartListServiceImpl.getInstance();
		List<CartVO> cartList = cartService.cartList(mv.getMemId());
		RESULT_LOGGER.fatal("Search result: " + cartList);
		
		if(cartList != null) {
			HttpSession session = request.getSession();
			session.setAttribute("cartList", cartList);
			
//			response.sendRedirect(request.getContextPath() + "/cart.jsp");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user"); // id가져오기
		
		// 수량 변경 로직
		String proCount = request.getParameter("proCount"); // 받아온 수량과 상품코드
		List<String> proValue = Arrays.asList(proCount.split(",")); // ,를 기준으로 분리해서 리스트에 저장
		 
		Map<String, Object> proCountList = new HashMap<String, Object>();
		
		// memId, 수량, 상품코드를 map에 저장
		proCountList.put("value", proValue.get(0));
		proCountList.put("proCode", proValue.get(1));
		proCountList.put("memId", mv.getMemId());
		
		ICartService cartUpdate= CartListServiceImpl.getInstance();
		
		int cntUpdate = cartUpdate.valueUpdate(proCountList); 
		RESULT_LOGGER.fatal("Search result >>>>>>>>>>>>>> " + cntUpdate);
		
//		response.sendRedirect(request.getContextPath() + "./Cart");
		request.getRequestDispatcher("cart.jsp").forward(request, response);
			
	}
}
