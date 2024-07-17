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
import kr.or.ddit.sfc.vo.MemberVO;
@WebServlet("/AddrAdd/Insert.do")
public class AddrAddInsert extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * //추가 데이터 보냄 
		 * AddrAddVO inAV = new AddrAddVO(); inAV.setDeliPostNo(deliPostNo);
		 * inAV.setDeliAddr(deliAddr); inAV.setDeliAddrD(deliAddrD);
		 * inAV.setMemTel(memTel); inAV.setMemName(memName); inAV.setDeliReq(deliReq);
		 * 
		 * 
		 * addrAddService.insertAddrAdd(inAV);
		 */
//	//경로
//	resp.sendRedirect(req.getContextPath() + "/Jjim.do");//리다이렉트 처리
	//경로
		req.getRequestDispatcher("/addrAddPopUp.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력 데이터 받음
		int deliPostNo =Integer.parseInt(req.getParameter("deliPostNo"));
		String deliAddr =req.getParameter("deliAddr");
		String deliAddrD =req.getParameter("deliAddrD");
		String memTel =req.getParameter("memTel");
		String memName =req.getParameter("memName");
		String deliReq =req.getParameter("deliReq");
		String memEmail =req.getParameter("memEmail");
		
		
//		String deliId =req.getParameter("deliId");
		
//		System.out.println("AAIdeliId>>>>>>>>>>>>>>>>>>>>>>>>>>>"+deliId);
		IAddrAddService addrAddService = AddrAddServiceImpl.getInstance();
		
//		//아이디 값
		MemberVO memVo = (MemberVO) req.getSession().getAttribute("login_user");
		
		String deliId = memVo.getMemId();
//		
		 AddrAddVO inAV = new AddrAddVO(); 
		 inAV.setDeliPostNo(deliPostNo);
		 inAV.setDeliAddr(deliAddr);
		 inAV.setDeliAddrD(deliAddrD);
		 inAV.setMemTel(memTel);
		 inAV.setMemName(memName);
		 inAV.setDeliReq(deliReq);
		 inAV.setDeliId(deliId);
		 
		 
		 
		 int cnt = addrAddService.insertAddrAdd(inAV);
		
		 String msg="";
			
			if(cnt >0) {
				//삭제성공
				msg = "성공";
			}else {
				//삭제실패
				msg = "실패";
			}
			
			req.getSession().setAttribute("msg", msg);
		 
		//다시 새로운 요청(리로딩|새로고침) 할때  전송
		resp.sendRedirect(req.getContextPath() + "/AddrAdd.do");//리다이렉트 처리
	}
	
	public static void main(String[] args) {
	}

}
