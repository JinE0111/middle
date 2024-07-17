<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/addrAddPopUp.css">
    <link rel = "stylesheet" type ="text/css" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    .addr_name {
    text-align: center;
    margin: 20px;
}
.post{
    position: relative;
}
.post button{
    position: absolute;
/*     width: 90px; */
/*      height: 40px; */
     top: 0;
     bottom: 0;
     right: 5px;
/*      margin: auto 0; */
     border-radius: 3px;
}
.warp{
    /* background-color: pink; */
    width: 500px;
    margin: auto; 
    
} 
label{
    color: white; /* 텍스트 색상을 흰색으로 변경 */
    background-color: #004393;
    font-size:1em;
    width: 90px;
    height: 28px;
    text-align: left;
    display: inline-block;
    vertical-align: middle;
    border-radius: 5px;
    border: 1px solid #004393;
    text-align: center;
}
input{
     margin: 10px; 
}
.addr_info{
    padding: 20px;
    border: 1px solid black;
    width: 450px;
    height: 350px;
    position: relative;
}
.addr_sel{
    position: absolute;
    bottom: 128px;
    right: 179px;
}
.addName input[type="text"]{
    display: inline-block;
    height: 25px;
    line-height: 25px;
    margin: 5px;
  }
.wid {
  width: 280px;
}
#orderReq {
  width: 200px;
}
.widOrd {
  width: 150px;
}
    
    </style>
    
</head>
<body>
    <div class="warp">
    <div class="addr_name">
        배송지 입력
    </div>

    <form action="./Insert.do" method="post">
    <div class="all">
    <div class="addr_info">
        <div class="addName">
            <label for="orderName" class="blue-background">이름</label>
            <input type="text" class="wid" id="memName" name="memName" placeholder="이름입력" required>
        </div>
        <div class="addName">
            <label for="orderTel" class="blue-background">휴대폰</label>
            <input type="text" class="wid" id="orderTel" name="memTel" placeholder="휴대폰입력" required>
        </div>
        <div class="post">
            <label for="orderPost" class="blue-background">우편번호</label>
            <input type="text" class="widOrd" id="sample4_postcode" name="deliPostNo" placeholder="우편번호" required>
            <input type="button" class="btn btn-outline-primary btn-sm" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
        </div>
        <label for="orderAdd" class="blue-background">배송주소</label>
        <input type="text" class="wid" id="sample4_roadAddress" name="deliAddr" placeholder="도로명주소" required><br>
        <span id="guide" style="color:#999;display:none"></span>
        <label for="orderAddr" class="blue-background">상세주소</label>
        <input type="text" class="wid" id="sample4_detailAddress" name="deliAddrD" placeholder="상세주소" required>
        <div class="addMame">
            <label for="orderReq" class="blue-background">배송메모</label>
            <input type="text" class="wid" id="orderReq" name="deliReq" placeholder="배송메모" required>
        </div>
    </div>
    </div>
<!--     <div class="addr_clo"> -->
<!--         <button type="button" class="btn-close" aria-label="Close"></button> -->
<!--     </div> -->
    <div class="addr_sel">
<!--     		<a href="/AddrAdd.do"> -->
        	<button type="submit" class="btn btn-outline-primary btn-xs ">완료</button>
<!--     		</a> -->
    </div>
	</div>
    </form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
//             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//             if(roadAddr !== ''){
//                 document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//             } else {
//                 document.getElementById("sample4_extraAddress").value = '';
//             }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            
            
            console.log('도착');
        }
    }).open();
}
    
</script>
</body>
</html>