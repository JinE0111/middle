package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.dao.IMemUpdateService;
import kr.or.ddit.sfc.dao.MemUpdateServiceImpl;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/memUpdate.do")
public class memUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정
		request.setCharacterEncoding("UTF-8");
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
		
		String memId = mv.getMemId();
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String memTel = request.getParameter("memTel");
		String memEmail = request.getParameter("memEmail");
		String memPostNo = request.getParameter("memPostNo");
		String memAddr = request.getParameter("memAddr");
		String memAddrD = request.getParameter("memAddrD");
		
		if(memPw != null && !memPw.isEmpty()) {
		    mv.setMemPw(memPw);
		}
		if(memName != null && !memName.isEmpty()) {
		    mv.setMemName(memName);
		}
		if(memTel != null && !memTel.isEmpty()) {
		    mv.setMemTel(memTel);
		}
		if(memEmail != null && !memEmail.isEmpty()) {
		    mv.setMemEmail(memEmail);
		}
		if(memPostNo != null && !memPostNo.isEmpty()) {
		    mv.setMemPostNo(memPostNo);
		}
		if(memAddr != null && !memAddr.isEmpty()) {
		    mv.setMemAddr(memAddr);
		}
		if(memAddrD != null && !memAddrD.isEmpty()) {
		    mv.setMemAddrD(memAddrD);
		}
		
		IMemUpdateService memUpdateService = MemUpdateServiceImpl.getInstance();
		
		int cnt = 0;
		
		cnt = memUpdateService.memUpdate(mv);
		
		if(cnt > 0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실");
		}
	}
}
