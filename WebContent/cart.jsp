<%@page import="kr.or.ddit.sfc.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/cart.css">
</head>
<%@include file="include/top.jsp"%>
<body class="body">
    <div class="jang">
        <div class="step">
            <ul class="totalOrder">
                <li class="on">
                    <span class="step00">STEP 01</span>
                    <p class="step01">장바구니</p>
                </li>
                <li class="on">
                    <span class="gt">〉</span>
                </li>
                <li class="on">
                    <span class="step03">STEP 02</span>
                    <p class="step02">주문/결제</p>
                </li>
            </ul>
        </div>
        
        <div class="orderList">
            <table class="table order">
                <colgroup>
                    <col width="30px">
                    <col width="140px">
                    <col>
                    <col width="150px">
                    <col width="150px">
                    <col width="150px">
                </colgroup>
                <thead>
                    <th class="first">
                        <input type="checkbox" id="checkbox" name="checkbox" class="checkAll" style="margin-left: 5px;">
                    </th>
                    <th>전체선택</th>
                    <th>주문 상품 정보</th>
                    <th>상품가격</th>
                    <th>수량</th>
                    <th>합계</th>
                </thead>
                <tbody>
                <%
// 					List<CartVO> list = (List<CartVO>)request.getAttribute("cartList");
					List<CartVO> list = (List<CartVO>)session.getAttribute("cartList");
                	if(list != null && list.size() > 0){
                		for(CartVO cvo : list){
                			int proSellCost = cvo.getProSellCost();
                		    java.text.NumberFormat nf = java.text.NumberFormat.getInstance(); // 천단위 콤마
                		    
                		    String sellCost = nf.format(cvo.getProSellCost()); // 할인 미적용 가격
                		    String discountCost = nf.format(cvo.getDiscountCost()); // 할인 적용 가격
                		    
                		    String costQty = nf.format(cvo.getProSellCost() * cvo.getCartQty()); // 할인X 가격 * 수량
                		    String disCostQty = nf.format(cvo.getDiscountCost() * cvo.getCartQty()); // 할인O 가격 * 수량
                %>
                			
                    <tr class="itemJang">
                        <td class="cen">
<!--                         	<form class="proCode" method="post" onsubmit="f_del()" action="./Cart"> -->
							    <input type="checkbox" id="itemId" name="itemId" class="itemId" style="margin-left: 5px;">
							    <input type="hidden" class="proCode" name="proCode" value="<%=cvo.getProCode() %>">
<!-- 							</form> -->
                        </td>
                        <td class="cen">
                            <img src="/PalDDack/<%=cvo.getProRepImg() %>" alt="연어">
                        </td>
                        <td class="proName">
                            <span class="titl"><%=cvo.getProName() %></span>
                        </td>
                       
                        <% 
                        	if(cvo.getProSellCost() != cvo.getDiscountCost()) {
                        %>
                         <td class="cen ordlist">
                            <span class="proCost"><%=sellCost %></span><span class="one">원</span>
                            <span style="display: block; margin-bottom:10px;"></span>
                            <span id="proCost"><%=discountCost %></span><span class="one">원</span>
                         </td>
                        <%
                        	} else {
                    	 %>
                    	 <td class="cen ordlist">
                        	<span id="proCost"><%=sellCost %></span><span class="one">원</span>
                         </td>
                     	<%
                        	}// if end
                        %> 
                        	<td class="cen">
                            <div class="amount01">
                                <button type="button" class="del">-</button>
                                <input type="text" class="itemCount" name="" id="" value="<%=cvo.getCartQty() %>" readonly>
                                <button type="button" class="add">+</button>
                            </div>
                            <div class="amount02">
                                <input type="button" class="updateam" value="수정">
                            </div>
                        </td>
                        <% 
                        	if(cvo.getProSellCost() != cvo.getDiscountCost()) {
                        %>
                        <td class="cen ordlist">
                            <span class="totalCost"><%=disCostQty %></span><span class="one">원</span>
                        </td>
                        <%
                        	} else {
                        %>
                        	<td class="cen ordlist">
                          		<span class="totalCost"><%=costQty %></span><span class="one">원</span>
                       		</td>
                        <%
                        	}
                        %>
                        
                    </tr>
                        <%
                		} // for end
                	} else {
                	%>
						<div class="null">
					        <h1>장바구니가 비어있어요 ㅠ_ㅠ</h1>
					    </div>        	
                	<%
                	} // if end
                	%>
                    <tr class="inst">
                        <td class="instr" colspan="6">
                            <span>*배송비 3,500원 (유료배송)</span>
                            <span class="mon">상품금액 : </span><span class="cost" >0</span>
                            <span>원 + 배송비 : 3,500원</span>
                            <span class="jumon">주문 합계 : </span><span id="jumon">0</span>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="but">
                <input type="button" class="ch del1" value="선택상품 삭제" onclick="f_del()">
            </div>

            <div class="orderAll">
                <ul class="totalOrder">
                    <li class="allOrder">
                        <div class="totalLeft">
                            <dt class="totaldt">총 상품 합계금액</dt>
                            <dd class="totaldd" id="totalLeft">0</dd><span class="onebl">원</span>
                        </div>
                    </li>
                    <li class="allOrder pluList">
                        <span class="plu">+</span>
                    </li>
                    <li class="allOrder">
                        <div class="totalLeft">
                            <dt class="totaldt">배송비</dt>
                            <dd class="totaldd" id="delivery_fee">3,500</dd><span class="onebl">원</span>
                        </div>
                    </li>
                    <li class="allOrder pluList">
                        <span>=</span>
                    </li>
                    <li>
                        <div class="totalRight">
                            <dt class="totaldt">총 주문 합계금액</dt>
                            <dd class="totaldd" id="totalRight">0</dd><span class="onebl">원</span>
                        </div>
                    </li>
                </ul>
            </div>
            <form action="">
            	<div class="but com">
