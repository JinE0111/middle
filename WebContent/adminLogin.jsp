<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
#R{
  margin-right: 10px;

}
#image{
  margin-right: 313px;
}
#loginR {
  margin-left:348px;
  margin-top: -40px;
    }
#adminId{
 margin-top: 10px;
}
#adminPw{
	margin-top: 7px;
}

#register{
	margin-top: 7px;	
	margin-right: 10px;
}
body{
	font-family: "Noto Sans KR";
}
.container-fluid{
	width: 30%;
	margin-top: 30px;
}
.row{
	border: 4px solid lightgray;
 	padding: 10px;
}
.join{
	text-align: center;
}
.title{
 text-align: center;
 margin-top: 160px
}
#image {
  width:50px;
  height:50px;
  margin-top:10px;
  
}

</style>

<%@include file="./include/top.jsp"%>
	<h3 class="title">관리자 로그인</h3>
	<form method="post" action="LoginAdminControllerJava.do">
		<div class="container-fluid">
		
				<div class="col-xs-12">
					<input id="adminId" name="adminId" class="form-control a" placeholder="관리자 아이디">
				</div>
				
				<div class="col-xs-12">
					<input id="adminPw" name="adminPw" type="password" class="form-control a" placeholder="관리자 비밀번호">
				<br>
				</div>
				
				<div class="col-xs-12">
					<input type="submit" id="loginAjax" class="btn btn-primary col-xs-12" value="로그인">
				</div>
				<div>
					<label for = "login_auto_login" id = "R"></label>
					<a href="./login.jsp"><img src="img/파비콘.jpg" id="image" alt="관라자 로그인"></a>
				</div>
			</div>
	</form>
<!-- 푸터영역 -->
<%-- <%@include file="include/footer.jsp" %> --%>
<script>
</script>
<%@include file="include/footer.jsp" %>
