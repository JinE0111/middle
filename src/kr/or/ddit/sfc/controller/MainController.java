package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.main.service.IMainService;
import kr.or.ddit.sfc.main.service.MainService;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/Main.do")
public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMainService service = MainService.getInstance();

		List<ProductVO> list = service.bestSeller();

		for (ProductVO vo : list) {
			System.out.println(vo);
		}
		req.setAttribute("bestSeller", list);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
