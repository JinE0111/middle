package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.NoticeVO;

@WebServlet("/NoticeInsert.do")
public class NoticeInsert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		AdminVO ad = (AdminVO)request.getSession().getAttribute("login_admin");
		
		String adId = ad.getAdId();
//		String adId = "admin";
		System.out.println("ad >>>>>>> " + ad);
		System.out.println("adId >>>>>>> " + adId);
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		
		System.out.println("title >>> " + title);
		System.out.println("content >>> " + content);
		
		NoticeVO nv = new NoticeVO();
		nv.setNoticeName(title);
		nv.setNoticeCon(content);
		nv.setAdId(adId);
		
		int cnt = service.noticeInsert(nv);
		System.out.println("cnt >>>> " + cnt);
		
		if(cnt >0) {
			System.out.println("게시글 추가 성공!!");
		} else {
			System.out.println("게시글 추가 실패!!");
		}
		
		response.sendRedirect(request.getContextPath()+"/Notice.do");
	}
}
