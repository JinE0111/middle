package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.DoorVO;

/**
 * Servlet implementation class AdminDoor
 */
@WebServlet("/AdminDoorInsert.do")
public class AdminDoorInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		AdminVO AV=(AdminVO)request.getSession().getAttribute("admin");
		request.getRequestDispatcher("door_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IAdminService adminDoorInsert  = AdminServiceImpl.getInstance();
		
		String aCon = request.getParameter("aCon");
		String doorCode = request.getParameter("doorCode");
		String adId = request.getParameter("adId");
		
		DoorVO dv = new DoorVO();
		dv.setaCon(aCon);
		dv.setDoorCode(doorCode);
		dv.setAdId(adId);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>" + dv);
		
		adminDoorInsert.adminDoorInsert(dv);
		
		//다시 새로운 요청 할때 전송
		response.sendRedirect(request.getContextPath() + "/Door.do");
	}

}
