package kr.or.ddit.sfc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.sfc.vo.AdminDeliVO;
import kr.or.ddit.sfc.vo.DeliStatusVO;

@WebServlet("/DeliStatus.do")
public class DeliStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DeliStatus() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId");
		String buyNo = request.getParameter("buyNo");
		String buyDate = request.getParameter("buyDate");
		String deliStatCode = request.getParameter("deliStatCode");
		
		System.out.println(memId+", "+buyNo+", "+buyDate+", "+deliStatCode);
		
		AdminDeliVO advo = new AdminDeliVO();
		advo.setMemId(memId);
		advo.setBuyNo(buyNo);
		advo.setBuyDate(buyDate);
		advo.setDeliStatCode(deliStatCode);
		
		IAdminService deliStatUpdate = AdminServiceImpl.getInstance();
		
		int cnt = deliStatUpdate.deliStatUpdate(advo);
		
		if(cnt > 0) {
			System.out.println("변경 성공");
		} else {
			System.out.println("변경 실패");
		}
	
		response.sendRedirect("./AdminDeli.do");
//		request.getRequestDispatcher("./AdminDeli.do").forward(request, response);
	}

}
