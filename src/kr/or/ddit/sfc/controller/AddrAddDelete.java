package kr.or.ddit.sfc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.buy.service.AddrAddServiceImpl;
import kr.or.ddit.sfc.buy.service.IAddrAddService;
import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.JjimVo;
@WebServlet("/AddrAdd/Delete.do")
public class AddrAddDelete extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	IAddrAddService addrAddService = AddrAddServiceImpl.getInstance();
	
	//삭제 데이터 받음
	String deliCode =req.getParameter("deliCode");
	
	//삭제 데이터 보냄
	AddrAddVO delAV = new AddrAddVO();
	delAV.setDeliCode(deliCode);
	
	addrAddService.deleteAddrAdd(delAV);
	//경로
	resp.sendRedirect(req.getContextPath() + "/AddrAdd.do");//리다이렉트 처리
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
