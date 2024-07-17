<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {
    width: 1073px;
    margin: 0 auto;
}
.join_wrap {
	width: 1073px;
}
.rq{
	font-size: 1.1em;
	color:red;
}
h3{
 color: #004393;
 font: bold;
 margin-top:80px;
}
.blue-hr {
 border-top: 2px solid #004393; /* 파란색 실선 */
}
.a{
margin-right: 50px;
}
.b{
display: inline-block;
}
.blue-background {
 background:#ebf6fc;
 color: #333; /* 텍스트 색상을 흰색으로 변경 */
 font-size:1.1em;
}
.col-sm-2{
	width: 12.666667%;
}

#pass{
margin-top: -1px;
margin-left:-1px;
}

#pass2{
margin-top: 5px;
}

.input-group-addon {
    background-color: white; /* 하이픈 배경색 */
    border: none; /* 테두리 제거 */
    padding: 5px 12px; /* 내부 패딩 조정 */
    color: #555; /* 텍스트 색상 */
    text-align: center; /* 텍스트 가운데 정렬 */
    font-size: 14px; /* 폰트 크기 */
  }
#zipcode{
 margin-left: -1px;
}
#zipcode-search{
 margin-top: 0px;
 margin-right:18px;
}
#textbox1{
 margin-right: 100px;
 padding-left: 100px;
}
#emaillist{
 margin-top: -29px;
 margin-left:22px;
}
.btn-wide {
  padding-left: 100px; /* 왼쪽 패딩을 늘립니다 */
  padding-right: 100px; /* 오른쪽 패딩을 늘립니다 */
  height: 50px;
  margin-left: 7px;
}
#address1{
 margin-right: -10px;
}
#box2{
 margin-top: 0px;
 margin-right: -600px;
 text-align: center;
}
.top{
 margin-top:5px;
}
.form-group {
  position:relative;
  left:12px;
}
.form-horizontal .control-label{
 padding-top: 7px;
 margin-bottom: 0;
 text-align:left;
 width:110p
}
#pass2{
 margin-top:1px;
}
#disp{
 margin-left:16px;
}
.control-label{
 padding-top:7px;
 margin-botton:0;
/*  text-align: left; */
 margin-left: 10px
}
.c{
 margin-left: 25px;
}
#name{
 margin-left: 21px;
}
.warning {
    color: red;
 }
#domainSelector {   
 margin-left:-24px;
 width: 120px;
 margin-top:-32px; 
}
#emailLocalPart, #emailDomainPart {
     border-top-left-radius: 5px;
     border-top-right-radius: 5px;
     border-bottom-left-radius: 5px;
     border-bottom-right-radius: 5px;
     margin-top:-31px;
}
#phoenumber{
 margin-left:20px;
 margin-top:7px;
}
.d{
 margin-top:2px;
}

#wow{
 margin-left:20px;
 margin-top:7px;
}
#addrs{
 margin-top:30px;
}
.titleset{
height: 36px;
line-height: 18px;
}
#formot{
margin-left:22px;
}
#box2 {
  text-align: center;
}
</style>
</head>
<body>
<%@include file="../include/top.jsp"%>
	<div class= "container">
		<div class="col-sm-8 join_wrap">
		  <h3><strong>01.로그인정보</strong></h3>
		  	<hr class="blue-hr">
		  <!-- 수평으로 정렬된 폼 요소를 나타내며, POST 메서드를 사용하여 데이터를 서버에 전송하고, 제출 시 valid() 함수를 호출합니다. -->
		  <form class="form-horizontal" method="post" onsubmit="valid()">
		    <label for="id" class="control-label col-sm-2 blue-background titleset" id=formot>&nbsp;회원아이디 </label>     
		    	
		    	<div class="col-sm-2">	
		        	<input type="text" class="form-control a b" id="id" name="memId" placeholder="<%=mv.getMemId() %>" readonly> 
		      	</div>
		      <br><br><br>
		      
		    <div class="form-group">
		      <label for="password" class="control-label col-sm-2 blue-background poss c titleset">&nbsp;비밀번호</label>
		      	<div class="col-sm-3">
		        	<input type="password" class="form-control a b" id="password" name="memPw" placeholder="수정할 비밀번호"
		        	required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}">
		        	<span id="passwordWarning" class="warning">영문 + 숫자 8자리 이상</span>
		      </div>
		    </div>
		  <h3><strong>02.개인정보 </strong></h3>
		  <hr class="blue-hr">
			<div class="form-group">
				<label for="name" class="control-label col-sm-2 blue-background titleset" id="name">&nbsp;이름</label>
					<div class="col-sm-3">
				  		<input type="text" class="form-control a" id="name6" name="memName" placeholder="수정할 이름 입력">
					</div>
					<br><br><hr>
		<div class="form-group">
			<label for="phone1" class="control-label col-sm-2 blue-background top titleset" id="phoenumber">&nbsp;휴대폰번호</label>
			<div class="col-sm-6 top">
			  <div class="input-group">
				<select class="form-control d" id="phone1" name="memTel" >
				  <option value="010">010</option>
				  <option value="011">011</option>
				  <option value="016">013</option>
				  <!-- 추가 옵션들 -->
				</select>
				<span class="input-group-addon">-</span>
				<input type="text" class="form-control d" id="phone2" name="memTel2" placeholder="" style="width: 99px;">
				<span class="input-group-addon" style="position: relative; right:62px">-</span>
				<input type="text" class="form-control d" id="phone3" name="memTel3" placeholder="" style="width: 107px; right:65px">
			  </div>
			</div>
		  </div>
		  <hr>
		  <br>
		  <br>
