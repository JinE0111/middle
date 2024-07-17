package kr.or.ddit.sfc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.admin.service.AdminMemberService;
import kr.or.ddit.admin.service.IAdminMemberService;

@WebServlet("/AdminMemDel.do")
public class AdminMemDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IAdminMemberService service = AdminMemberService.getInstance();

//		ajax로 진행할 경우 필요 코드
//		BufferedReader reader = req.getReader();
//		String data = reader.readLine();
//		System.out.println("<>>>>>>" + data);
//		
//		JsonParser parser = new JsonParser();
//		JsonObject jsonObj = (JsonObject)parser.parse(data);
//		
//		String memId = jsonObj.get("memId").getAsString();
//		String memDelYn = jsonObj.get("memDelYn").getAsString();
		
		
		String memId = req.getParameter("mem_id");
		String memDelYn = req.getParameter("mem_del_yn");
		
		System.out.println("memId>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memId);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("memDelYn", memDelYn);
		
		int cnt = service.memberDel(map);
		
//		ajax로 진행했을경우 필요 코드 
//		resp.setContentType("text/plain");
//		resp.setCharacterEncoding("UTF-8");
//		   
//		PrintWriter writer = resp.getWriter();
//		writer.print(cnt);
//		writer.close();
		
//		String msg = null;
		
//		if(cnt > 0) {
//			msg="회원상태 변경을 완료했습니다.";
//		}else {
//			msg="회원상태 변경을 실패했습니다.";
//		}
		
//		req.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath()+"/AdminMember.do");
	}
}
