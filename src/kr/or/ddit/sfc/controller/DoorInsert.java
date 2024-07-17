package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.door.service.DoorService;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;

@WebServlet("/Door/DoorInsert.do")
public class DoorInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/door_insert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	MemberVO mv = (MemberVO) request.getSession().getAttribute("login_user");
//	String memId = request.getParameter("memId");
	String doorName = request.getParameter("doorName");
	String doorCon = request.getParameter("doorCon");
	
	DoorService doorService = DoorService.getInstance();
	DoorVO dv = new DoorVO();
	dv.setMemId(mv.getMemId());
	dv.setDoorName(doorName);
	dv.setDoorCon(doorCon);
	
	doorService.insertDoor(dv);
	//리로딩, 새로고침할때
	response.sendRedirect(request.getContextPath() + "/Door.do");
	
	}

}
