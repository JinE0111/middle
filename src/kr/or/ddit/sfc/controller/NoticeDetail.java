package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.notice.service.INoticeService;
import kr.or.ddit.sfc.notice.service.NoticeServiceImpl;
import kr.or.ddit.sfc.vo.NoticeVO;

@WebServlet("/NoticeDetail.do")
public class NoticeDetail extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String noticeNo = request.getParameter("noticeNo");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		NoticeVO nv = service.noticeDetail(noticeNo);
		
		request.setAttribute("nv", nv);
		
		request.getRequestDispatcher("/notice_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