<!--             		<input > -->
                	<a href="./Buy.do?memId=<%=mv.getMemId()%>">
                	<input type="button" class="commitOrder" value="전체상품 주문하기"></a>
            	</div>
            </form>

        </div>
    </div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
"use strict"

let chk = document.querySelectorAll('.itemId'); // 체크박스
let itemJang = document.querySelectorAll('.itemJang'); // 장바구니 상품
let proCost = document.querySelectorAll('#proCost'); // 상품가격	
let updateam = document.querySelectorAll('.updateam'); // 수정버튼
let value = document.querySelectorAll('.itemCount'); // 수량
let cost = document.querySelector('.cost'); // 합계
let totalCost = document.querySelectorAll('.totalCost'); // 상품금액
let totalLeft = document.querySelector('#totalLeft') // 총 상품 합계금액
let delivery_fee = document.querySelector('#delivery_fee') // 배송비
let totalRight = document.querySelector('#totalRight') // 배송비
let jumon = document.querySelector('#jumon'); // 주문 합계


// 주문 수량 및 금액에 대한 금액 변동

$('tbody').ready(function(){
	for(let i=0; i<itemJang.length; i++){
		
	// 천단위마다 , 찍기
	cost.innerText = (parseInt(totalCost[i].innerText.replace(/,/g, '')) + parseInt(cost.innerText.replace(/,/g, ''))).toLocaleString(); // 상품 금액
	jumon.innerText = (parseInt(cost.innerText.replace(/,/g, '')) + parseInt(delivery_fee.innerText.replace(/,/g, ''))).toLocaleString(); // 주문 합계
	totalLeft.innerText = cost.innerText; // 총 상품 합계금액
	totalRight.innerText = jumon.innerText; // 총 주문 금액
		
		// 수량 증가
		$('.add').eq(i).on('click', function(){
			value[i].value ++;
			
		})
		
		// 수량 감소
		$('.del').eq(i).on('click', function(){
			if(value[i].value > 1){
				value[i].value --;
			}
		})
	}
	
	for(let i=0; i<itemJang.length; i++){
		// 수정버튼 누를 시 금액*수량 값으로 변경
		$(updateam).eq(i).on('click',function(){
			let url = "./Cart.do";
			let proCode = document.querySelectorAll('.proCode');
			let proCount = new Array();
			
			proCount.push(value[i].value, proCode[i].value);
			console.log(proCount);
			
			$.ajax({
				url: url,
				type: 'POST',
				tranditional: true,
				data: "proCount=" + proCount,
				success: function(jdata){
					location.reload();
				}
			})
		})
		
		// 전체 선택 및 해제
		$('.checkAll').on('click', function() {
			if($('.checkAll').is(':checked')){
				$('input[name=itemId]').prop("checked", true)
			}else {
				$('input[name=itemId]').prop("checked", false)
			}
		});
		
		// 하나라도 체크가 안됐다면 전체선택 해제 / 전체선택이 아닌 다른 모든 체크박스에 체크되어있으면 전체선택 체크
		$("input[name=itemId]").on('click', function(){
			let totalchk = $('input[name=itemId]').length;
			
			let checked = $('input[name=itemId]:checked').length;
			if(totalchk != checked) $('.checkAll').prop("checked", false)
			else $('.checkAll').prop("checked", true)
		})
	}
})

// 선택 삭제
function f_del() {
	event.preventDefault();
		
	let url = "./CartDel.do";
	let valueArr = new Array();
	let list = $('input[name="itemId"]'); // 체크박스 여부
	let proCode = document.querySelectorAll('.proCode');
	
	
	for(let i=0; i<list.length; i++){
		if(list[i].checked){
			console.log(list[i].value);
			valueArr.push(proCode[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택한 상품이 없습니다.")
	}
	else {
	    if(confirm("선택한 상품을 삭제하시겠습니까?") == true){
			console.log(valueArr);
			$.ajax({
				url: url,
				type: 'POST',
				tranditional: true,
				data:"valueArr="+valueArr,
				success: function(jdata){
						location.reload();
				}
			})
	    }
	}
}


</script>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>