package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.buy.service.AddrAddServiceImpl;
import kr.or.ddit.sfc.buy.service.IAddrAddService;
import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.MemberVO;
@WebServlet("/AddrAdd.do")
public class AddrAdd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	IAddrAddService addrAddService = AddrAddServiceImpl.getInstance();
//	//회원정보 가져옴
	MemberVO memVo = (MemberVO) req.getSession().getAttribute("login_user");
	System.out.println("memVo>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memVo);
	
//	String mv=req.getParameter("memId");//null
	String mv = memVo.getMemId();
	System.out.println("mv>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+mv);
	
	//보냄
	List<AddrAddVO> addrAddList = addrAddService.displayAddrAdd(mv);
	//보낸 데이터 가져옴
	req.setAttribute("addrAddList", addrAddList);
	
	//경로
	req.getRequestDispatcher("addrAdd.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
