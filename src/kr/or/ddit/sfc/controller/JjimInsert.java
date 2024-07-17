package kr.or.ddit.sfc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.jjim.service.IJjimService;
import kr.or.ddit.sfc.jjim.service.jjimServiceImpl;
import kr.or.ddit.sfc.vo.JjimVo;

@WebServlet("/Jjim/Insert.do")
public class JjimInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IJjimService jjimService = jjimServiceImpl.getInstance();
		
		//추가 데이터 받음
		String insertMemId = req.getParameter("memId");
		String insertProCode =req.getParameter("proCode");
		//추가 데이터 보냄
		JjimVo inJV = new JjimVo();
		inJV.setMemId(insertMemId);
		inJV.setProCode(insertProCode);
		
		jjimService.insertJjim(inJV);
		
		//임시 데이터 저장
//		req.getSession().setAttribute("inJV", inJV);
		
		//경로
		resp.sendRedirect(req.getContextPath() + "/Jjim.do");//리다이렉트 처리
		
		/*
		 * 추가문에 등록해주세요
		 * Jjim/Insert.do?memId=<%=jv.getMemId()%>&proCode=<%=jv.getProCode()%>
		 */
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	doGet(req, resp);
	}

}
