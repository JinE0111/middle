<%@page import="kr.or.ddit.sfc.vo.DeliStatusVO"%>
<%@page import="kr.or.ddit.sfc.vo.AdminDeliVO"%>
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
.select {

  width: 160px;
  height: 35px;
  margin: 10px;
  padding: 7px;
}
.submit {
  width: 160px;
  margin-bottom: 10px;
  background-color: #004393;
  color: white;
  height: 30px;
}
#deli {
  margin-top:20px;
}
.prd_page {
  margin-left:156px;
}

</style>
</head>
<% 
	List<AdminDeliVO> advo =  (List<AdminDeliVO>) request.getAttribute("advo");  
	List<DeliStatusVO> dsvo =  (List<DeliStatusVO>) request.getAttribute("dsvo");
%>
<body>
    <div class="allMy">
        <div class="leftMy">
            <div class="mymar">
                <h2 class="mar">배송 관리</h2>
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
                    <h2 class="mar marRig inl">배송 관리</h2>
                    <p class="inl inlP">배송상태를 선택하여 변경 버튼을 클릭하시면 배송상태를 변경할 수 있습니다.</p>
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
                	if(advo != null && advo.size() > 0){
                		for(int i = 0; i<advo.size(); i++){
                			%>
                			<tbody>
			                    <tr class="itemJang">
			                        <td>
			                            <span><%= advo.get(i).getRnum() %></span>
			                        </td>
			                        
			                		<form method="post" action="DeliStatus.do" onsubmit="return confirm('배송상태를 변경하시겠습니까?');">
				                        <td>
				                        <!-- span요소에서는 name값을 사용할 수 없음. -->
				                            <span><%=advo.get(i).getMemId() %></span>
				                            <input type="hidden" name="memId" value="<%=advo.get(i).getMemId() %>">
				                        </td>
				                        <td>
				                           	<span><%=advo.get(i).getBuyNo() %></span>
				                           	<input type="hidden" name="buyNo" value="<%=advo.get(i).getBuyNo() %>">
				                        </td>
				                        <td>
				                            <span><%=advo.get(i).getBuyDate() %></span>
				                            <input type="hidden" name="buyDate" value="<%=advo.get(i).getBuyDate() %>">
				                        </td>
				                        <td>
						                    <input type="hidden" name="buyDate" value="<%=advo.get(i).getBuyDate() %>">
					                       
					                        <select class="select" name="deliStatCode">
				                        	<% for(int j=0; j<dsvo.size(); j++){ %>
					                        	  <option  value="<%=dsvo.get(j).getDeliStatCode() %>" <%=dsvo.get(j).getDeliStat().equals(advo.get(i).getDeliStat()) ? "selected" : "" %>> <!-- 기본값 조건문 ???-->
					                        	  <%=dsvo.get(j).getDeliStat() %></option>
					                        <% } %>
					                        </select>
					                        <input class="submit" type="submit" value="변경">
				                        </td>
					                </form>
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
			                        <td><h2 id="null">배송 관리가 비어있습니다</h2></td>
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
    <!-- 페이징 영역 -->
     <div class="admin_member_paging">
	    <div class="prd_page">
		         <%
		            if(advo != null && advo.size() != 0 && request.getAttribute("sPage")!=null){
		         %>
	                <ul>
	                    <li class="prd_pre_page">
	                        <a href="#">&lt</a>
	                    </li>
	                </ul>
	                <ul class="pagination">
                    <%
						int sPage = (int)request.getAttribute("sPage");			  
						int ePage = (int)request.getAttribute("ePage");			  
						int cPage = (int)request.getAttribute("cPage");
						
						for(int i = sPage; i <=ePage; i++){
							if(cPage == i){
					%>
		                    <li class="prd_active_page" value="<%=i%>">
		                    	<a href="#"><%=i%></a>
		                    </li>
                    <%
							}else{
					%>
							<li value="<%=i%>">
								<a href="#"><%=i%></a>
							</li>
					<%
							}
						}// for end
                    %>
         
                </ul>
                <ul>
                	<li class="prd_next_page">
                        <a href="#">&gt</a>
                    </li>
                </ul>
                <%
	            } // 페이징 전체 영역 if >> 데이터 없으면 아무것도 뜨지 않음
	         	%>
            </div>
       </div>
    <!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$('body').ready(function(){
	for(let i = 0; i<$('.itemJang').length; i++){
		$('.select').eq(i).on('change', function() {
			console.log($(".itemJang").eq(i).children(i).children(i).innerText);
		})
	}
	for(let i = 0; i<$('.select').length; i++){	
		$('.select').eq(i).on('change', function() {
			console.log($(".select option:selected").eq(i).val());
		})
	}
})


	// 숫자 버튼 눌렀을때 
	$('.pagination li').on('click', function(){
	// 		alert($(this).val());
		location.href = "AdminDeli.do?page=" + $(this).val()
	});
	let crtPage = 0;
	
	// < 눌렀을때
	$('.prd_pre_page').on('click',function(){
		crtPage = $('.pagination').children().first().val()-1;
	// 		alert(crtPage);
		// 현재 페이지가 0보다 작거나 같을 때 페이지 정보를 넘기지 않음
		if(crtPage <= 0) return;
		location.href = "AdminDeli.do?page="+crtPage
	});
	
	// > 눌렀을때
	$('.prd_next_page').on('click', function(){
		crtPage = $('.pagination').children().last().val()+1;
		// 현재 페이지가 totalPage보다 클 때 페이지 정보를 넘기지 않음
		if(crtPage >= <%=request.getAttribute("ttPage")%>) return ;
		location.href = "AdminDeli.do?page="+crtPage
			});
</script>
</body>
</html>



