package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.sfc.vo.AdminDeliVO;
import kr.or.ddit.sfc.vo.DeliStatusVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/AdminDeli.do")
public class AdminDeli extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger SQL_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
	         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
	         LogManager.getLogger(AdminDeli.class);
	
    public AdminDeli() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IAdminService admin = AdminServiceImpl.getInstance();
		
		// 페이징

		int currentPage = 1; // 페이지 기본값 설정
//		System.out.println("넘어온페이지정보  >> " + request.getParameter("page"));

		currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
				
		System.out.println("currentPage >> " + currentPage);
				
		// 게시물 개수
		// 서비스 객체 필요
		int totalCount = 0;
		totalCount = admin.deliCnt();
		
		System.out.println("totalCount >>" + totalCount);
		// 화에 표시될 페이지 수 
		int perPage = 10;
				
		// 한페이지 당 출력할 글 갯수
		int perList = 5;
		
		// 전 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
		int totalPage = (int)Math.ceil((double)totalCount/(double)perList);
		System.out.println("totalPage >> "+totalPage);
		
		// 페지 당 출력할 게시글의 범위(start ~ end) 구하기
		// stat = (currentPage -1) * perList + 1;
		int start =(currentPage -1) * perList +1;
		System.out.println("start >> "+start);

		int end = start + perList - 1;
		if(end> totalCount) end = totalCount; // 전체 글 갯수를 초과하는 end 값 조절 
		System.out.println("end >> "+end);
		
		// 화에 표시할 페이지 범위(startPage ~ endPage) 구하기
		// statPage = (currentPage-1) / perPage*perPage)+1 
		int startPage = ((currentPage-1) / perPage*perPage) + 1;
		System.out.println("startPage >> "+startPage);
		
		// endage = startPage + perPage -1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		System.out.println("str >>>>>>>>> " + start + " end >>>>>>>>> " + end);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("str", start);
		map.put("end", end);
		
		List<AdminDeliVO> adminDeliList = admin.adminDeli(map);
		List<DeliStatusVO> dsvo = admin.deliStatus();
		
		RESULT_LOGGER.fatal("advo >>>>>>>>>>>> " + adminDeliList);
		RESULT_LOGGER.fatal("dsvo >>>>>>>>>>>> " + dsvo);
		
		request.setAttribute("advo", adminDeliList);
		request.setAttribute("dsvo", dsvo);
		
		// request 객체에 결과 값 담아서 보내기 
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("cPage", currentPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("str", start);
		
		// 요청을 원하는 위치로 전달
		request.getRequestDispatcher("./delivery.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
