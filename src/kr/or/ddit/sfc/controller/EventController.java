package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prd.service.EventListService;
import kr.or.ddit.prd.service.IEventListService;
import kr.or.ddit.sfc.vo.ProductVO;


@WebServlet("/Event.do")
public class EventController extends HttpServlet {
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String evPrd1 = "바지락";
		String evPrd2 = "꼬막";
		String evPrd3 = "새조개";
		String evPrd4 = "임연수";
		
		IEventListService service = EventListService.getInstance();
		
		List<ProductVO> eveBasirack = service.eventList(evPrd1);
		List<ProductVO> eveGgomack = service.eventList(evPrd2);
		List<ProductVO> eveSajogae = service.eventList(evPrd3);
		List<ProductVO> eveImyun = service.eventList(evPrd4);
		
		req.setAttribute("basirack", eveBasirack);
		req.setAttribute("ggomack", eveGgomack);
		req.setAttribute("sajogae", eveSajogae);
		req.setAttribute("imyun", eveImyun);
		
		req.getRequestDispatcher("/event.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
