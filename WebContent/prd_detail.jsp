<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="kr.or.ddit.sfc.vo.JjimVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/top.jsp"%>

 <% 
 	// 상품 VO
 	ProductVO proInfo = (ProductVO)request.getAttribute("proInfo");
 	String category = (String) request.getAttribute("category");
	//회원정보 가져옴
	MemberVO mvVo = (MemberVO) request.getSession().getAttribute("login_user");
 %> 
<div id="detail_container">
        <div id="path_wrap">
            <ul id="path_wrap_ul">
                <li id="home_btn">
                    <a href="/PalDDack/Main.do">홈</a>
                </li>
                <li>
                    >
                </li>
                <li>
                    <p><%=category%></p>
                </li>
            </ul>
        </div>
        <div class="detail_top">
            <div class="detail_top_img_wrap">
                <img src="<%= request.getContextPath() + proInfo.getProRepImg()%>" alt="대표이미지">
            </div>
            <div class="detail_top_txt_wrap">
                <p class="d_prd_name"><%=proInfo.getProName()%></p>
                <ul class="d_prd_unit">
                    <li>
                        <dl class="d_prd_info">
                            <dt>단위</dt>
                            <dd><%=proInfo.getProUnit() %></dd>
                        </dl>
                    </li>
                </ul>
                <ul class="d_prd_sell_cost">
                    <li>
                        <%
                        	if(proInfo.getProSellCost() == proInfo.getDiscountCost()){
                        %>
                        <dl class="d_prd_info">
                            <dt>판매가</dt>
                            <dd class="d_prd_price"><%=String.format("%,d",proInfo.getProSellCost())%>원</dd>
                        </dl>
                        <%
                        	}else{
                        %> 
                        <dl class="d_prd_info">
                        	<dt>판매가</dt>
                            <dd class="d_ev_before_price"><%=String.format("%,d",proInfo.getProSellCost())%>원</dd>
                        </dl>
                        <dl class="d_prd_info">
                        	<dt>행사가</dt>
                            <dd class="d_ev_after_price"><%=String.format("%,d",proInfo.getDiscountCost())%>원</dd>
                        </dl>
                        <%
                        	}
                        %>
                    </li>
                </ul>
                <ul class="d_prd_info_bottom">
                    <li class="d_prd_deli_cost">
                        <dl class="d_prd_info">
                            <dt>배송비</dt>
                            <dd>3,500원<span>(유료배송)</span></dd>
                        </dl>
                    </li>
                    <li class="d_prd_c_origin">
                        <dl class="d_prd_info">
                            <dt>원산지</dt>
                            <dd>상품정보 고시 참고</dd>
                        </dl>
                    </li>
                </ul>
                <div class="d_prd_add">
                    <div class="d_prd_amount_box">
                        <div class="d_prd_amount">
                            <input type="button" class="d_prd_qty_del cursor amount_down" value="-"></input>
                            <input type="text" name="d_prd_qty" id="d_prd_qty" value="1" pattern="[0-9]+" size="3">
                            <input type="button" class="d_prd_qty_del cursor amount_up" value="+"></input>
                        </div>
                        <%
                        	if(proInfo.getProSellCost() == proInfo.getDiscountCost()){
                        %>
                        	<p id="prd_cost"><%=String.format("%,d",proInfo.getProSellCost())%>원</p>
                        <%
                        	}else{
                        %>
                        	<p id="prd_cost"><%=String.format("%,d",proInfo.getDiscountCost())%>원</p>
                        <%
                        	}
                        %>
                    </div>
                </div>
                <div class="d_prd_tt_price">
                    <dl>
                        <dt>총 합계금액</dt>
                        <%
                        	if(proInfo.getProSellCost() == proInfo.getDiscountCost()){
                        %>
	                        <dd>총 <span id="d_prd_tt"><%=String.format("%,d",proInfo.getProSellCost())%></span>원</dd>
                        <%
                        	}else{
                        %>
	                        <dd>총 <span id="d_prd_tt"><%=String.format("%,d",proInfo.getDiscountCost())%></span>원</dd>
                        <%
                        	}
                        %>
                    </dl>
                </div>
                
                <div class="d_prd_btn_wrap">
	                <%
	                if(mvVo == null){
	                %>
	                
	                	<a href="/PalDDack/login.do"> 
		                    <p class="d_prd_jjim_btn cursor" onclick="document.forms['nullMember'].submit();">
    		                	<img src="./img/jjim_img1.png" alt="찜">
        		            </p>
	        	            <p class="d_prd_cart_btn cursor" onclick="document.forms['nullMember'].submit();">장바구니 담기</p>
	            	        <p class="d_prd_buy_btn cursor" onclick="document.forms['nullMember'].submit();">바로 구매하기</p>
	                	</a>
	                	
	                <% 
	                }else{
	                %>
	                	<!-- 찜연결 폼 -->
		                <form action="/PalDDack/Jjim/Insert.do" name="form_jjim" method="post">
		                	<input type=hidden name="proCode" value="<%=proInfo.getProCode()%>">
		                	<input type=hidden name="memId" value="<%=mvVo.getMemId()%>">
		                </form>
	                	<p class="d_prd_jjim_btn cursor" onclick="document.forms['form_jjim'].submit();">
    	                	<img src="./img/jjim_img1.png" alt="찜">
        	            </p>
	                	
	                	<!-- 바로구매연결 폼 -->
		                <form method="post" action="BuyDirect.do" name="form_buy" id="form_buy">
		                	<input type=hidden name="buy_prd" value="<%=proInfo.getProCode()%>">
		                	<input type=hidden name="pro_qty" value="">
		                	<input type=hidden name="buy_id" value="<%=mvVo.getMemId()%>">
		                </form>
	                    
	                    <p class="d_prd_cart_btn cursor" onclick="fn_cart()">장바구니 담기</p>
	                    <p class="d_prd_buy_btn cursor" onclick="fn_buy()">바로 구매하기</p>
	                <%
	                }	                
	                %>
                </div>
            </div>
        </div>
        
        <!-- 상품 정보 -->
         <div class="d_prd_contents">
            <div class="d_prd_tap">
                <ul id="상세정보">
                    <li class="prd_tap_sel">
                        <a href="#상세정보">상세 정보</a>
                    </li>
                    <li>
                        <a href="#상품후기">상품 후기</a>
                    </li>
                </ul>
            </div>
            <div class="d_prd_con_img_wrap">
                <img src="<%= request.getContextPath() + proInfo.getProImg()%>" alt="">
            </div>
            <div class="d_prd_tap">
                <ul id="상품후기">
                    <li>
                        <a href="#상세정보">상세 정보</a>
                    </li>
                    <li class="prd_tap_sel">
                        <a href="#상품후기">상품 후기</a>
                    </li>
                </ul>
            </div>
            <div class="d_prd_review">
                <table class="d_prd_rv_table">
                    <tr>
                        <th>번호</th>
                        <th>상품후기</th>
                        <th>만족도</th>
                        <th>작성자/작성일</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1번의 상품 후기</td>
                        <td>⭐⭐⭐⭐⭐</td>
                        <td>김다희<span>2023-10-11</span></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2번의 상품 후기</td>
                        <td>⭐⭐⭐⭐⭐</td>
                        <td>이수희<span>2023-10-11</span></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>3번의 상품 후기</td>
                        <td>⭐⭐⭐⭐⭐</td>
                        <td>송유진<span>2023-10-11</span></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>4번의 상품 후기</td>
                        <td>⭐⭐⭐⭐⭐</td>
                        <td>이종진<span>2023-10-11</span></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>5번의 상품 후기</td>
                        <td>⭐⭐⭐⭐⭐</td>
                        <td>곽래현<span>2023-10-11</span></td>
                    </tr>
                </table>
            </div>
            <!-- 리뷰의 페이징 영역, 상품리스트 페이징과 동일 css 적용 -->
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
        </div>
    </div>

