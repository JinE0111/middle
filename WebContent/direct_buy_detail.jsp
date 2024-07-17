<%@page import="kr.or.ddit.sfc.vo.AddrAddVO"%>
<%@page import="kr.or.ddit.sfc.vo.CartVO"%>
<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더영역 -->
<%@include file="../include/top.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/buy.css">
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->

<%
	
	ProductVO buyInfoVo = (ProductVO)request.getAttribute("buyInfoVo");
	int buyQty = (int)request.getAttribute("proQty");
	
// 	List<AddrAddVO> inAV = (List<AddrAddVO>)request.getAttribute("inAV");
//    AddrAddVO inAV = (AddrAddVO)request.getAttribute("inAV");
//    System.out.println("buyjsp에 있는 inAV >>>>>>>>>>>>>>>>>>>>>>>>>> " + inAV);
   
	//회원정보 가져옴
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("login_user");
// 	주소록 데이터
%>

<div class="jang">
    <div class="step">
        <ul>
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
    
    <br><br><br><br><br><br><br>
    <div class="orderList">
        <table class="table order">
            <colgroup>
                <col width="150px">
                <col>
                <col width="150px">
                <col width="150px">
                <col width="150px">
            </colgroup>
            <thead>
                <th></th>
                <th>주문 상품 정보</th>
                <th>상품가격</th>
                <th>수량</th>
                <th>합계</th>
            </thead>
            <tbody>

                <tr class="itemJang">
                    <td class="cen">
                        <img src="/PalDDack<%=buyInfoVo.getProRepImg()%>">
                    </td>
                    <td>
                        <span class="titl"><%=buyInfoVo.getProName()%></span>
                    </td>
                    <td class="cen ordlist">
                        <span><%=String.format( "%,d",buyInfoVo.getDiscountCost())%></span><span class="one">원</span>
                    </td>
                    <td class="cen ordlist">
                        <span><%=buyQty%></span>
                    </td>
                    <td class="cen ordlist">
                        <span><%=String.format( "%,d",buyInfoVo.getTtCost())%></span><span class="one">원</span>
                    </td>
                </tr>
           <tr class="inst">
                    <td class="instr" colspan="6">
                        <span>*배송비 3,500원 (유료배송)</span>
                        <span class="mon">상품금액 :  <%=String.format( "%,d",buyInfoVo.getTtCost())%>원 + 배송비 : 3,500원</span>
                        <span class="jumon">주문 합계 : <%=String.format( "%,d",buyInfoVo.getTtCost() + 3500)%></span>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="addr">배송지</div>
        
        <div class="orderAll">
        	<input type="hidden" id="addCode" name="addCode" value="D0004">
            <div class="addName">
                <input type="button" class="addrAdd" id="addrAdd" name="addrAdd" onclick="fn_pop()" value="변경">
            </div>
            <div class="addName">
                <label for="orderName" class="blue-background">이름</label>
<%--                 <input type="text" id="orderName" name="orderName" class="rea" value="<%=inAV.getMemName() %>" readonly> --%>
                <input type="text" id="orderName" name="orderName" class="rea" value="" readonly>
            </div>
            <div class="addName">
                <label for="orderTel" class="blue-background">휴대폰</label>
<%--                 <input type="text" id="orderTel" name="orderTel" class="rea" value="<%=inAV.getMemTel() %>" readonly> --%>
                <input type="text" id="orderTel" name="orderTel" class="rea" value="" readonly>
            </div>
<!--             <div class="addName"> -->
<!--                 <label for="orderEmail" class="blue-background">이메일</label> -->
<!--                 <input type="text" id="orderEmail" name="orderEmail" class="rea" value="" readonly> -->
<!--             </div> -->
            <div class="addName">
                <label for="orderPost" class="blue-background">우편번호</label>
<%--                 <input type="text" id="orderPost" name="orderPost" class="rea" value="<%=inAV.getDeliPostNo() %>" readonly> --%>
                <input type="text" id="orderPost" name="orderPost" class="rea" value="" readonly>
            </div>
            <div class="addName">
                <label for="orderAdd" class="blue-background">배송주소</label>
