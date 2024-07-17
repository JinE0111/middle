<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="kr.or.ddit.sfc.vo.JjimVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%
    	List<JjimVo> list = (List<JjimVo>)request.getAttribute("jjimList");
//  		할인율의한것
 		ProductVO proInfo = (ProductVO)request.getAttribute("proInfo"); 
    %>  
 
<!-- 헤더영역 -->
<%@include file="include/top.jsp" %>

<!--     부트스트립용 script -->
	<link rel = "stylesheet" type ="text/css" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
body {
    font-family: "Noto Sans KR";
}
</style>

<%
	if(list.size() >0 && list != null){
		for(JjimVo jv : list){
%>
    <ul class="jul">
        <div class="jjimList">
            <li>
                <div class="jjim_img">
<!--                 	클릭시 상품상세페이지 이동 -->
                   <a href="PrdDetail.do?proCode=<%=jv.getProCode()%>"><img src="/PalDDack<%=jv.getProRepImg()%>" alt="상품대표이미지"></a>
<!--                    <a href="#"><img src="" alt="상품대표이미지"></a> -->
                </div>
            </li>
            <li>
                <div class="jjim_info">
                    <a href="PrdDetail.do?proCode=<%=jv.getProCode()%>">
                        <strong><span><%=jv.getProName()%></span></strong>
                        </a>
<!-- 						가격 시작 -->
                        <div>
                         <% 
                         DecimalFormat formatter =new DecimalFormat("###,###");
                         if(jv.getEvCode().equals("E0001")){
                        %>
                            <span class ="before_price"><%=formatter.format(jv.getProSellCost())%></span>할인!!! <span><%=formatter.format(jv.getEvAvg())%></span>원
                       <%
                       }else{
                         %>
                         <span><%=formatter.format(jv.getEvAvg())%></span>원
                          <%
							} 
                         %>
                         
                        </div>
<!--                         일반가 할인가 구분  끝-->
                    <span><%=jv.getCgName()%></span>
                <a href="Jjim/Delete.do?memId=<%=jv.getMemId()%>&proCode=<%=jv.getProCode()%>">
                <button type="button" class="btn-close" aria-label="Close" ></button>
                </a>
            </div>
            </li>
        </div>
    </ul>
    <%
		}//for end
	}else{
    %>
     <div class="Null">
        <h4>
            <p>제품명이 존재하지 않습니다.</p>
        </h4>
    </div>
    <%
	}//else end
    %>
    <script>
        // Wait for the DOM to be fully loaded before accessing elements
        document.addEventListener('DOMContentLoaded', function() {
            // Select all elements with the class 'btn-close'
            var closeButtons = document.querySelectorAll('.btn-close');
            
            // Loop through each close button and attach a click event listener
            closeButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                    // Find the closest parent element with the class 'jjim' and hide it
                    this.closest('.jjim').style.display = 'none';
                });
            });
        });
    </script>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>
