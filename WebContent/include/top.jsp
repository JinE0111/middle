<%@page import="kr.or.ddit.sfc.vo.AdminVO"%>
<%@page import="kr.or.ddit.sfc.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/prd_list.css">
    <link rel="stylesheet" href="./css/event.css">
    <link rel="stylesheet" href="./css/jjim.css">
<!--     <link rel="stylesheet" href="./css/addrAdd.css"> -->
    <link rel="stylesheet" href="./css/prd_detail.css">
    <link rel="stylesheet" href="./css/admin_member.css">
    <link rel="icon" href="/PalDDack/img/파비콘.jpg" type="image/x-icon">

    <title>PalDDack</title>
<style>
li{
    list-style: none;
}
a{
    text-decoration: none;
}
.header {
  border-bottom: 1px solid #E0E0E0;
} 

.header_detail {
  width: 1073px;
  height: 150px;
  margin: auto;
  /* background-color: gray; */
  /* border: 1px solid black; */
}
.header_detail img {
  width: 143px;
  margin: auto;
  display: block;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
  margin-top: 21px;
}
.header_detail .logout_li {
  font-size: 14px;
  float: left;
  margin-left: 20px;
  list-style: none;
  position: relative;
  left: 65%;
  color: navy;
  font-weight: 600;
  margin-top: 15px;
}
.header_detail .login_li {
  font-size: 14px;
  float: left;
  margin-left: 20px;
  list-style: none;
  position: relative;
  left: 73%;
  color: navy;
  font-weight: 600;
  margin-top: 15px;
}
.category  ul li{
  font-size: 20px;
  display: inline-block;
  padding: 19px;
  color: #004393;
  font-weight: 600;
  cursor: pointer; 
}
.category {
  width: 1073px;
  margin: 15px auto;
}
.category ul{
  display: flex;
  justify-content: space-between;
}

