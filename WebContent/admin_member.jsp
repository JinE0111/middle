<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="include/top.jsp"%>
<%
	List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");
%>
<div id="member_ad_wrapper">
    <div class="member_ad_header">
        <h2>회원관리</h2>
        <div class="search_member_box">
        	<form action="<%=request.getContextPath()%>/AdminMemberSearch.do" method="post">
	            <input type="text" name="search_member" id="search_member" placeholder="아이디/이름">
    	        <input type="submit" class="cursor" value="검색">
        	</form>
        </form>
    </div>
    </div>
    <div class="member_ad_contents">
        <table>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>아이디</th>
                <th>연락처</th>
                <th>회원상태</th>
            </tr>
            <%
            	if(list != null && list.size() !=0){
            		for(int i=0; i<list.size(); i++){
            			if((list.get(i).getMemDelyn()).equals("N")){ 
            %>
		            <tr class="member_table_td cursor" onclick="fn_mem_del('<%=list.get(i).getMemId()%>')">
		            
			                <td>
			                	<%=list.get(i).getRnum()%>
			                	<form action="<%=request.getContextPath()%>/AdminMemDel.do" method="post" id="mem_del_form" name="mem_del_form" >
				            		<input type="hidden" name="mem_id" value="">
				            		<input type="hidden" name="mem_del_yn" value="Y">
						        </form>
			                </td>
			                <td><%=list.get(i).getMemName() %></td>
			                <td><%=list.get(i).getMemId() %></td>
			                <td><%=list.get(i).getMemTel() %></td>
			                <td>일반회원</td>
		            </tr>
	               <%
	               }else{
	            	%>
	            	<tr class="member_table_td cursor" onclick="fn_mem_reset('<%=list.get(i).getMemId()%>')">
		                <td>
		                	<%=list.get(i).getRnum()%>
		                	<form action="<%=request.getContextPath()%>/AdminMemDel.do" method="post" id="mem_reset_form" name="mem_reset_form" >
			            		<input type="hidden" name="mem_id" value="">
			            		<input type="hidden" name="mem_del_yn" value="N">
					        </form>
		                </td>
		                <td><%=list.get(i).getMemName() %></td>
		                <td><%=list.get(i).getMemId() %></td>
		                <td><%=list.get(i).getMemTel() %></td>
		            	<td style="color:red">탈퇴회원</td>
		            </tr>
	            	<%   
	               }
	               %> 
            <%
            		}
            	}else{
            %>
            	<tr class="member_table_td">
            		<td colspan="5">회원이 없습니다.</td>
            	</tr>
            <%
            	}
            %>
        </table>
    </div>
    <div class="admin_member_paging">
	    <div class="prd_page">
		         <%
		            if(list != null&& list.size() != 0 && request.getAttribute("sPage")!=null){
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
</div>   
<script>
// 에러체크
"use strict";
<%
if(request.getAttribute("ttPage") != null) {
%>
//숫자 버튼 눌렀을때 
$('.pagination li').on('click', function(){
//		alert($(this).val());
	location.href = "AdminMember.do?page=" + $(this).val();
});
let crtPage = 0;

// < 눌렀을때
$('.prd_pre_page').on('click',function(){
	crtPage = $('.pagination').children().first().val()-1;
//		alert(crtPage);
	// 현재 페이지가 0보다 작거나 같을 때 페이지 정보를 넘기지 않음
	if(crtPage <= 0) return;
	location.href = "AdminMember.do?page="+crtPage;
});

// > 눌렀을때
$('.prd_next_page').on('click', function(){
	crtPage = $('.pagination').children().last().val()+1;
	// 현재 페이지가 totalPage보다 클 때 페이지 정보를 넘기지 않음
	if(crtPage >= <%=request.getAttribute("ttPage")%>) return ;
	location.href = "AdminMember.do?page="+crtPage;
});
<%
}
%>
// 회원 탈퇴 시키는 함수
function fn_mem_del(arg1){
	let del = confirm("회원아이디 "+arg1 + " 회원을 탈퇴시키시겠습니까?");
	
	if(del){
		$('input[name=mem_id]').val(arg1);
		$('#mem_del_form').submit();
	}
}

//탈퇴회원 >> 일반회원 변경 로직
function fn_mem_reset(arg1){
	let reset = confirm("회원아이디 "+arg1 + " 회원을 일반회원으로 복구하시겠습니까?");
	
	if(reset){
		$('input[name=mem_id]').val(arg1);
		$('#mem_reset_form').submit();
	}
}

</script> 
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>