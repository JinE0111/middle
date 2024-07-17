<%@page import="kr.or.ddit.sfc.vo.AddrAddVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더영역  필요없음-->
<%-- <%@include file="../include/top.jsp" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="./reset.css">
<link rel="stylesheet" href="./addrAdd최종.css">
<!--     <link rel = "stylesheet" type ="text/css" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" > -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
<style>
.addr_name {
	text-align: center;
	margin: 30px;
}

.post {
	position: relative;
	margin-top: 4px;
}

.post button {
	position: absolute;
	width: 90px;
	height: 40px;
	top: 0;
	bottom: 0;
	right: 5px;
	margin: auto 0;
	border-radius: 3px;
}

.warp {
	height: 300px;
	width: 500px;
	margin: auto;
}

label {
	color: white; /* 텍스트 색상을 흰색으로 변경 */
	background-color: #004393;
	font-size: 1em;
	width: 90px;
	height: 28px;
	line-height: 28px;
	text-align: left;
	display: inline-block;
	vertical-align: middle;
	border-radius: 5px;
	border: 1px solid #004393;
	text-align: center;
}

input {
/* 	margin: 10px; */
	margin-bottom: 10px;
	margin-left: 6px;
}

.addr_info {
	margin-top: 10px;
	/*     padding-top: 30px; */
	/*     padding-left: 20px; */
	padding: 20px;
	position: relative;
	border: 1px solid black;
	height: 255px;
	width: 420px;
	margin: auto;
}

.addr_clo {
	position: absolute;
	top: 11px;
	right: 12px;
}

.addr_sel {
	position: absolute;
	bottom: 7px;
	right: 19px;
}

.addName input[type="text"] {
	display: inline-block;
/* 	height: 25px; */
/* 	line-height: 25px; */
	margin: 5px;
/* 	width: 194px; */
}

.null {
	display: block;
	text-align: center;
}

.all {
	position: relative;
}

.sbmodal {
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	background-color: blue;
	z-index: 9999;
	display: none;
}
/*  */
.sbSample {
	display: none;
	width: 500px;
	margin: auto;
}

.comp {
	position: absolute;
	bottom: 25px;
	right: 45px;
}

.clo {
	position: absolute;
	bottom: 400px;
	right: 65px;
}

.addradd {
	background-color: #004393;
	color: white;
	margin: 10px 10px 10px 10px;
	height: 30px;
	text-align: center;
}

.deliPostNo {
/* 	height: 25px; */
/* 	width: 194px; */
}

.postNumber {
	color: #004393;
	background-color: white;
	border: 1px solid #004393;
}

.compSum {
	color: white;
	background-color: #004383;
	font-size: 15px;
	width: 50px;
	height: 40px;
	margin-right: 110px;
	margin-bottom: 110px;
}

.cloBut {
	color: black;
	border: none;
	height: 20px;
	width: 20px;
	background-color: white;
	margin-right: 120px;
}
.addraddDiv{
	text-align: center;
}
.marginPadding {
	padding: 20px 20px 20px 20px;
}
.telMargin {
	margin-top:5px;
}
.selbtn {
	border: 4px solid #004393;
	background-color: white;
	margin-right: 120px;
	color: #004393;
}
</style>
</head>
<body>
	<!-- <div class="sbmodal">
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
    <div class="addr_clo">
        <button type="button" class="btn-close" aria-label="Close"></button>
    </div>
    <div class="addr_sel">
    		<a href="/AddrAdd.do">
        	<button type="submit" class="btn btn-outline-primary btn-xs ">완료</button>
    		</a>
    </div>
	</div>
    </form>
</div> -->
	<%
	List<AddrAddVO> addrAddList = (List<AddrAddVO>)request.getAttribute("addrAddList");