.allList {
  width: 23px;
  height: 23px;
  vertical-align: -3px;
}
.search {
  position: relative;
  width: 300px;
}
.search input {
  width: 68%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 8px 8px;
  font-size: 12px;
  position: relative;
  left: 814px;
  top: 20px;
}
.search img {
  position : relative;
  width: 25px;
  top: -10px;
  left: 1060px;
  margin: 0;
}
.jjim, .cart {
  width: 35px;
/*   left: 600px; */
/*   margin-bottom:10px; */
}
a:link {
  text-decoration: none;
  color: black;
}
a:visited, a:active {
  color: black;
}
.menu {
  width: 80px;
  left: 17px;
  padding-left: 0;
  margin-top:10px;
}
.menu > a {
  color: #004393
}
.foot {
    background-color: #f8fcfe;
    text-align: center;
    padding: 10px 10px 30px 10px;
    margin-top: 50px;
}
.fon {
    font-size: 13px;
}
#searchButton {
  cursor: pointer;
}
</style>
</head>
<body>
<%
   	MemberVO mv = (MemberVO)session.getAttribute("login_user");
 	AdminVO admin = (AdminVO)session.getAttribute("login_admin");
 	if(mv == null){
%>   
  <div class="header">
    <div class="header_detail">
      <a href="/PalDDack/Main.do"><img src="<%=request.getContextPath()%>/img/로고후보6.jpg"></a>
      <ul>
      <%
      	if(admin != null){
      %>
        <li class="login_li"><a href="AdminMember.do">회원목록</a></li>
        <li class="login_li"><a href="AdminDeli.do">상품관리</a></li>
        <li class="login_li"><a href="Notice.do">고객센터</a></li>
        <li class="login_li"><a href="AdminLogout">로그아웃</a></li>
      <%
      	} else {
      %>
      	<li class="login_li"><a href="/PalDDack/login.do">로그인</a></li>
        <li class="login_li"><a href="join.jsp">회원가입</a></li>
        <li class="login_li"><a href="login.do">마이페이지</a></li>
        <li class="login_li"><a href="Notice.do">고객센터</a></li>
      <%
       	}
      %>
      </ul>
     <form method="post" action="Search.do" id="searchForm">
         <div class="search">
           <input type="text" name="searchName" placeholder="검색어 입력">
           <img src="<%=request.getContextPath()%>/img/search.png" id="searchButton">
         </div>
      </form>
    </div>
    <div class="category">
      <form id="category_form"  action="/PalDDack/PrdList.do" method="post">
	  <input type="hidden" name="category" value="">
      <ul>
        <li onclick="fn_cg(this)">생선</li>
        <li onclick="fn_cg(this)">패류</li>
        <li onclick="fn_cg(this)">연체/갑각류</li>
        <li onclick="fn_cg(this)">건어물</li>
        <li onclick="fn_cg(this)">해조류</li>
        <li onclick="fn_cg(this)">젓갈/액젓</li>
        <li onclick="fn_cg(this)">수산가공식품</li>
        <li>
           <a href="Event.do">제철수산물</a>
        </li>
        <%
      	if(admin == null){
      	%>
        <li>
           <a href="login.do">
              <img src="<%=request.getContextPath()%>/img/cart.png" class="cart">
           </a>
        </li>
        <li>
           <a href="login.do">
                <img src="<%=request.getContextPath()%>/img/jjim_img1.png" class="jjim">
             </a>
        </li>
        <%
      	}
       %>
      </ul>
      </form>
    </div>
  </div>
<%
   }else{
%>

 <div class="header">
    <div class="header_detail">
      <a href="/PalDDack/Main.do"><img src="<%=request.getContextPath()%>/img/로고후보6.jpg"></a>
      <ul>
      	<li class="logout_li"><%=mv.getMemName() %>&nbsp;님 환영합니다</li>
      	
        <li class="logout_li"><a href="/PalDDack/Logout" id="logout">로그아웃</a></li>
        <li class="logout_li"><a href="./MyOrder.do?memId=<%=mv.getMemId()%>">마이페이지</a></li>
        <li class="logout_li"><a href="Notice.do">고객센터</a></li>
      </ul>
      <form method="post" action="Search.do" id="searchForm">
         <div class="search">
           <input type="text" name="searchName" placeholder="검색어 입력">
           <img src="<%=request.getContextPath()%>/img/search.png" id="searchButton">
         </div>
      </form>
    </div>
   
    <div class="category">
    <form id="category_form"  action="/PalDDack/PrdList.do" method="post">
	  <input type="hidden" name="category" value="">
      <ul>
        <li onclick="fn_cg(this)">생선</li>
        <li onclick="fn_cg(this)">패류</li>
        <li onclick="fn_cg(this)">연체/갑각류</li>
        <li onclick="fn_cg(this)">건어물</li>
        <li onclick="fn_cg(this)">해조류</li>
        <li onclick="fn_cg(this)">젓갈/액젓</li>
        <li onclick="fn_cg(this)">수산가공식품</li>
        <li>
           <a href="Event.do">제철수산물</a>
        </li>
        <li>
        	<a href="Cart.do?memId=<%=mv.getMemId()%>">
        		<img src="<%=request.getContextPath()%>/img/cart.png" class="cart">
        	</a>
        </li>
        <li>
           <a href="Jjim.do?memId=<%=mv.getMemId()%>">
              <img src="<%=request.getContextPath()%>/img/jjim_img1.png" class="jjim">
           </a>
        </li>
      </ul>
      </form>
    </div>
  </div>
  
<%
   }
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
    $('#logout').click(function(e) {
        // 기본 링크 동작을 방지
        e.preventDefault();

        // confirm 대화상자 표시
        if (confirm('정말로 로그아웃하시겠습니까?')) {
            // AJAX 요청으로 로그아웃 처리
            $.ajax({
                url: '/PalDDack/Logout', // 로그아웃 처리 URL
                type: 'GET', // 또는 POST, 서버 구현에 따라 달라질 수 있음
                success: function(response) {
                    // 성공적으로 로그아웃되면 실행될 코드
                    alert('로그아웃되었습니다.');
                    // 로그아웃 후 필요한 추가 동작, 예를 들어 페이지 리로드 또는 리다이렉트
                    window.location.href = 'Main.do'; // 예시 URL
                },
                error: function() {
                    // 로그아웃 실패 시 실행될 코드
                    alert('로그아웃에 실패했습니다.');
                }
            });
        }
    });
	//   이미지를 눌렀을 때 폼 제출
    document.querySelector("#searchButton").addEventListener("click", function() {
        document.querySelector("#searchForm").submit();
    });
});

//   let menu = document.querySelector('.menu');
  function fn_cg(arg1){
	let category_val = arg1.innerText;
	console.log(category_val);
	$('input[name=category]').val(category_val);
	$('#category_form').submit();
  }

</script>