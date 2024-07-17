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
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.or.ddit.prd.service.IPrdListService;
import kr.or.ddit.prd.service.PrdListService;
import kr.or.ddit.search.service.ISearchService;
import kr.or.ddit.search.service.SearchServiceImpl;
import kr.or.ddit.sfc.vo.ProductVO;

@WebServlet("/Search.do")
public class Search extends HttpServlet {
	//로깅
	   private static final Logger SQL_LOGGER = 
		         LogManager.getLogger("log4jexam.sql.Query");
	   private static final Logger PARAM_LOGGER = 
		         LogManager.getLogger("log4jexam.sql.Parameter");
	   private static final Logger RESULT_LOGGER = 
		         LogManager.getLogger(Search.class);
	
	private static final long serialVersionUID = 1L;
       
    public Search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String searchName = request.getParameter("searchName");
		System.out.println(searchName);
		
		ISearchService service = SearchServiceImpl.getInstance();
		
		List<ProductVO> searchList = service.searchProd(searchName);
		RESULT_LOGGER.fatal("Search result: " + searchList);

		
		request.setAttribute("searchList", searchList);
		request.setAttribute("searchName", searchName);
		
		IPrdListService listService = PrdListService.getInstance();
		
		int currentPage = 1; // 페이지 기본값 설정
//		System.out.println("넘어온페이지정보  >> " + request.getParameter("page"));

		currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		System.out.println("currentPage >> " + currentPage);
		
		// 게시물 개수
		// 서비스 객체 필요
		int totalCount = 0;
		try {
			totalCount = listService.prdCnt(searchName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("totalCount >>" + totalCount);
		// 화면에 표시될 페이지 수 
		int perPage = 10;
				
		// 한 페이지 당 출력할 글 갯수
		int perList = 12;
		
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
		map.put("searchName",searchName);
		
		// 범위별 게시물 가져오기
		List<ProductVO> pageRangeList = listService.pageRange(map);
		
		// request 객체에 결과 값 담아서 보내기 
		request.setAttribute("list", pageRangeList);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("cPage", currentPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("str", start);
			
		// 검색 후 경로지정
		request.getRequestDispatcher("/search.jsp").forward(request, response);
			
	}

}