%>

	<!--     <div class="warp">
    <div class="addr_name">
        배송지 목록
    </div>
    <div>
            <div class="d-grid gap-2 col-6 mx-auto">
                <button id="addrBtn" type="button" class="btn btn-outline-secondary" onclick="fn_pop()">+ 배송지 신규입력</button>
            </div>
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
	    <div class="addr_clo">
	        <button type="button" class="btn-close" aria-label="Close"></button>
	    </div>
		<div class="addr_sel">
	    		<a href="/AddrAdd.do">
				<button type="submit" class="btn btn-outline-primary btn-xs ">완료</button>
	    		</a>
		</div>
		</div>
		</form> -->
	<div class="addraddDiv">
		<button class="insert_btn d-grid gap-2 col-6 mx-auto addradd"
			onclick="f_add()">+신규 배송지 입력하기</button>
	</div>
	<div class="sbSample">
		<form action="./AddrAdd/Insert.do" method="post">
			<div class="addr_name">배송지 입력</div>
			<div class="addr_info">
				<label for="orderName">이름</label> <input type="text" class="wid"
					id="memName" name="memName" placeholder="이름입력" required> <br>
				<label for="orderTel" class="blue-background">휴대폰</label> <input
					type="text" class="wid" id="orderTel" name="memTel"
					placeholder="휴대폰입력" required><br>
				<div class="post">
					<label for="orderPost" class="blue-background">우편번호</label> <input
						type="text" class="widOrd" id="sample4_postcode" name="deliPostNo"
						placeholder="우편번호" required> <input type="button"
						class="btn btn-outline-primary btn-sm postNumber"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				</div>
				<label for="orderAdd" class="blue-background">배송주소</label> <input
					type="text" class="wid" id="sample4_roadAddress" name="deliAddr"
					placeholder="도로명주소" required><br> <span id="guide"
					style="color: #999; display: none"></span> <label for="orderAddr"
					class="blue-background">상세주소</label> <input type="text" class="wid"
					id="sample4_detailAddress" name="deliAddrD" placeholder="상세주소"
					required><br>
				<div class="addMame">
					<label sblabel for="orderReq" class="blue-background">배송메모</label>
					<input type="text" class="wid" id="orderReq" name="deliReq"
						placeholder="배송메모" required><br>
				</div>
			</div>
			<!-- addr_info end -->

			<div class="addr_insert_sel_list">
				<div class="comp">
					<button type="submit" compbtn
						class="btn btn-outline-primary btn-xs sel_comp compSum" onclick="">완료</button>
				</div>
				<div class="clo">
					<button type="button" clobtn class="btn_close cloBut"
						aria-label="Close" onclick="f_clo()">X</button>
				</div>
			</div>
			<!-- addr_insert_sel_list end -->

		</form>
	</div>
	<!-- sbSample end -->
	<%
		int cnt = 0;
	if(addrAddList.size() >0 && addrAddList != null){
		for(AddrAddVO AV : addrAddList){
			cnt++;
		
%>
	<div class="marginPadding"></div>
	<form action="/AddrAdd/AddrAddSet.do" method="post">

		<div class="all">
			<input type="hidden" id="addCode" class="addCode" name="addCode"
				value="<%=AV.getDeliCode()%>">
			<div class="addr_info">
				<div class="addName">
					<label for="orderName" class="blue-background">이름</label> <input
						type="text" class="memName" id="orderName" name="memName"
						placeholder="이름입력" value="<%=AV.getMemName() %>">
				</div>
				<div class="addName telMargin">
					<label for="orderTel" class="blue-background">휴대폰</label> <input
						type="text" id="orderTel" class="memTel" name="memTel"
						placeholder="휴대폰입력" value="<%=AV.getMemTel() %>">
				</div>
				<div class="post">
					<label for="orderPost" class="blue-background">우편번호</label> <input
						type="text" id="sample4_postcode" class="deliPostNo"
						name="deliPostNo" placeholder="우편번호"
						value="<%=AV.getDeliPostNo()%>">
					<!--             <input type="button" class="btn btn-outline-primary btn-sm" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> -->
				</div>
				<label for="orderAdd" class="blue-background">배송주소</label> <input
					type="text" id="sample4_roadAddress" class="deliAddr"
					name="deliAddr" placeholder="도로명주소" value="<%=AV.getDeliAddr() %>"><br>
				<span id="guide" style="color: #999; display: none"></span> <label
					for="orderAddr" class="blue-background">상세주소</label> <input
					type="text" id="sample4_detailAddress" class="deliAddrD"
					name="deliAddrD" placeholder="상세주소" value="<%=AV.getDeliAddrD() %>">
				<div class="addMame">
					<label for="orderReq" class="blue-background">배송메모</label> <input
						type="text" id="orderReq" class="deliReq" name="deliReq"
						placeholder="배송메모" value="<%=AV.getDeliReq() %>">
				</div>
				<input type="hidden" id="orderReq" class="deliReq" name="deliId"
					placeholder="아이디" value="<%=AV.getDeliId() %>">
			</div>

			<div class="addr_clo">
				<a href="AddrAdd/Delete.do?deliCode=<%=AV.getDeliCode()%>">
					<button type="button" class="btn-close cloBut" aria-label="Close">X</button>
				</a>
			</div>
			<div class="addr_sel">
				<button type="button" class="btn btn-outline-primary selbtn"
					onclick="fn_click(this)">선택</button>
				<!--         </a> -->
			</div>
			<input type="hidden" class="cnt" value="<%=cnt%>">
	</form>
	</div>
	<%
		}
%>
	</div>
	<%
	}else{
%>
	<div class="null">
		<h4>존재하지 않습니다.</h4>
	</div>
	<%
	}
