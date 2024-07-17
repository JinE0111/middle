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
@WebServlet("/Jjim/Delete.do")
public class JjimRemove extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IJjimService jjimService = jjimServiceImpl.getInstance();
		
		//삭제 데이터 받음
		String receiveMemId = req.getParameter("memId");
		String receiveProCode =req.getParameter("proCode");
		//삭제 데이터 보냄
		JjimVo reJV = new JjimVo();
		reJV.setMemId(receiveMemId);
		reJV.setProCode(receiveProCode);
		
		
		int cnt = jjimService.removeJjim(reJV);
		
		String msg="";
			
		if(cnt >0) {
				//삭제성공
				msg = "성공";
			}else {
				//삭제실패
				msg = "실패";
			}
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/Jjim.do");//리다이렉트 처리
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
