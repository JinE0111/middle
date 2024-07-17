package kr.or.ddit.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login.do")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public login() {
		
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 로그인 get 메소드...");
		req.getRequestDispatcher("/login.jsp").forward(req,resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 로그인 post 메소드");
		
		String memId = req.getParameter("memId");
		String memPw = req.getParameter("memPw");
		
		System.out.println(memId + ":" + memPw);
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("uId",memId);
		map.put("uPw",memPw);
		
		resp.sendRedirect(req.getContextPath()+"LoginController.do");
		
		
		
		
	}
}
