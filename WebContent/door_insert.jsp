<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더영역 -->
<%@include file="../include/top.jsp" %>
<%
MemberVO memVo = (MemberVO) request.getSession().getAttribute("login_user");

%>

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
/* .itemJang, th, td  {
    border: 1px solid #ddd;
    border-left: 0px;
    border-right: 0px;
    border-top: 0px;
} */
/* .tbl {
    border-collapse: collapse;
    border: 1px solid #ddd;
    border-left: 0px;
    border-right: 0px;
    border-top: 0px;
    padding-top: 30px;
    width: 100%;
} */
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
}
.detailList {
    display: inline-block;
}
.detPw {
    width: 80%;
    text-align: left;
    padding-left: 20px;
    border: none;
    height: 50px;
}
.detailId {
    width: 50px;
    border-right: 1px solid #ddd;
    padding: 20px 60px 20px 20px;
}
.detBot {
    border-bottom: 1px solid #ddd;
}
.ami {
    margin-top: 50px;
    height: 150px;
    border: 1px solid #ddd;
    text-align: left;
    padding: 20px 20px 20px 20px;
}
.bor {
    font: bold;
}
.texta {
    display: inline-block;
    width: 80%;
    text-align: left;
    padding-left: 20px;
    border: none;
/*     padding-top: 20px */
    /* height: 300px; */
}
.con {
    height: 300px;
}
.cancell {
    margin-right: 20px;
    height: 50px;
    width: 260px;
    font-size: 17px;
    color: #004393;
    background-color: white;
    border-color: #004393;
}
.comp {
    height: 50px;
    width: 260px;
    background-color: #004393;
    border: none;
    color: white;
    font-size: 17px;
}
.detB {
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
    <div class="allMy">
        <div class="leftMy">
            <div class="mymar">
                <h2 class="mar">고객센터</h2>
            </div>
            <a href="<%=request.getContextPath()%>/Notice.do">
            <p class="mar deta marP">공지사항</p>
            </a>
           <a href="<%=request.getContextPath()%>/Door.do">
            <p class="mar deta">문의사항</p>
            </a>
            <a href="<%=request.getContextPath()%>/company.jsp">
            <p class="mar deta">회사소개</p>
            </a>
            <br><br>
        </div>
        <div class="rigthMy">
            <div>
                <h2 class="mar marRig marH">문의사항 작성</h2>
            </div>
            <div class="mymar">
            </div>
			
			<form action="./DoorInsert.do"method="post">
            <div class="detailAll">
                <div class="detBot"> 
                    <span class="detailList detailId">아이디</span>
                    <input type="text" name = "memId" class="detailList detPw" value="<%=memVo.getMemId()%>" readonly>
                </div>
                <div class="detBot">
                    <span class="detailList detailId">제목</span>
                    <input type="text" name = "doorName" class="detailList detPw" required>
                </div>
                <div class="detB">
                    <span class="detailList detailId con">내용</span>
                    <textarea cols="140" name = "doorCon" class="texta" required>
                    </textarea>
                </div>
                
                <br>
	            <div>
	                <input type="submit" name="comp" id="comp" class="comp" value="작성완료">
	                <a href="<%=request.getContextPath()%>/Door.do">
	                <input type="button" name="cancell" id="cancell" class="cancell" value="취소">
	                </a>
	            </div>
            </div>
            </form>
            <br>
        </div>

    </div>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>