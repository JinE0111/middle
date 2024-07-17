<%@page import="kr.or.ddit.sfc.vo.DoorVO"%>
<%@page import="kr.or.ddit.sfc.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더영역 -->
<%@include file="../include/top.jsp" %>
<%
	List<DoorVO> list = (List<DoorVO>)request.getAttribute("list"); //door.java 정보 가져옴
	MemberVO memberVO = (MemberVO)request.getAttribute("mv"); //아이디 정보
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
.itemJang, th, td  {
  border: 1px solid #ddd;
  border-left: 0px;
  border-right: 0px;
  border-top: 0px;
}
.tbl {
  border-collapse: collapse;
  border: 1px solid #ddd;
  /* border-left: 0px;
  border-right: 0px; */
  border-top: 0px;
  padding-top: 30px;
  width: 100%;
}
.marP {
  padding-top: 30px;
}
.marH {
  margin-bottom: 80px;
}
.the {
  background-color: #f8fcfe;
  color: #004393;
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
.prd_page ul li:hover{
    color: white;
    background-color: #b8d2f1;
    border-radius: 10%;
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
</style>
</head>
<body>
  <div class="allMy">
      <div class="leftMy">
          <div class="mymar">
              <h2 class="mar">고객센터</h2>
          </div>
          <a href="Notice.do">
          <p class="mar deta marP">공지사항</p>
           </a>
          <a href="Door.do">
          <p class="mar deta">문의사항</p>
          </a>
           <a href="<%=request.getContextPath()%>/company.jsp">
          <p class="mar deta">회사소개</p>
           </a>
          <br><br>
      </div>
      <div class="rigthMy">
          <div>
              <h2 class="mar marRig marH">문의사항</h2>
          </div>
          <div class="mymar">
              <div class="divH3">
                  <h2 class="mar marRig inl">문의</h2>
              </div>
          </div>


          <table border="1" class="tbl">
              <colgroup>
                <col width="80px">
                <col width="80px">
                <col width="90px">
                <col width="30%">
                <col width="">
                <col width="10%">
              </colgroup>
              <thead class="itemJang the">
                  <th>답변여부</th>
                  <th>번호</th>
                  <th>아이디</th>
                  <th>제목</th>
                  <th>내용</th>
                  <th>작성날짜</th>
              </thead>
               <%
               int cnt=0;
               int titleStr = 0;
               int titleEnd = 16;
               int conStr = 0;
               int conEnd = 20;
				if(list.size() >0 && list != null){
					for(DoorVO DV : list){  
						cnt++;
%>
              <tbody>
                  <tr class="itemJang">
                      <td>
                          <span><%=DV.getDoorYn()%></span>
                      </td>
                      <td>
                          <span><%=cnt%></span>
                      </td>
                      <td>
                          <span><%=DV.getMemId()%></span>
                      </td>
                      <td class="titl">
<!--                       request.getContextPath() -> 프로젝트 제일 상단 -->
                      <a href="<%=request.getContextPath()%>/DoorDetail.do?memId=<%=DV.getMemId()%>&doorCode=<%=DV.getDoorCode()%>">
                          <span><%=DV.getDoorName()%></span>
<%--                           <span><%=DV.getDoorName().substring(titleStr, titleEnd)%>...</span> --%>
                        </a>
                      </td>
                      <td class="cont">
                          <span><%=DV.getDoorCon().substring(conStr, conEnd)%>...</span>
                      </td>
                      <td>
                          <span><%=DV.getDoorWriDate()%></span>
                      </td>
                  </tr>
                  <%
					}
				}else{
                  %>
                  작성된 문의글이 없습니다.
                  <%
				}
                  %>
              </tbody>
          </table>

          <div>
            <div class="butDiv">
           <%
            if(memberVO != null){
            %>
            <a href="<%=request.getContextPath() %>/Door/DoorInsert.do">
                <input type="button" value="작성하기" class="but">
            </a>
           <%
            }else{
            %>
            
            <%
            }
            %>
            </div>
            <div>
            <!-- 리뷰의 페이징 영역, 상품리스트 페이징과 동일 css 적용 -->
<!--            페이지 영역시작
            <div class="prd_page">
                <ul>
                    <li class="prd_pre_page">
                        <a href="#">&lt</a>
                    </li>
                </ul>
                <ul class="pagination">
                    <li class="prd_active_page" value="">
                        <a href="#">1</a>
                    </li>
                    <li value="2">
                        <a href="#">2</a>
                    </li>
                    <li value="3">
                        <a href="#">3</a>
                    </li>
                </ul>
                <ul>
                    <li class="prd_next_page">
                        <a href="#">&gt</a>
                    </li>
                </ul>
            </div>
            페이지영역 끝-->
<!--             복사한 페이지 영역 -->
            
<!--             붙여넣기 한 페이지 영역끝 -->

            </div>
          </div>

      </div>

  </div>
  
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>