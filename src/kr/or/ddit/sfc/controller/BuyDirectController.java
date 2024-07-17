package kr.or.ddit.sfc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.sfc.buy.service.BuyDirectService;
import kr.or.ddit.sfc.buy.service.IBuyDirectService;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/BuyDirect.do")
public class BuyDirectController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String proCode = req.getParameter("buy_prd");
		int proQty = Integer.parseInt(req.getParameter("pro_qty"));
		
		System.out.println("proQty>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + proQty);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("proCode", proCode);
		map.put("proQty", proQty);
		
		IBuyDirectService service = BuyDirectService.getInstance();
		
		ProductVO vo = service.directBuyInfo(map);
		
		req.setAttribute("buyInfoVo", vo);
		req.setAttribute("proQty", proQty);
		req.getRequestDispatcher("/direct_buy_detail.jsp").forward(req, resp);
	}
}