<script>
    // 구매수량 업다운 버튼
    let v_amount_down = document.querySelector('.amount_down');
    let v_amount_up = document.querySelector('.amount_up');
    
    // 구매수량
    let v_d_prd_qty = document.querySelector('#d_prd_qty');

    // 구매 총액, 상품 금액 출력 영역
    let v_d_prd_tt_price = document.querySelector('#d_prd_tt');
    let v_d_prd_price = document.querySelector('#prd_cost');

    // 금액을 숫자로 변환
    let ttPrice = Number(v_d_prd_tt_price.innerText.replace(/[^0-9]/g,'')); // 총합 금액
    let prdPrice =  Number(v_d_prd_price.innerText.replace(/[^0-9]/g,'')); // 상품 금액
    
    // 구매수량 다운 버튼
    v_amount_down.addEventListener("click", function(){
        v_d_prd_qty.value -= 1;
        if(v_d_prd_qty.value <= 0){
            alert("수량은 한 개 이상 입력해주세요.");
            v_d_prd_qty.value = 1;
        }
        fn_tt_price();
    });

    // 구매수량 업 버튼
    v_amount_up.addEventListener("click", function(){
        v_d_prd_qty.value = Number(v_d_prd_qty.value)+1;
        fn_tt_price();
    });

    // 총합계 금액 !! 
    v_d_prd_qty.addEventListener("change", fn_tt_price);

    function fn_tt_price(){
        let v_tt = Number(v_d_prd_qty.value) * prdPrice;
        v_d_prd_tt_price.innerText = v_tt.toLocaleString();
    }
    
    //=========================================================
    let proCode = '<%=proInfo.getProCode()%>';
   	let proQty =  0;
   	let memId;
   	<% 
   	if(mvVo != null){
   	%>
	    function fn_cart(){ // 장바구니 추가 버튼 
		   	memId = '<%=mvVo.getMemId()%>';
	    	proQty = v_d_prd_qty.value;
	    	
	    	$.ajax({
	    		type: 'post',
	    		url: '/PalDDack/CartInsert.do',
	    		data: JSON.stringify({
	    			"cartProCode" : proCode,
	    			"cartMemId" : memId,
	    			"cartQty" : proQty,
	    		}),
	    		success : function(){
	    			let yn = confirm('장바구니 페이지로 이동하시겠습니까?');
	    		    if(yn) {
	    		        window.location.href = '<%=request.getContextPath()%>/Cart.do';
	    		    }
	    		},
	    		error : function(request, status, error) { // 결과 에러 콜백함수        
	   				console.log(error)    
	   			}
	    	})
	    }
	<%
   	}
	%>    
    function fn_buy(){ // 구매하기 버튼 
    	proQty = v_d_prd_qty.value;
		$('input[name=pro_qty]').val(proQty);
		$('#form_buy').submit();
    }
</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>