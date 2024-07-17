<%@page import="kr.or.ddit.sfc.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProductVO> bestSeller = (List<ProductVO>)request.getAttribute("bestSeller");

%>
<!-- 헤더영역 -->
<%@include file="include/top.jsp" %>
 
<!-- 메인영역 --> 
    <div id="main_container">
        <div id="img_wrap">
            <img src="./images/꼬막_웹_메인.jpg" alt="">
        </div>
       <div id="best_push">
            <h2>베스트 추천 상품</h2>
            <ul>
            <%
            	for(int i=0 ; i<bestSeller.size() ; i++){	
            %>
                <li onclick="document.forms['form<%=i%>'].submit();">
                    <form name="form<%=i%>" action="/PalDDack/PrdDetail.do" method="post">
                    <input type=hidden name="proCode" value="<%=bestSeller.get(i).getProCode()%>">
                    <a href="#">
                        <img src="<%= request.getContextPath() + bestSeller.get(i).getProRepImg()%>" alt="멍게비빔장">
                        <div class="bst_info">
                            <p class="bst_name"><%=bestSeller.get(i).getProName()%></p>
                            <p class="bst_sp"><%=bestSeller.get(i).getProUnit()%></p>
                            <p class="bst_price"><%=String.format("%,d",bestSeller.get(i).getProSellCost())%>원</p>
                        </div>
                    </a>
                    </form>
                </li>
            <%
            	}
            %>
            </ul>
        </div>
        <!-- 베스트 상품 후기 리스트 -->
        <div id="best_review">
            <h2>베스트 상품 후기</h2>
            <ul>
                <li>
                    <a href="#">
                        <img src="./images/리뷰1.jpg" alt="멍게비빔장">
                        <div class="rev_txt">
                            <p class="rev_star">⭐⭐⭐⭐⭐</p>
                            <p class="rev_con">과메기도 과메기지만 같이 송부해주신 어쩌고저쩌고 리뷰내용...</p>
                            <div class="rev_data">
                                <span class="rev_id">회원아이디</span>
                                <span calss="rev_date">2020-10-12</span>
                            </div>
                            <div class="rev_item_link">
                                <p>

                                </p>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="./images/리뷰2.jpg" alt="멍게비빔장">
                        <div class="rev_txt">
                            <p class="rev_star">⭐⭐⭐⭐⭐</p>
                            <p class="rev_con">블프 세일하길래 사서 어제 먹었어요. 너무 맛있어서 흡입하느라...</p>
                            <div class="rev_data">
                                <span class="rev_id">회원아이디</span>
                                <span calss="rev_date">2020-10-12</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="./images/리뷰3.jpg" alt="멍게비빔장">
                        <div class="rev_txt">
                            <p class="rev_star">⭐⭐⭐⭐⭐</p>
                            <p class="rev_con">처가 집에서 네 집 식두들 김장 어쩌고 먹는대요 리뷰내용...</p>
                            <div class="rev_data">
                                <span class="rev_id">회원아이디</span>
                                <span calss="rev_date">2020-10-12</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="./images/리뷰4.jpg" alt="멍게비빔장">
                        <div class="rev_txt">
                            <p class="rev_star">⭐⭐⭐⭐⭐</p>
                            <p class="rev_con">솔직히 저렴하기도 하니까 맛은 있어도 양은 적을 줄 알았는...</p>
                            <div class="rev_data">
                                <span class="rev_id">회원아이디</span>
                                <span calss="rev_date">2020-10-12</span>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>
