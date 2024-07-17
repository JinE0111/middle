<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>

<style>
 .container {
    width: 100%;
    overflow: auto;
  }
  .find-section {
    float: left; /* 왼쪽 또는 오른쪽으로 부동 배치 */
    width: 50%; /* 부모 컨테이너의 50% 너비 */
    box-sizing: border-box; /* 패딩을 포함한 너비 계산 */
    padding: 20px;
    border: 1px;
  }
  .find-section label {
    display: inline-block;
    margin-bottom: 10px;
  }
  .find-section input[type="text"],
  .find-section select {
    width: 30%; /* 너비를 50%로 줄임 */
    margin-bottom: 10px;
  }
  .find-section button {
    display: inline-block;
   /*  color: #004393; */
  }
  #email1s{
  margin-left:10px;
  margin-top:10px;
 }
.blue-hr {
 border-top: 2px solid #004393; /* 파란색 실선 */
}
 #name1s{
  margin-left:42px;
  margin-top:-11px;
 }
 #buttons{
 margin-top:10px;
 margin-left:125px;
 }
h2{
 color:#004393;
 font:bold;
 }
 #names{
    margin-left: 25px;
 }
 #ids{
    margin-left: 22px;
 }
#emails{
    margin-left: 22px;
}
#button2{
    margin-left:146px;
    margin-top:12px;
}
#name{
    margin-left:28px;
    margin-top:11px;
}
#phon{
 margin-left:19px;
}
#phone1s{
 margin-left: 10px;
 margin-top: -6px;	
}
#buttons1{
 margin-left: 129px;
 margin-top: 22px;
}
#ides2{
 margin-left: 16px;
}
#idess2{
 margin-left: 11px;
 margin-top:3px;
}
#namess{
 margin-left: 30px;
  margin-top:-9px;
}
#name2{
 margin-left: 10px;
}
#emails{
 margin-left: 20px;
}
#email2{
 margin-left: 7px;
}
#buttons2{
 margin-left: 122px;
 margin-top: 11px;
}
</style>
</head>
<body>
<%@include file="../include/top.jsp"%>
<div class="container">
  <div class="find-section" id="find-id">
    <h2>아이디 찾기</h2>
    <hr class="blue-hr">
    <form class="form-horizontal" method="post" onsubmit="valid();">
    
      <div class="form-group">
        <label for="id" id=name>이름</label>
        <input type="text" id=names name="memName" placeholder="이름">
      </div>
      
      <div class="form-group">
        <label for="phone" id=phon>전화번호</label>
        <input type="text" id="phone1s" name="memTel" placeholder="000-0000-0000">
        <br>
        <button type="submit" class="btn btn-primary" id="buttons1">확인</button>
      </div>
    </form>
  </div>
  
  <div class="find-section" id="find-password">
    <h2>비밀번호 찾기</h2>
    <hr class="blue-hr">
		<form class="form-horizontal form2" method="post" onsubmit="vaid();"> 
      <div class="form-group">
        <label for="id" id="ides2">아이디</label>
        <input type="text" id="idess2" name="memId" placeholder="아이디">
      </div>
      
      <div class="form-group">
        <label for="name" id="namess">이름</label>
        <input type="text" id="name2" name="memName" placeholder="이름">
      </div>
      
      <div class="form-group">
        <label for="email" id="emails">이메일</label>
        <input type="text" id="email2" name="memEmail" placeholder="">
        <br>
        <button type="submit" class="btn btn-primary" id=buttons2>확인</button>
      </div>
    </form>
  </div>
</div>
<script>
	
function valid() {
	
	event.preventDefault();
	
    let formData = $('form').serialize(); // 폼 데이터 직렬화
    console.log(formData);
    
    
    $.ajax({
        type:'POST',
        url:'serialize.jsp', // 수정된 서버 사이드 스크립트의 URL
        data: formData,
        success: function(response) {
            if(response != "" && response != "error") {
                alert("찾은 아이디: " + response);
           //     location.href = "login.do"; // 로그인 페이지로 리다이렉션
     /*        } else if(response == "fail") {
                alert("일치하는 사용자 정보가 없습니다."); */
            } else {
                alert("일치하는 사용자 정보가 없습니다.");
            }
        },
        error: function() {
            alert("요청 처리 중 오류가 발생했습니다.");
        }
    });
}



function vaid() {
	

	event.preventDefault();
	
    let formData = $('.form2').serialize(); // 폼 데이터 직렬화
    console.log(formData);
    
    
    $.ajax({
        type: 'POST',
        url: 'SearchPw.jsp', // 수정된 서버 사이드 스크립트의 URL
        data: formData,
        success: function(response) {
            if(response != "" && response != "error") {
                alert("찾은 비밀번호: " + response);
//                location.href = "login.do"; // 로그인 페이지로 리다이렉션
                location.href = "loginFind.jsp"; // 로그인 페이지로 리다이렉션
            } else if(response == "fail") {
                alert("일치하는 사용자 정보가 없습니다."); 
            } else {
                alert("일치하는 사용자 정보가 없습니다.");
            }
        },
        error: function() {
            alert("요청 처리 중 오류가 발생했습니다.");
        }
    });

	
} 


</script>
</body>
</html>
<!-- 	  <form class="form-horizontal" method="post" onsubmit="return valid();">  -->