<%--                 <input type="text" id="orderAdd" name="orderAdd" class="rea" value="<%=inAV.getDeliAddr() %>" readonly> --%>
                <input type="text" id="orderAdd" name="orderAdd" class="rea" value="" readonly>
            </div>
            <div class="addName">
                <label for="orderAddr" class="blue-background">상세주소</label>
<%--                 <input type="text" id="orderAddr" name="orderAddr" class="rea" value="<%=inAV.getDeliAddrD() %>" readonly> --%>
                <input type="text" id="orderAddr" name="orderAddr" class="rea" value="" readonly>
            </div>
            <div class="addName">
                <label for="orderReq" class="blue-background">배송메모</label>
<%--                 <input type="text" id="orderReq" name="orderReq" class="rea" value="<%=inAV.getDeliReq()%>"readonly> --%>
                <input type="text" id="orderReq" name="orderReq" class="rea" value=""readonly>
            </div>
        </div>

        <div class="addr">결제 수단</div>
        <div class="payment">
            <div class="pay">
                <input type="radio" name="pay" id="cardPay" value="카드결제">
                <label for="cardPay">카드결제</label>
            </div>
            <div class="pay">
                <input type="radio" name="pay" id="rtAccount" value="실시간계좌이체">
                <label for="rtAccount">실시간계좌이체</label>
            </div>
            <div class="pay">
                <input type="radio" name="pay" id="emAccount" value="가상계좌이체">
                <label for="emAccount">가상계좌이체</label>
            </div>
            <div class="payEnd">
                <input type="radio" name="pay" id="kkoPay" value="카카오페이">
                <label for="kkoPay">카카오페이</label>
            </div>
        </div>

        <div class="but com">
            <input type="button" onclick="roll()" class="ch del1" id="rollbackOrder" name="rollbackOrder" value="결제취소">
            <input type="button" class="commitOrder" id="commitOrder" name="commitOrder" value="결제하기">
        </div>

    </div>
</div>

<script>

	let payVal;
	let addCode = document.getElementsByName('addCode')[0].value;
	let amount = <%=buyInfoVo.getTtCost() + 3500%>;
    let userId = '<%=mvo.getMemId()%>';
    let buyQty = '<%=buyQty%>';
    let proCode = '<%=buyInfoVo.getProCode()%>'
	
	function roll() {
	    let yn = confirm('결제를 취소하시겠습니까?');
	    if(yn) {
	        window.location.href = '<%=request.getContextPath()%>/Main.do';
	    }
	}
	
    //문서가 준비되면 제일 먼저 실행
    $(document).ready(function(){
	    $('#commitOrder').click(function(data){
	    	let payName = document.getElementsByName('pay');
	    	for (const pay of payName) {
	    		if(pay.checked) {
	    			payVal = pay.value;
	    		}
	    	}
	        payment();
	    })
    })
    
    //버튼 클릭하면 실행
    function payment(data){
        IMP.init("imp81681023"); // 가맹점 식별코드
        IMP.request_pay({
			pg: "kakaopay",
            pay_method: "card",
            name: "팔딱팔딱",
            amount: amount,
            buyer_email: "",
            buyer_name: "",
            buyer_tel: "",
            buyer_addr: "",
            buyer_postcode: "01181",
            m_redirect_url: "", // 모바일 결제후 리다이렉트될 주소!!
        }, async function (rsp) {
            console.log("rsp >>> " + rsp.success);
            if (rsp.success) {
                alert('결제 완료!');
                location.href= "<%=request.getContextPath()%>/BuyDirectInsert.do?userId=" + userId + "&payVal=" + payVal + "&addCode=" + addCode + "&buyCost=" + amount + "&buyQty="+buyQty +"&proCode="+proCode;
            } else {
                    alert(`error${response.status}\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
            }
        });
    }
    function fn_pop(){
    	 window.open("<%=request.getContextPath()%>/AddrAdd.do", "배송지 입력", "width=650, height=480, left=100, top=50");
    }
</script>
</body>
</html>
