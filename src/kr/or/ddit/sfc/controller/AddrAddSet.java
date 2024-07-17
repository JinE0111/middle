package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.buy.service.AddrAddServiceImpl;
import kr.or.ddit.sfc.buy.service.IAddrAddService;
import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/AddrAddSet.do")
public class AddrAddSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(AddrAddSet.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memName = request.getParameter("memName");
		String memTel = request.getParameter("memTel");
		int deliPostNo = Integer.parseInt(request.getParameter("deliPostNo"));
		String deliAddr = request.getParameter("deliAddr");
		String deliAddrD = request.getParameter("deliAddrD");
		String deliReq = request.getParameter("deliReq");
		
		
		IAddrAddService addrAddService = AddrAddServiceImpl.getInstance();
		 
		MemberVO memVo = (MemberVO) request.getSession().getAttribute("login_user");
		String deliId= memVo.getMemId();
		
		 AddrAddVO setAV = new AddrAddVO(); 
		 setAV.setDeliPostNo(deliPostNo);
		 setAV.setDeliAddr(deliAddr);
		 setAV.setDeliAddrD(deliAddrD);
		 setAV.setMemTel(memTel);
		 setAV.setMemName(memName);
		 setAV.setDeliReq(deliReq);
		 setAV.setDeliId(deliId);
		 
		 System.out.println("setAV >>>>>>>>>>>>>>>>>>>" +  setAV);
		 
		 request.setAttribute("setAV", setAV);
		
	}

}
