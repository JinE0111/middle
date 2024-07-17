<%@page import="kr.or.ddit.sfc.vo.DoorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    DoorVO dv = (DoorVO)request.getAttribute("dv");
//  	AdminVO login_admin = (AdminVO)request.getAttribute("login_admin");//관리자 아이디
 	AdminVO login_admin = (AdminVO)session.getAttribute("login_admin");//관리자 아이디
    %>
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
    margin-bottom: 280px;
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
    border-bottom: 1px solid #ddd;
}
.detailList {
    display: inline-block;
}
.detPw {
    width: 80%;
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
.ami {
    margin-top: 17px; 
    height: 180px;
    border: 1px solid #ddd;
    text-align: left;
    padding: 20px 20px 20px 20px;
    margin-bottom: 30px;
    position: absolute;
    width: 1088px
}
.bor {
    font: bold;
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
.detailCon {
	border: none;
}
.answer{
 margin-top: 30px;
   margin-bottom: 55px;
    margin-right: 20px;
    height: 32px;
    width: 86px;
    font-size: 13px;
    color: #004393;
    background-color: white;
    border-color: #004393;
    position: relative;
    left:990px
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
                <h2 class="mar marRig marH">문의사항 상세</h2>
            </div>
            <div class="mymar">
            </div>


            <div class="detailAll">
                <div class="detBot">
                    <span class="detailList detailId">아이디</span>
                    <span class="detailList detPw"><%=dv.getMemId() %></span>
                </div>
                <div class="detBot">
                    <span class="detailList detailId">제목</span>
                    <span class="detailList detPw"><%=dv.getDoorName() %></span>
                </div>
                <div>
                    <span class="detailList detailId con">내용</span>
                    <textarea cols="170" class="detailList detPw detailCon" readonly><%=dv.getDoorCon() %></textarea>
                </div>
            </div>
            <br>
           <div class="listbtn">
           		<a href="<%=request.getContextPath()%>/Door.do">
               <input type="button" name="cancell" id="cancell" class="cancell" value="목록">
               </a>
           </div>            
            

            <div class="ami">
                <span class="bor">답변내용</span> <br><br>
              
				
				<%
				System.out.print("doordetailad>>>>>>>>>>>>>>>>>>>>>>>"+login_admin);
		        if(login_admin != null){//관리자 로그인이 된다면
		        if(dv.getaCon() ==null) { //답변 글이 없는 경우
		        %>
				<form action="<%=request.getContextPath()%>/AdminDoorInsert.do" method="post">
				<textarea rows="7" name = "aCon" class="aCon" cols="150" value=""  ></textarea>
				<input type="hidden" name = "doorCode" class="doorCode" value="<%=dv.getDoorCode() %>" >
				<input type="hidden" name = "adId" class="adId" value="<%=login_admin.getAdId() %>" >
					<div class = "adminbtn">
		        		 <input type="submit" name="answer" id="answer" class="answer" value="답변 작성">
		        	</div>
				</form>
				<%
		        	}else{
				%>
				<span>안녕하세요 <%= dv.getMemId() %> 고객님. <%= dv.getaCon()%></span>
				<%
		        	}
		        }//if ad!=null end
			    
				else if (dv.getaCon() != null) { 
				%>
				   <span>안녕하세요 <%= dv.getMemId() %> 고객님. <%= dv.getaCon()%></span>
				   
				<%    
		
				} 
				%> 
            </div>

            
        </div>
     
    </div>
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>