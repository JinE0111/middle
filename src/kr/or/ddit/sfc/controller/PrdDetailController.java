package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prd.service.IPrdDetailService;
import kr.or.ddit.prd.service.PrdDetailService;
import kr.or.ddit.sfc.vo.ProductVO;

/**
 * Servlet implementation class PrdDetail
 */
@WebServlet("/PrdDetail.do")
public class PrdDetailController extends HttpServlet {
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IPrdDetailService service = PrdDetailService.getInstance();
		
		String proCode = (String)req.getParameter("proCode");
		
		ProductVO pVo = service.proDetail(proCode);
		String category = service.categorySelect(proCode);
		
		System.out.println("디테일카테고리>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + category);
		
		// 상품정보 담아서 
		req.setAttribute("proInfo", pVo);
		req.setAttribute("category", category);
		System.out.println("ProVO >>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + pVo.getProImg());
		
		// 보내기! 
		req.getRequestDispatcher("/prd_detail.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
