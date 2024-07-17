<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="kr.or.ddit.sfc.vo.MemberVO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>    
<%
	//request.getParameter("mem_id");


//데이터베이스 연결
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
Connection conn = DriverManager.getConnection(url, "team3_202312M", "java");
 // SQL 쿼리 준비
 String sql = "SELECT mem_pw FROM member WHERE mem_id = ? AND mem_name = ? AND mem_email = ?";

 String foundPass = "";
 
	 PreparedStatement pstmt = conn.prepareStatement(sql);
     // 쿼리 매개변수 설정
     pstmt.setString(1, request.getParameter("memId"));
     pstmt.setString(2, request.getParameter("memName"));
     pstmt.setString(3, request.getParameter("memEmail"));
    
     try (ResultSet rs = pstmt.executeQuery()) {
         if (rs.next()) {
        	 foundPass = rs.getString("mem_pw");
             System.out.println("Found Pass: " + foundPass);
          
         } else {
        	 System.out.println("이름이나 번호 이메일이 틀렸습니다..");
         
         }
	} catch (SQLException e) {
	 e.printStackTrace();
	}
	conn.close();
%>
	
<%=foundPass%>
