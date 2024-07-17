package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.sfc.vo.AdminVO;

@WebServlet("/adminLogin.do")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(AdminLogin.class);
       
    public AdminLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 어드민 데이터 받아오기
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>" + adminId + adminPw);
		
		AdminVO avo = new AdminVO();
		
		avo.setAdId(adminId);
		avo.setAdPw(adminPw);
		
		IAdminService adminLogin = AdminServiceImpl.getInstance();
		
		avo = adminLogin.adminLogin(avo);
		
		RESULT_LOGGER.fatal(avo);
		
		if(avo != null) {
			// 세션에 로그인 정보 설정하기
			request.getSession().setAttribute("admin", avo);

			// 메인페이지 이동
			response.sendRedirect(request.getContextPath() + "/Main.do"); // 메인 jsp파일
		} else { // 인증 실패(회원 x)
			// 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/adminLogin.jsp"); // 로그인 jsp 파일
		}
	}

}
