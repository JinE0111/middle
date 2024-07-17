package kr.or.ddit.adminLogin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.service.ILoginService;
import kr.or.ddit.sfc.vo.AdminVO;

@WebServlet("/LoginAdminControllerJava.do")
public class LoginAdminControllerJava extends HttpServlet{
	
	public LoginAdminControllerJava() {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String adminId = req.getParameter("adminId");
		String adminPw = req.getParameter("adminPw");
	
		List<String> li = new ArrayList<String>();
		AdminVO avo = new AdminVO();
	
		avo.setAdId(adminId);
		avo.setAdPw(adminPw);
		
		System.out.println(">>>>>" + adminId);
		System.out.println("<<<<<" + adminPw);
		
		IAdminService service = AdminLoginServiceImpl.getInstance();
		
		AdminVO av = service.getMember(avo);
		
		if(av == null) {
			resp.sendRedirect(req.getContextPath() + "/adminLogin.jsp");
		} else {
			boolean isAthneticated = false;
			if(av != null ) {
				if(adminPw.equals(av.getAdPw())) {
					isAthneticated = true;
				}
			}
			
			if(isAthneticated) {
				req.getSession().setAttribute("login_admin", av);
				
				resp.sendRedirect(req.getContextPath() + "/Main.do");
			}else {
				
				resp.sendRedirect(req.getContextPath() + "/adminLogin.jsp");
			}
		}
		
		
	}
}