%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	const sbSample = document.querySelector(".sbSample");
	const sbDisp = document.querySelector(".disp");
	const selList = document.querySelector(".addr_sel_list");
	function f_add(){
	    sbSample.style.display="block"; 
	}
	function f_clo(){
	    sbSample.style.display="none";
	    // addr_sel_list.style.display="block";
	
	}
    const sbModal = document.querySelector(".sbmodal");
    //지도 api 필요없어서 삭제함
    function fn_pop(){
    	sbModal.style.display="block";
<%--         //window.open("<%=request.getContextPath()%>/AddrAdd/Insert.do", "배송지추가", "width=650, height=480, left=100, top=50"); --%>
    }
    
    let btn = document.querySelectorAll(".btn");
    let cnt = document.querySelectorAll('.cnt');

    let deliCode = document.querySelectorAll(".addCode")
	let memName = document.querySelectorAll(".memName");    	
    let memTel = document.querySelectorAll(".memTel");    	
	let deliPostNo = document.querySelectorAll(".deliPostNo");
	let deliAddr = document.querySelectorAll(".deliAddr");
	let deliAddrD = document.querySelectorAll(".deliAddrD");
	let deliReq = document.querySelectorAll(".deliReq");
    
	let selMemName = "";
	let selmemTel = "";
	let seldeliPostNo = "";
	let seldeliAddr = "";
	let seldeliAddrD = "";
	let seldeliReq = "";
	
    function fn_click(pThis){
		console.log(pThis.parentElement.parentElement.parentElement);
		let selForm = pThis.parentElement.parentElement.parentElement;
		console.log(selForm.addCode.value);
		console.log(selForm.memName.value);
		console.log(selForm.memTel.value)
		console.log(selForm.deliPostNo.value)
		console.log(selForm.deliAddr.value)
		console.log(selForm.deliAddrD.value)
		console.log(selForm.deliReq.value)

		opener.document.querySelector("#addCode").value =selForm.addCode.value;
		opener.document.querySelector("#orderName").value=selForm.memName.value;
		opener.document.querySelector("#orderTel").value=selForm.memTel.value;
		console.log(opener.document);

		let chk = opener.document.querySelector("#orderPost");
		if(!chk){
			console.log("수빈이상:",opener.opener.document.querySelector("#orderPost"));
		}

		console.log("체킁>>>>>>>>>>>",opener.document.querySelector("#orderPost"));
		console.log("체킁>>>>>>>>>>",selForm)
		console.log("체킁>>>>>>>>>>",selForm.deliPostNo)
		opener.document.querySelector("#orderPost").value=selForm.deliPostNo.value;
		opener.document.querySelector("#orderAdd").value=selForm.deliAddr.value;
		opener.document.querySelector("#orderAddr").value=selForm.deliAddrD.value;
		opener.document.querySelector("#orderReq").value=selForm.deliReq.value;


		window.close();
	}
    
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
//                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//                 if(roadAddr !== ''){
//                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//                 } else {
//                     document.getElementById("sample4_extraAddress").value = '';
//                 }

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