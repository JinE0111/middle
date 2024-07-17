package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/InsertOrder.do")
public class InsertOrder extends HttpServlet {
	
    public InsertOrder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("request >>> " + request);
		
		//데이터 받음
		String userId = request.getParameter("userId");
		String payVal = request.getParameter("payVal");
		String addCode = request.getParameter("addCode");
		String buyCost = request.getParameter("buyCost");
		
		System.out.println("payVal >> " + payVal);
		System.out.println("userId >> " + userId);
		System.out.println("addCode >> " + addCode);
		System.out.println("buyCost >> " + buyCost);
		
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
		for(ProductVO i : buyList) {
			System.out.println("buyList[i] >> " + i);
			System.out.println("getProCode >>> " + i.getProCode());
			System.out.println("get" + i.getCartQty());
			
			
			BuyDetailVO bui = new BuyDetailVO();
			
			bui.setProCode(i.getProCode());
			bui.setBuyQty(i.getCartQty());
			service.buyDetailInsert(bui);
		}
		
		// cart 테이블 delete
		service.buyAfter(userId);
		
		request.getRequestDispatcher("/Main.do").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
