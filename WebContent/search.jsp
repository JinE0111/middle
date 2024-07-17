<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String searchName = (String) request.getAttribute("searchName");
// 	List<ProductVO> list = (List<ProductVO>)request.getAttribute("list");
List<ProductVO> search = (List<ProductVO>) request.getAttribute("searchList");

System.out.println(searchName);
%>
<%@include file="include/top.jsp"%>
<div id="list_container">
	<div id="path_wrap">
		<ul id="path_wrap_ul">
			<li id="home_btn"><a href="/PalDDack">홈</a></li>
			<li>></li>
			<li>
				<p><%=searchName%></p>
			</li>
		</ul>
	</div>
	<div id="prd_list_wrap">
		<div class="prd_array">
			<ul>
				<li class="array_active"><a href="">인기순</a></li>
				<li class=""><a href="#">낮은가격순</a></li>
				<li><a href="#">높은가격순</a></li>
			</ul>
		</div>
		<!-- 상품리스트 -->
		<div id="prd_list">
			<%
				if (search != null && search.size() != 0) {
			%>
			<ul>
				<%
				for (int i = 0; i < search.size(); i++) {
				%>
				<li onclick="document.forms['form<%=i%>'].submit();">
					<form name="form<%=i%>" action="/PalDDack/PrdDetail.do"
						method="post">
						<input type=hidden name="proCode"
							value="<%=search.get(i).getProCode()%>"> <a href="#">
							<img src="<%=request.getContextPath() + search.get(i).getProRepImg()%>" alt="상품대표이미지">
							<div class="prd_info">
								<p class="prd_name"><%=search.get(i).getProName()%></p>
								<p class="prd_sp"><%=search.get(i).getProUnit()%></p>
								<%
									if(search.get(i).getProSellCost() == search.get(i).getDiscountCost()){
								%>
								<p class="prd_price"><%=String.format("%,d", search.get(i).getProSellCost())%>원
								<%
									} else {
								%>
								<p class="prd_price" id="proCost" style="font-size:12px; text-decoration:line-through;"><%=String.format("%,d", search.get(i).getProSellCost() )%>원
								<p class="prd_price"><%=String.format("%,d", search.get(i).getDiscountCost()) %>원
								<%
									}
								%>
								</p>
							</div>
						</a>
					</form>
				</li>
				<%
					}
				%>
			</ul>
			<%
				} else {
			%>
			<div class="none_data">내용이 없습니다</div>
			<%
				}
			%>
		</div>
		<hr style="color:gray;">
	</div>
</div>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>