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
    margin-bottom: 100px;
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
</style>
</head>
<% 
	List<OrderVO> list =  (List<OrderVO>) request.getAttribute("orderList");  
%>
<body>
    <div class="allMy">
        <div class="leftMy">
            <div class="mymar">
                <h2 class="mar">마이페이지</h2>
            </div>
            <a href="./MyOrder.do?memId=<%=mv.getMemId() %>"><p class="mar deta marP">주문내역</p></a>
            <a href="#"><p class="mar deta">상품 후기</p></a>
            <a href="./Cart.do"><p class="mar deta">장바구니</p></a>
            <br><br>
            
            <a href="./memPwChk.jsp"><p class="mar deta">회원 정보 수정</p></a>
            <a href="./myPagememberDelete.jsp"><p class="mar deta">회원 탈퇴</p></a>
        </div>
        <div class="rigthMy">
            <div>
                <h2 class="mar marRig marH">마이페이지</h2>
            </div>
            <div class="mymar">
                <div class="divH3">
                    <h2 class="mar marRig inl">주문내역</h2>
                    <p class="inl inlP">아래의 제품명을 클릭하시면 제품 상세 페이지로 이동합니다.</p>
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
                    <th>주문일</th>
                    <th>구매번호</th>
                    <th>제품명</th>
                    <th>배송상태</th>
                    <th>결제금액</th>
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
			                           	 	<a href="/PalDDack/PrdDetail.do?proCode=<%=list.get(i).getProCode()%>">
			                           	 		<span><%=list.get(i).getProName() %> X <%=list.get(i).getBuyQty() %> </span>
			                           	 	</a>
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