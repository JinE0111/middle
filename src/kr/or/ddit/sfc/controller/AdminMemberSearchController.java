package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminMemberService;
import kr.or.ddit.admin.service.IAdminMemberService;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/AdminMemberSearch.do")
public class AdminMemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberSearch = req.getParameter("search_member");
		
		IAdminMemberService service = AdminMemberService.getInstance();
		
		List<MemberVO> list = service.memberSearch(memberSearch);
		
//		System.out.println(list);
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/admin_member.jsp").forward(req, resp);
	}

}
