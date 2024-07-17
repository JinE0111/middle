package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.jjim.service.IJjimService;
import kr.or.ddit.sfc.jjim.service.jjimServiceImpl;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.JjimVo;

@WebServlet("/Jjim.do")
public class JjimMain extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IJjimService jjimService = jjimServiceImpl.getInstance();
		
		//회원정보 가져옴
		MemberVO mv = (MemberVO) req.getSession().getAttribute("login_user");
		
		List<JjimVo> jjimList = jjimService.displayjjim(mv);
		
		//저장
		req.setAttribute("jjimList", jjimList);
		req.setAttribute("mv", mv);
		
		//경로
		req.getRequestDispatcher("jjim.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


}
