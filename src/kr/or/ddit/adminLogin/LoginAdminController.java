package kr.or.ddit.adminLogin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginAdminController.do")
public class LoginAdminController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	
	public LoginAdminController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 어드민 로그인 get 메소드..");
		req.getRequestDispatcher("/adminLogin.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("여기는 어드민 로그인 Post 메소드..");

		String adminId = req.getParameter("adminId");
		String adminPw = req.getParameter("adminPw");
		
		System.out.println(adminId + ":" + adminPw);
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("adId",adminId);
		map.put("adPw",adminPw);
		
		resp.sendRedirect(req.getContextPath()+"/LoginAdminControllerJava.do");

	}
}	
