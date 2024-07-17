package kr.or.ddit.sfc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.admin.service.AdminMemberService;
import kr.or.ddit.admin.service.IAdminMemberService;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/AdminMember.do")
public class AdminMemberController extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 서비스객체
		IAdminMemberService service = AdminMemberService.getInstance();
		
		// 페이징 
		
		int currentPage = 1; // 페이지 기본값 설정

		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		System.out.println("currentPage >> " + currentPage);
		
		// 게시물 개수
		// 서비스 객체 필요
		int totalCount = service.memberCnt();

		System.out.println("회원ㄴ리스트>>>>>>>>>>totalCount >>" + totalCount);
		// 화면에 표시될 페이지 수 
		int perPage = 10;
		
		// 한 페이지 당 출력할 회원 수 
		int perList = 10;
		
		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
		int totalPage = (int)Math.ceil((double)totalCount/(double)perList);
		System.out.println("totalPage >> "+totalPage);
		
		// 페이지 당 출력할 게시글의 범위(start ~ end) 구하기
		// start = (currentPage -1) * perList + 1;
		int start =(currentPage -1) * perList +1;
		System.out.println("start >> "+start);

		int end = start + perList - 1;
		if(end > totalCount) end = totalCount; // 전체 글 갯수를 초과하는 end 값 조절 
		System.out.println("end >> "+end);
		
		// 화면에 표시할 페이지 범위(startPage ~ endPage) 구하기
		// startPage = (currentPage-1) / perPage*perPage)+1 
		int startPage = ((currentPage-1) / perPage*perPage) + 1;
		System.out.println("startPage >> "+startPage);
		
		// endPage = startPage + perPage -1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("str", start);
		map.put("end", end);
		
		// 범위별 게시물 가져오기
		List<MemberVO> pageRangeList = service.memberList(map);
		
		// request 객체에 결과 값 담아서 보내기 
		req.setAttribute("list", pageRangeList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("str", start);
		
		// 요청을 원하는 위치로 전달
		req.getRequestDispatcher("/admin_member.jsp").forward(req, resp);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
