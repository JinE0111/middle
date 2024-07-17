<%@page import="kr.or.ddit.sfc.vo.NoticeVO"%>
<%@page import="java.util.List"%>
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
    padding-bottom: 210px;
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
.inlP {
  color: #666;
  font-size: 16px;
  padding-left: 15px;
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
  border-left: 0px;
  border-right: 0px;
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
.backg {
    background-color: #f8fcfe;
}
.writer{
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
    left:540px;
}
</style>
</head>
<body>
  <div class="allMy">
      <div class="leftMy">
          <div class="mymar">
              <h2 class="mar">고객센터</h2>
          </div>
          <p class="mar deta marP"><a href="#">공지사항</a></p>
          <p class="mar deta"><a href="Door.do">문의사항</a></p>
          <p class="mar deta"><a href="company.jsp">회사소개</a></p>
          <br><br>
      </div>
      <div class="rigthMy">
          <div>
              <h2 class="mar marRig marH">공지사항</h2>
          </div>
          <div class="mymar">
          </div>


          <table border="1" class="tbl">
              <colgroup>
                  <col width="10%">
                  <col width="">
                  <col width="150px">
                  <col width="150px">
              </colgroup>
              <thead class="itemJang backg">
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일자</th>
              </thead>
              <tbody>
              <%
                 List<NoticeVO> nv = (List<NoticeVO>)request.getAttribute("noList");
                 System.out.println("nv >> " + nv);
                 for(int i=0; i<nv.size(); i++) {
              %>
                  <tr class="itemJang">
                      <td>
                          <span><%=nv.get(i).getNoticeNo()%></span>
                      </td>
                      <td>
                          <span><a href="NoticeDetail.do?noticeNo=<%=nv.get(i).getNoticeNo()%>"><%=nv.get(i).getNoticeName()%></a></span>
                      </td>
                      <td>
                          <span><%=nv.get(i).getAdId()%></span>
                      </td>
                      <td>
                          <span><%=nv.get(i).getNoticeDate()%></span>
                      </td>
                  </tr>
              <%
                 }
              %>
              </tbody>
          </table>
          <%
             AdminVO ad = (AdminVO)request.getSession().getAttribute("admin");
             System.out.println("ad >>> " + ad);
             
             if(ad != null) {
          	
          %>
          <div>
			<input type="button" name="writer" id="writer" class="writer" onclick="wri()" value="글쓰기">
				<input type="button" name="writer" id="writer" class="writer" onclick="wri()" value="글쓰기">
									<input type="button" name="writer" id="writer" class="writer" onclick="wri()" value="멜렁">
					
          </div>
          
          <%} %>
          <!-- 이거마즘? -->
      </div>

  </div>
<script>
	function wri() {
		window.location.href="<%=request.getContextPath()%>/notice_insert.jsp";
	}

</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>