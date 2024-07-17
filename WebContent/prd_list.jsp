<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String category = (String) request.getAttribute("category");
    List<ProductVO> list = (List<ProductVO>) request.getAttribute("list");
%>
<%@include file="include/top.jsp"%>
<div id="list_container">
	<div id="path_wrap">
		<ul id="path_wrap_ul">
			<li id="home_btn"><a href="/PalDDack/Main.do">홈</a></li>
			<li>></li>
			<li>
				<p><%=category%></p>
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
				if (list != null && list.size() != 0) {
			%>
			<ul>
				<%
					int str = (int) request.getAttribute("str");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li onclick="document.forms['form<%=i%>'].submit();">
					<form name="form<%=i%>" action="/PalDDack/PrdDetail.do"
						method="post">
						<input type=hidden name="proCode"
							value="<%=list.get(i).getProCode()%>"> <input type=hidden
							name="category" value="<%=category%>"> <a href="#"> <img
							src="<%=request.getContextPath() + list.get(i).getProRepImg()%>"
							alt="상품대표이미지">
							<div class="prd_info">
								<p class="prd_name"><%=list.get(i).getProName()%></p>
								<p class="prd_sp"><%=list.get(i).getProUnit()%></p>
								<%
									if (list.get(i).getProSellCost() == list.get(i).getDiscountCost()) {
								%>
								<p class="prd_price"><%=String.format("%,d", list.get(i).getProSellCost())%>원
								</p>

								<%
									} else {
								%>
								<p class="ev_price"><%=String.format("%,d", list.get(i).getProSellCost())%>원
								</p>
								<p class="prd_discount_cost"><%=String.format("%,d", list.get(i).getDiscountCost())%>원
								</p>
								<%
									}
								%>
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

		<!-- 페이징 영역  -->
		<div class="prd_page">
			<%
				if (list != null && list.size() != 0) {
			%>
			<ul>
				<li class="prd_pre_page"><a href="#">&lt</a></li>
			</ul>
			<ul class="pagination">
				<%
					int sPage = (int) request.getAttribute("sPage");
				int ePage = (int) request.getAttribute("ePage");
				int cPage = (int) request.getAttribute("cPage");

				for (int i = sPage; i <= ePage; i++) {
					if (cPage == i) {
				%>
				<li class="prd_active_page" value="<%=i%>"><a href="#"><%=i%></a>
				</li>
				<%
					} else {
				%>
				<li value="<%=i%>"><a href="#"><%=i%></a></li>
				<%
					}
				} // for end
				%>

			</ul>
			<ul>
				<li class="prd_next_page"><a href="#">&gt</a></li>
			</ul>
			<%
				} // 페이징 전체 영역 if >> 데이터 없으면 아무것도 뜨지 않음
			%>
		</div>

	</div>
</div>
<script>
	// 숫자 버튼 눌렀을때 
	$('.pagination li').on('click', function(){
// 		alert($(this).val());
		location.href = "PrdList.do?page=" + $(this).val()+"&category="+"<%=category%>";
	});
	let crtPage = 0;
	
	// < 눌렀을때
	$('.prd_pre_page').on('click',function(){
		crtPage = $('.pagination').children().first().val()-1;
// 		alert(crtPage);
		// 현재 페이지가 0보다 작거나 같을 때 페이지 정보를 넘기지 않음
		if(crtPage <= 0) return;
		location.href = "PrdList.do?page="+crtPage+"&category="+"<%=category%>";
	});
	
	// > 눌렀을때
	$('.prd_next_page').on('click', function(){
		crtPage = $('.pagination').children().last().val()+1;
		// 현재 페이지가 totalPage보다 클 때 페이지 정보를 넘기지 않음
		if(crtPage >= <%=request.getAttribute("ttPage")%>) return ;
		location.href = "PrdList.do?page="+crtPage+"&category="+"<%=category%>";
	});
</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp"%>