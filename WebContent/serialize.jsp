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
 String sql = "SELECT mem_id FROM member WHERE mem_name = ? AND mem_tel = ?";

 String foundId = "";
 
    PreparedStatement pstmt = conn.prepareStatement(sql);
     // 쿼리 매개변수 설정
     pstmt.setString(1, request.getParameter("memName"));
     pstmt.setString(2, request.getParameter("memTel"));
     
     // 쿼리 실행 및 결과 처리
     try (ResultSet rs = pstmt.executeQuery()) {
         if (rs.next()) {
             foundId = rs.getString("mem_id");
             System.out.println("Found ID: " + foundId);
             // 찾은 아이디를 사용자에게 반환하는 로직 추가 (예: 화면에 출력)
         } else {
            System.out.println("이름이나 번호가 틀렸습니다..");
             // 사용자를 찾을 수 없음을 알리는 로직 추가
         }
   } catch (SQLException e) {
    e.printStackTrace();
    // 예외 처리 로직 추가
   }
	conn.close();
%>
<%=foundId%>

   