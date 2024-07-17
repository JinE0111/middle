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
</style>
<%@include file="./include/top.jsp" %>
    <h3 class="title">비밀번호 확인</h3>
        <div class="container-fluid">
            <div class="col-xs-12">
                <input id="userPw" name="memPw" type="password" class="form-control a" placeholder="비밀번호 확인">
                <br>
                <button type="button" onclick="confirmSubmit()" class="btn btn-primary">확인</button>
            </div>
        </div>

<script>
function confirmSubmit() {
    let confirmAction = confirm("회원 탈퇴를 진행하시겠습니까? 이 작업은 되돌릴 수 없습니다.");
    let memPw = document.getElementById('userPw').value;
    console.log(memPw);
    if (confirmAction) {
        alert("회원탈퇴가 완료되었습니다.");
        window.location.href = "<%=request.getContextPath()%>/MemDelete.do?memPw=" + memPw;
    } else {
        return false;
    }
}
</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>