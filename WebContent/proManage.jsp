<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.sfc.vo.OrderVO"%>
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
  padding-bottom: 0px;
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
#deli {
  margin-top:20px;
}

</style>
</head>
<% 
	List<OrderVO> list =  (List<OrderVO>) request.getAttribute("orderList");  
%>
<body>
    <div class="allMy">
        <div class="leftMy">
            <div class="mymar">
                <h2 class="mar">상품 관리</h2>
            </div>
            <a href="AdminDeli.do"><p id="deli" class="mar deta">배송 관리</p></a>
            <a href="proManage.jsp"><p class="mar deta marP">상품 목록</p></a>
        </div>
        <div class="rigthMy">
            <div>
                <h2 class="mar marRig marH">상품 관리</h2>
            </div>
            <div class="mymar">
                <div class="divH3">
                    <h2 class="mar marRig inl">상품 목록</h2>
                    <p class="inl inlP"></p>
                </div>
            </div>

			
            <table border="1" class="tbl">
                <colgroup>
                    <col width="20%">
                    <col width="150px">
                    <col width="">
                    <col width="150px">
                    <col width="150px">
                </colgroup>
                <thead class="itemJang">
                    <th>번호</th>
                    <th>아이디</th>
                    <th>구매번호</th>
                    <th>구매날짜</th>
                    <th>배송상태</th>
                </thead>
                <% 
                	if(list != null && list.size() > 0){
                		for(int i = 0; i<list.size(); i++){
                			%>
                			<tbody>
			                    <tr class="itemJang">
			                        <td>
			                            <span><%= list.get(i).getBuyDate().substring(0, 11) %></span>
			                        </td>
			                        <td>
			                            <span><%=list.get(i).getBuyNo() %></span>
			                        </td>
			                        <td>
			                        	<form name="form<%=i%>" action="/PalDDack/PrdDetail.do" method="post">
                    						<input type=hidden name="proCode" value="<%=list.get(i).getProCode()%>">
			                           	 	<a href="/PalDDack/PrdDetail.do?proCode=<%=list.get(i).getProCode()%>"><span><%=list.get(i).getProName() %></span></a>
			                             </form>
			                        </td>
			                        <td>
			                            <span><%=list.get(i).getDeliStat() %></span>
			                        </td>
			                        <td>
			                            <span><%=String.format("%,d",list.get(i).getBuyCost()) %></span><span>원</span>
			                        </td>
			                    </tr>
			                </tbody>
                			 <%
                		} // for end
                	} else {
                		%>
                		<tbody>
			                    <tr class="itemJang">
			                        <td></td> 
			                        <td></td>
			                        <td><h2 id="null">주문 내역이 존재하지 않습니다.</h2></td>
			                        <td></td>
			                        <td></td>
			                    </tr>
			                </tbody>
                		 <%
                	}// if end
                %>
            </table>
        </div>
    </div>
    <!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>
</body>
</html>



