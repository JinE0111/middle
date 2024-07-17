<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<ProductVO> basirack = (List<ProductVO>)request.getAttribute("basirack");
	List<ProductVO> ggomack = (List<ProductVO>)request.getAttribute("ggomack");
	List<ProductVO> sajogae = (List<ProductVO>)request.getAttribute("sajogae");
	List<ProductVO> imyun = (List<ProductVO>)request.getAttribute("imyun");
%>
<!-- 헤더영역 -->
<%@include file="include/top.jsp" %>
	<div id="ev_container">
        <div id="path_wrap">
            <ul id="path_wrap_ul">
                <li id="home_btn">
                    <a href="#">홈</a>
                </li>
                <li>
                    >
                </li>
                <li>
                    <p>제철수산물</p>
                </li>
            </ul>
        </div>
        <div class="ev_banner">
            <img src="./images/제철수산물_배너_pc.jpg" alt="">
        </div>
        <div class="ev_contents">
            <div class="ev_tap">
                <ul id="바지락">
                    <li class="ev_tap_sel">
                        <a href="#바지락">바지락</a>
                    </li>
                    <li>
                        <a href="#꼬막">꼬막</a>
                    </li>
                    <li>
                        <a href="#새조개">새조개</a>
                    </li>
                    <li>
                        <a href="#임연수어">임연수어</a>
                    </li>
                </ul>
            </div>
            <div class="ev_prd_list">
                <ul>
                <%
					for(int i=0; i<basirack.size(); i++){
                %>
                    <li onclick="document.forms['formBasi<%=i%>'].submit();">
                    	<form name='formBasi<%=i%>' action="/PalDDack/PrdDetail.do" method="post">
                    		<input type=hidden name="proCode" value="<%=basirack.get(i).getProCode()%>">
	                        <a href="#">
	                            <img src="<%=request.getContextPath() + basirack.get(i).getProRepImg()%>" alt="멍게비빔장">
	                            <div class="prd_info">
	                                <p class="prd_name"><%=basirack.get(i).getProName()%></p>
	                                <p class="prd_sp"><%=basirack.get(i).getProUnit()%></p>
	                                <p class="ev_price"><%=String.format("%,d",basirack.get(i).getProSellCost())%>원</p>
	                                <p class="prd_discount_cost"><%=String.format("%,d",basirack.get(i).getDiscountCost())%>원</p>
	                            </div>
	                        </a>
	                    </form>
                    </li>
				<%
					}
				%>
                </ul>
            </div>
            <div class="ev_tap">
                <ul id="꼬막">
                    <li>
                        <a href="#바지락">바지락</a>
                    </li>
                    <li class="ev_tap_sel">
                        <a href="#꼬막">꼬막</a>
                    </li>
                    <li>
                        <a href="#새조개">새조개</a>
                    </li>
                    <li>
                        <a href="#임연수어">임연수어</a>
                    </li>
                </ul>
            </div>
            <div class="ev_prd_list">
                 <ul>
                <%
					for(int i=0; i<ggomack.size(); i++){
                %>
                    
                    <li onclick="document.forms['formGgo<%=i%>'].submit();">
                    	<form name="formGgo<%=i%>" action="/PalDDack/PrdDetail.do" method="post">
                    		<input type=hidden name="proCode" value="<%=ggomack.get(i).getProCode()%>">
	                        <a href="#">
	                            <img src="<%=request.getContextPath() + ggomack.get(i).getProRepImg()%>" alt="멍게비빔장">
	                            <div class="prd_info">
	                                <p class="prd_name"><%=ggomack.get(i).getProName()%></p>
	                                <p class="prd_sp"><%=ggomack.get(i).getProUnit()%></p>
	                                <p class="ev_price"><%=String.format("%,d",ggomack.get(i).getProSellCost())%>원</p>
	                                <p class="prd_discount_cost"><%=String.format("%,d",ggomack.get(i).getDiscountCost())%>원</p>
	                            </div>
	                        </a>
	                    </form>
                    </li>
				<%
					}
				%>
                </ul>
            </div>
            <div class="ev_tap">
                <ul id="새조개">
                    <li>
                        <a href="#바지락">바지락</a>
                    </li>
                    <li>
                        <a href="#꼬막">꼬막</a>
                    </li>
                    <li class="ev_tap_sel">
                        <a href="#새조개">새조개</a>
                    </li>
                    <li>
                        <a href="#임연수어">임연수어</a>
                    </li>
                </ul>
            </div>
            <div class="ev_prd_list">
                <ul>
                <%
					for(int i=0; i<sajogae.size(); i++){
                %>
                    <li onclick="document.forms['formSajo<%=i%>'].submit();">
                    	<form name="formSajo<%=i%>" action="/PalDDack/PrdDetail.do" method="post">
                    		<input type=hidden name="proCode" value="<%=sajogae.get(i).getProCode()%>">
	                        <a href="#">
	                            <img src="<%=request.getContextPath() + sajogae.get(i).getProRepImg()%>" alt="멍게비빔장">
	                            <div class="prd_info">
	                                <p class="prd_name"><%=sajogae.get(i).getProName()%></p>
	                                <p class="prd_sp"><%=sajogae.get(i).getProUnit()%></p>
	                                <p class="ev_price"><%=String.format("%,d",sajogae.get(i).getProSellCost())%>원</p>
	                                <p class="prd_discount_cost"><%=String.format("%,d",sajogae.get(i).getDiscountCost())%>원</p>
	                            </div>
	                        </a>
	                     </form>
                    </li>
				<%
					}
				%>
                </ul>
            </div>
            <div class="ev_tap">
                <ul id="임연수어">
                    <li>
                        <a href="#바지락">바지락</a>
                    </li>
                    <li>
                        <a href="#꼬막">꼬막</a>
                    </li>
                    <li>
                        <a href="#새조개">새조개</a>
                    </li>
                    <li class="ev_tap_sel">
                        <a href="#임연수어">임연수어</a>
                    </li>
                </ul>
            </div>
            <div class="ev_prd_list">
                <ul>
                <%
					for(int i=0; i<imyun.size(); i++){
                %>
                    <li onclick="document.forms['formImyun<%=i%>'].submit();">
                    	<form name="formImyun<%=i%>" action="/PalDDack/PrdDetail.do" method="post">
                    		<input type=hidden name="proCode" value="<%=imyun.get(i).getProCode()%>">
	                        <a href="#">
	                            <img src="<%=request.getContextPath() + imyun.get(i).getProRepImg()%>" alt="멍게비빔장">
	                            <div class="prd_info">
	                                <p class="prd_name"><%=imyun.get(i).getProName()%></p>
	                                <p class="prd_sp"><%=imyun.get(i).getProUnit()%></p>
	                                <p class="ev_price"><%=String.format("%,d",imyun.get(i).getProSellCost())%>원</p>
	                                <p class="prd_discount_cost"><%=String.format("%,d",imyun.get(i).getDiscountCost())%>원</p>
	                            </div>
	                        </a>
	                    </form>
                    </li>
				<%
					}
				%>
                </ul>
            </div>
        </div>
    </div>

<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>