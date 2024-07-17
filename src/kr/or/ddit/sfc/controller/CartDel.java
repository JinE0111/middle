package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.cart.service.CartListServiceImpl;
import kr.or.ddit.sfc.cart.service.ICartService;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/CartDel.do")
public class CartDel extends HttpServlet {
	
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(CartDel.class);
	
	private static final long serialVersionUID = 1L;
       
    public CartDel() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user"); // id가져오기
		String memId = mv.getMemId();
		String ajaxMsg = request.getParameter("valueArr");
		List<String> productList = Arrays.asList(ajaxMsg.split(","));
		
		CartVO cv = new CartVO();
		
		ICartService cartDelService = CartListServiceImpl.getInstance();

		int cntDelete = 0; 
//		
//		System.out.println(delList);
		
		for(int i = 0; i<productList.size(); i++) {
			String proCode = productList.get(i);
			cv.setProCode(proCode);
			cv.setMemId(memId);
			RESULT_LOGGER.fatal("Search result: " + cv);
		
			cntDelete = cartDelService.cartDel(cv);
		}
		
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
