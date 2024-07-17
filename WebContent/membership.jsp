<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kr.or.ddit.sfc.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String telNumber = (String)request.getParameter("memTel") + "-" + (String)request.getParameter("memTel2") + "-" + (String)request.getParameter("memTel3");
String eMail = (String)request.getParameter("memEmail") + (String)request.getParameter("memEmail2"); 
MemberVO vo = new MemberVO();
vo.setMemId(request.getParameter("memId"));
vo.setMemPw(request.getParameter("memPw")); // 수정
vo.setMemName(request.getParameter("memName")); // 수정
vo.setMemPostNo(request.getParameter("memPostNo")); // 수정
vo.setMemAddr(request.getParameter("memAddr")); // 수정
vo.setMemAddrD(request.getParameter("memAddrD")); // 수정
vo.setMemEmail(eMail);
vo.setMemTel(telNumber); // 수정

//System.out.println(request.getParameter("memTel"));
/* System.out.println(eMail);
System.out.println(telNumber); */

// 데이터 베이스 연결
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
Connection conn = DriverManager.getConnection(url, "team3_202312M", "java");
Statement stmt = conn.createStatement();


String sql = "INSERT INTO MEMBER("
		   + "MEM_ID, MEM_PW, MEM_NAME, MEM_ADDR," 
		   + "MEM_POST_NO, MEM_ADDR_D, MEM_EMAIL , MEM_TEL)"
		   + "VALUES("
				   + "'" + vo.getMemId() + "',"
				   + "'" + vo.getMemPw()+ "',"
				   + "'" + vo.getMemName()+ "',"
				   + "'" + vo.getMemAddr()+ "',"
				   + "'" + vo.getMemPostNo()+ "',"
				   + "'" + vo.getMemAddrD()+ "',"
				   + "'" + vo.getMemEmail()+ "',"
				   + "'" + vo.getMemTel()+ "')";	

/* System.out.println(sql); */
int rst = stmt.executeUpdate(sql);
stmt.close();
conn.close();
%> 
		
	<%=rst %> 
