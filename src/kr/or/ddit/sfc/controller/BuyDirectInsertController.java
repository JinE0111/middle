
package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.buy.service.BuyServiceImpl;
import kr.or.ddit.sfc.buy.service.IBuyService;
import kr.or.ddit.sfc.vo.BuyDetailVO;
import kr.or.ddit.sfc.vo.BuyVO;
import kr.or.ddit.sfc.vo.ProductVO;

/**
 * Servlet implementation class BuyDirectInsertController
 */
@WebServlet("/BuyDirectInsert.do")
public class BuyDirectInsertController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("request >>> " + request);
		
		//데이터 받음
		String userId = request.getParameter("userId");
		String payVal = request.getParameter("payVal");
		String addCode = request.getParameter("addCode");
		String buyCost = request.getParameter("buyCost");
		String proCode = request.getParameter("proCode");
		int buyQty = Integer.parseInt(request.getParameter("buyQty"));
		
		System.out.println("payVal >> " + payVal);
		System.out.println("userId >> " + userId);
		System.out.println("addCode >> " + addCode);
		System.out.println("buyCost >> " + buyCost);
		System.out.println("buyQty >> " + buyQty);
		
		BuyVO bv = new BuyVO();
		bv.setPayVal(payVal);
		bv.setUserId(userId);
		bv.setAddCode(addCode);
		bv.setBuyCost(Integer.parseInt(buyCost));
		
		// buy 테이블에 insert
		IBuyService service = BuyServiceImpl.getInstance();
		service.buyListInsert(bv);
		
		// 상품 갯수, 상품 코드 가져옴
		List<ProductVO> buyList = service.buyProductList(userId);
		System.out.println("buyList >>> " + buyList);
		System.out.println("buyList.size() >>> " + buyList.size());
		
		// buy detail 테이블에 insert
		BuyDetailVO bui = new BuyDetailVO();
		
		bui.setProCode(proCode);
		bui.setBuyQty(buyQty);
		service.buyDetailInsert(bui);
		
		request.getRequestDispatcher("/Main.do").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