<div class="form-group y">
    <label for="emailLocalPart" class="control-label col-sm-2 blue-background titleset" id=emaillist>이메일</label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="text" class="form-control f" id="emailLocalPart" name="memEmail" placeholder="">
          <span class="input-group-addon emailLocalPart" id="wow"></span> 
            <input type="text" class="form-control f" id="emailDomainPart" name="memEmail2" placeholder="">
        </div>
    </div>
    <div class="col-sm-2">
        <select class="form-control" id="domainSelector">
            <option value="">직접 입력</option>
            <option value="@gmail.com">@gmail.com</option>
            <option value="@naver.com">@naver.com</option>
            <option value="@daum.net">@daum.net</option>
            <option value="@hotmail.com">@hotmail.com</option>
        </select>
    </div>
</div>
	  <br>
	  <br>
	  <div class="form-group">
		<label for="emailLocalPart" class="control-label col-sm-2 blue-background titleset">&nbsp;기본주소</label>
		<div class="col-sm-3">
			<div class="input-group mb-1">
				<input type="text" class="form-control" id="zipcode" placeholder="우편번호"  name ="memPostNo">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="addrBtn">우편번호 검색</button>
				</span>
		
			</div>
			
		</div>	
		<div class="col-sm-8">
			<!-- 첫 번째 추가 텍스트 박스 -->
			<input type="text" class="form-control mb-1" id="address1" name ="memAddr" placeholder="주소 입력">
			<!-- 두 번째 추가 텍스트 박스 -->
			<input type="text" class="form-control" id="address2" name="memAddrD" placeholder="상세 주소 입력">
			</div>
		</div>
		<br><br><br><br><br><br><br>
	    <div class="row justify-content-center">
            <div class="col-sm-3 text-center">
                <button type="button" class="btn btn-primary btn-wide" id="box1" onclick="check()">확인</button>
				<a href="myPage.jsp" class="btn btn-default btn-wide" id="box2" role="button">취소</a>
            		</div>
				</div>
			</div>
			</form>
		</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function check() {
	
    event.preventDefault();
    
    let formData = $('form').serialize(); // 폼 데이터 직렬화
	console.log(formData);
     
    $.ajax({
        type: 'post',
        url: 'memUpdate.do',
        data: formData, // FormData 객체 전송
        success: function(data) {
            // 성공적으로 데이터를 처리한 후의 로직을 여기에 작성하세요.
            //console.log("rst", rst);
            if(data = 1){
            	let conf = confirm("수정되었습니다")
            	location.href = "myPage.jsp";
            }else{
                alert("수정되지 않았습니다")
            }
        },
   		error: function() {
		   alert("요청 처리중 오류가 발생하였습니다.")
		}

    });
 
}
		
	function validatePassword() {
	  var password = $('#password').val();
	  if(password.length < 8 || !/[a-zA-Z]/.test(password) || !/[0-9]/.test(password)){
	    $('#passwordWarning').text('영문 + 숫자 8자리 이상');
	  } else {
	    $('#passwordWarning').text('');
	  }
	}

	$(document).ready(function(){
	  validatePassword(); // 페이지 로드 시 검사 실행
	  $('#password').on('keyup', validatePassword); // 키 입력 시 검사 실행
	});
	
	document.getElementById('domainSelector').addEventListener('change', function() {
	    var domain = this.value;
	    document.getElementById('emailDomainPart').value = domain;
	});
	
	function valid() { 			// 폼 submit 기능 중지
		event.preventDefault(); // submit 기능 중지
		
		// 입력양식요소 정보 직렬화하기 - jQuery의 serialize() 사용
		let srData = $('form').serialize();
		console.log("직렬화 된 정보 >> ", srData);
		
		// AJAX를 통한 서버 요청
		$.ajax({
			type:'post',
			url:'serialize.jsp',
			data:srData,
			success:function(data){
				
				// 서버 응답 처리
				if(data == 1){
					let conf =confirm("가입성공!!");
					if(conf) location.href = "login.jsp";
					$('#joinspan').text("가입성공!!");
				}
			},
			error:function(err){ 				// 에러 처리
				$('#joinspan').text("가입실패...").css('color','red');
			}
		});
	}

	// 주소 API 실행 함수
	$('#addrBtn').on('click', addrApi);
		
	function addrApi() {
        new daum.Postcode({
            oncomplete: function(data) {
            	let roadAddr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                //document.getElementById("addr1").value = data.jibunAddress;
                document
            }
        }).open();
    }
	
	// 아이디 중복 확인 기능
	//$("#id").on('keyup', function(){
	$('#idChk').on('click', function(){
		
		let userId = $('#id').val();
		userId = userId.trim();
		
		console.log(userId);
		if(userId == '') return;
	
		
	
		//jQuery AJAX(login 중복현황)
		$.ajax({
			type:'post',
			url:'idChk.jsp',
			data:{uId:userId},//'key=vlaue', 객체 형태로 데이터를 전달해도 기본 urlencoded형식 (key=value)으로 전달됨
			success:function(rst){
// 				console.log("응답>>",rst);
				let result = JSON.parse(rst); // 문자열 >> 객체로 변환
				
				let $disp = $('#disp'); // 출력영역
// 				console.log(result.rst);
				
				if(result.rst == "ok"){
					$disp.text(result.msg).css('color','green');
				}else {
					$disp.text(result.msg).css('color','red')
				}
			}, 
			error:function(xhr){
				alert("상태:" + xhr.status)
			}
			//,datatype:''
		})
	});
	
</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>