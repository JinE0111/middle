package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.door.service.DoorService;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

/**
 * Servlet implementation class Door
 */
@WebServlet("/Door.do")
public class Door extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DoorService doorService = DoorService.getInstance();
			//회원정보 가져옴
				MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
				List<DoorVO> list = new ArrayList<DoorVO>();// 쿼리문 담을 list 객체 생성
				list = doorService.display(mv);
				AdminVO login_admin=(AdminVO)request.getSession().getAttribute("login_admin");
				
				System.out.println(login_admin);
				
				
				request.setAttribute("list", list);
				request.setAttribute("mv", mv);//회원정보
				request.setAttribute("login_admin", login_admin); //관리자 정보
				
				// 페이징

				
				
				//경로
				request.getRequestDispatcher("door.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
