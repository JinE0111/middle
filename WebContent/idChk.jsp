<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uId = request.getParameter("uId");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team3_202312M", "java");
	
	Statement stmt = conn.createStatement();
	String sql = "select mem_id from member where mem_id='"+uId+"'";
// 	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
// 	System.out.println(rs.next());
	
	if(rs.next()){
%>	
		{
			"rst":"fail",
			"msg":"사용불가능한 아이디 입니다."
		}
<%	
	}else{
%>
		{
			"rst":"ok",
			"msg":"사용가능한 아이디 입니다."
		}
<%
	}
%>

	