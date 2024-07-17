package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.sfc.door.service.DoorService;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;

/**
 * Servlet implementation class DoorDetail
 */
@WebServlet("/DoorDetail.do")
public class DoorDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");//door.jsp에서 정보 가져옴
		String doorCode = request.getParameter("doorCode");//door.jsp에서 정보 가져옴
		
		DoorVO param = new DoorVO();
		param.setMemId(memId);
		param.setDoorCode(doorCode);
		
		DoorService doorService = DoorService.getInstance();
		DoorVO dv = doorService.doorDetail(param);
		request.setAttribute("dv", dv); //정보 저장
		
		//경로연결
		// /(슬래시) 작성해야함!! WebContent 바로 아래에있어서 WebContent 생략
		request.getRequestDispatcher("/door_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
