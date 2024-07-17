package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.dao.IMemUpdateService;
import kr.or.ddit.sfc.dao.MemUpdateServiceImpl;
import kr.or.ddit.sfc.service.IMemDelService;
import kr.or.ddit.sfc.service.MemDelServiceImpl;
import kr.or.ddit.sfc.vo.MemberVO;


@WebServlet("/MemDelete.do")
public class MemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(MemDelete.class);
	
    public MemDelete() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("메롱");
		
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
		
		String memId = mv.getMemId();
		String memPw = mv.getMemPw();
		String getMemPw = request.getParameter("memPw");
		
		IMemDelService memDelService = MemDelServiceImpl.getInstance();
		
		int cnt = 0;
		
		if(memPw.equals(getMemPw)) {
			
				System.out.println("탈퇴 성공");
				cnt = memDelService.memDel(memId);
				request.getSession().removeAttribute("login_user");
				response.sendRedirect("/PalDDack/Main.do");
				
		} else {
			request.getRequestDispatcher("/myPagememberDelete.jsp").forward(request, response);
		}
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
		
		String memId = mv.getMemId();
		String memPw = mv.getMemPw();
		String getMemPw = request.getParameter("memPw");
		
		IMemDelService memDelService = MemDelServiceImpl.getInstance();
		
		int cnt = 0;
		
		if(memPw.equals(getMemPw)) {
			
				System.out.println("탈퇴 성공");
				cnt = memDelService.memDel(memId);
				request.getSession().removeAttribute("login_user");
				response.sendRedirect("/PalDDack/Main.do");
				
		} else {
			request.getRequestDispatcher("/myPagememberDelete.jsp").forward(request, response);
		}
		 */
	}
}
