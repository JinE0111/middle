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

import kr.or.ddit.sfc.notice.service.INoticeService;
import kr.or.ddit.sfc.notice.service.NoticeServiceImpl;
import kr.or.ddit.sfc.vo.NoticeVO;

@WebServlet("/Notice.do")
public class Notice extends HttpServlet {
	
	private static final Logger SQL_LOGGER = LogManager.getLogger("log4jexam.sql.Query");
	private static final Logger PARAM_LOGGER = LogManager.getLogger("log4jexam.sql.Parameter");
	private static final Logger RESULT_LOGGER = LogManager.getLogger(PrdListController.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		List<NoticeVO> noList = service.noticeList();
		
		request.setAttribute("noList", noList);
		request.getRequestDispatcher("/notice.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
