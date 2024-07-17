package kr.or.ddit.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.service.ILoginService;
import kr.or.ddit.sfc.service.ILoginServiceImpl;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/LoginController.do")
public class LoginController extends HttpServlet {

	public LoginController() {

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");
		String memPw = req.getParameter("memPw");
		
		List<String> li = new ArrayList<String>();
		MemberVO mvo = new MemberVO();
		
		mvo.setMemId(memId);
		mvo.setMemPw(memPw);
		
		li.add(memId);
		li.add(memPw);
		
		System.out.println(">>>>>" + memId);
		System.out.println("<<<<<" + memPw);
		
		ILoginService service = ILoginServiceImpl.getInstace(); // 서버
		/*
		 * boolean checkMember = service.checkMember(memId);
		 * System.out.println("checkMember >>>>>>>>>>> " + checkMember);
		 * resp.sendRedirect(req.getContextPath() + "/Main"); if(checkMember == false){
		 * System.out.println(">>>>>>>>>>>>>>>"); return; }
		 */
		// 해당 회원정보 가져오기 (id/pw 확인용)
		MemberVO mv = service.getMember(mvo);

		if (mv == null) {
			resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 jsp
		} else {
			// db에서 가져온 사용자 정보를 이용하여 패스워드 일치여부 확인
			boolean isAthneticated = false;
			if (mv != null) {
				if (memPw.equals(mv.getMemPw())) {
					isAthneticated = true;
				}
			}

			if (isAthneticated) { // 인증 성공

				// 세션에 로그인 정보 설정하기
				req.getSession().setAttribute("login_user", mv);

				// 메인페이지 이동
				resp.sendRedirect(req.getContextPath() + "/Main.do"); // 메인 jsp파일
			} else { // 인증 실패(회원 x)
				// 로그인 페이지로 이동
				resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 jsp 파일
			}

		}

	}
}
