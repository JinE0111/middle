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
#userId{
 margin-top: 10px;
}
#userPw{
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
	<h3 class="title">로그인</h3>
	<form method="post" action="<%=request.getContextPath()%>/LoginController.do">
		<div class="container-fluid">
		
				<div class="col-xs-12">
					<input id="userId" name="memId" class="form-control a" placeholder="아이디">
				</div>
				
				<div class="col-xs-12">
					<input id="userPw" name="memPw" type="password" class="form-control a" placeholder="비밀번호">
				<br>
				</div>
				
				<div class="col-xs-12">
					<input type="submit" id="loginAjax" class="btn btn-primary col-xs-12" value="로그인">
				</div>
								
				<div class="col-xs-12">
					<a href="join.jsp" class="btn col-xs-12 btn btn-default" id="register">회원가입</a> 
				</div>
					
				<div>
					<label for = "login_auto_login" id = "R"></label>
					<a href="adminLogin.jsp"><img src="img/파비콘.jpg" id="image" alt="관라자 로그인"></a>
					<a href="loginFind.jsp" class="btn col-xs-4 btn btn-default" id="loginR">아이디 / 비밀번호 찾기</a> 
				</div>
			</div>
	</form>

<!-- 
<script>
$(document).ready(function() {
    $('form').submit(function(e) {
        var userId = $('#userId').val();
        var userPw = $('#userPw').val();
        if(userId == '#userId' && userPw == '#userPw') {
            e.preventDefault(); 
            alert('정상적으로 처리되었습니다.')
        } else {
	 		alert('아이디 비밀번호가 틀렸습니다~~.')
        }
    });
}); 
</script>
--!>
 
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>
