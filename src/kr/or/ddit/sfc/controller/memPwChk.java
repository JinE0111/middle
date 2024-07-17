package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.sfc.dao.IMemUpdateService;
import kr.or.ddit.sfc.dao.MemUpdateServiceImpl;
import kr.or.ddit.sfc.service.IMemUpdateDao;
import kr.or.ddit.sfc.vo.MemberVO;
@WebServlet("/memPwChk.do")
public class memPwChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(memPwChk.class);
       
    public memPwChk() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id 받아오기
		MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
		
		String memPw = mv.getMemPw();
		String getMemPw = request.getParameter("memPw");
		
		if(memPw.equals(getMemPw)) {
			request.getRequestDispatcher("/memUpdate.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/memPwChk.jsp").forward(request, response);
		}
		
	}
}
