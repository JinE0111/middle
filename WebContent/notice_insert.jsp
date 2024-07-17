<%@page import="kr.or.ddit.sfc.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더영역 -->
<%@include file="../include/top.jsp" %>

<style>
body {
    font-family: "Noto Sans KR";     
}
.allMy {
    text-align: center;
    margin-top: 60px;
}
.leftMy {
    display: inline-block;
    width: 10%;
    text-align: left;
    margin-right: 100px;
    background-color: #f8fcfe;
    padding: 20px 50px 20px 20px;
}
.rigthMy {
    display: inline-block;
    width: 60%;
    vertical-align: top;
    margin-left: 10px;
}
.mymar {
    border-bottom: 2px solid #004393;
}
.mar {
    padding-left: 30px;
    text-align: left;
    padding-bottom: 20px;
}
.deta {
    font-size: 18px;
}
.marRig {
    color: #004393;
}
.inl {
    display: inline;
}
.divH3 {
    text-align: left;
    margin-bottom: 20px;
}
.marP {
    padding-top: 30px;
}
.marH {
    margin-bottom: 80px;
}
.cont, .titl {
    text-align: left;
}
.but {
    background-color: #004393;
    color: white;
    float: right;
    height: 30px;
    width: 80px;
    font-size: 15px;
    border: none;
    margin: 3px 3px 3px 3px;
}
.butDiv {
    padding-top: 10px;
}

/*
===========================
*/
.prd_page ul{
    display: inline-block;
}
.prd_page ul li{
    list-style: none;
    display: inline-block;
    margin-top: 10px;
    padding:3px;
    width: 25px;
    height: 25px;
    text-align: center;
    cursor: pointer;
    -webkit-transition: .5s
}
.prd_page ul .prd_active_page{
    background-color:#004393;
    border-radius: 10%;
}
.prd_page ul .prd_active_page a{
    color: white;
}
.prd_page ul li a{
    color:#666666;
    text-decoration: none;
}
.detailAll {
    width: 100%;
    border-bottom: 1px solid #ddd;
}
.detailList {
    display: inline-block;
}
.detPw {
    width: 80%;
    text-align: left;
    padding-left: 15px;
}
.detPwd {
    text-align: left;
    padding-left: 20px;
}
.detailId {
    width: 50px;
    border-right: 1px solid #ddd;
    padding: 20px 60px 20px 20px;
}
.detBot {
    border-bottom: 1px solid #ddd;
}
.con {
    height: 300px;
}
.detDiv {
    width: 50%;
}
.detWir {
    display: inline-block;
    padding-right: 278px;
    text-align: left;
}
.detDate {
    display: inline;
}
.detCo {
    padding-top: 25px;
    width: 90%;
    padding-left: 55px;
    padding-right: 55px;
    border: none;
}
.cancell {
	margin-top: 55px;
	margin-bottom: 55px;
    margin-right: 20px;
    height: 50px;
    width: 260px;
    font-size: 17px;
    color: #004393;
    background-color: white;
    border-color: #004393;
}
.detadmin {
	color: #ddd;
}
.detinput {
	border: none;
	width: 80%;
	padding-left: 18px;
	height: 50px;
}
</style>
</head>
<body>

    <div class="allMy">
        <div class="leftMy">
            <div class="mymar">
                <h2 class="mar">고객센터</h2>
            </div>
            <p class="mar deta marP"><a href="Notice.do">공지사항</a></p>
            <p class="mar deta"><a href="Door.do">문의사항</a></p>
            <p class="mar deta"><a href="company.jsp">회사소개</a></p>
            <br><br>
        </div>
        <div class="rigthMy">
            <div>
                <h2 class="mar marRig marH">공지사항 상세</h2>
            </div>
            <div class="mymar">
            </div>

			<form action="<%=request.getContextPath()%>/NoticeInsert.do" method="post">
	            <div class="detailAll">
	                <div class="detBot">
	                    <span class="detailList detailId">제목</span>
	                    <input type="text" class="detailList detPw detinput" name="title" id="title">
	                </div>
	                <div class="detBot">
	                    <div class="detDiv detWir">
	                        <span class="detailList detailId">작성자</span>
	                        <span class="detailList detPwd detadmin">자동 입력  </span>
	                    </div>
	                    <div class="detDiv detDate">
	                        <span class="detailList detailId">작성일</span>
	                        <span class="detailList detPwd detadmin">자동 입력</span>
	                    </div>
	                </div>
	                <div>
		                <textarea rows="20" cols="140" class="detailList detPw detCo" name="content" id="content"></textarea> 
	                </div>
	            </div>
		        <div>
		            <input type="submit" name="save" id="save" class="cancell" value="저장">
		            <input type="button" name="cancell" id="cancell" onclick="cance()" class="cancell" value="취소">
		        </div>
            </form>
        </div>
    </div>
    
<script>
	function cance() {
		let yn = confirm('글 작성을 취소하시겠습니까?');
		if(yn) {
			window.location.href = '<%=request.getContextPath()%>/Notice.do';
		}
	}
</script>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>