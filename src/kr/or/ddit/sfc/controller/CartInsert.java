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

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.sfc.cart.service.CartInsertService;
import kr.or.ddit.sfc.cart.service.ICartInsertService;
import kr.or.ddit.sfc.vo.CartVO;

@WebServlet("/CartInsert.do")
public class CartInsert extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BufferedReader reader = req.getReader();
		String data = reader.readLine();
		System.out.println("<>>>>>>" + data);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject)parser.parse(data);
		
		String memId = jsonObj.get("cartMemId").getAsString();
		String proCode = jsonObj.get("cartProCode").getAsString();
		int cartQty = Integer.parseInt(jsonObj.get("cartQty").getAsString());
		
		String cartBuy = jsonObj.get("cartProCode").getAsString();
		
		CartVO cartVo = new CartVO();
		
		cartVo.setMemId(memId);
		cartVo.setProCode(proCode);
		cartVo.setCartQty(cartQty);
		
		ICartInsertService service = CartInsertService.getInstance();
		
		int rst = service.cartInsert(cartVo);
		
		System.out.println(rst);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

