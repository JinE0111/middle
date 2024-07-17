<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더영역 -->
<%@include file="../include/top.jsp" %>

<style>
.container {
    width: 100%;
    overflow: auto;
  }
body {
  font-family: "Noto Sans KR";     
}
.allMy {
    text-align: left;
    margin-top: 60px;
}
.leftMy {
  display: inline-block;
  width: 10%;
  text-align: left;
  margin-right: 89px;			  /* 100px */
  background-color: #f8fcfe;
  padding: 20px 50px 20px 20px;
  margin-left: 152px;
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
  padding-bottom: 20px;
}
.deta {
  font-size: 18px;
}
.marP {
  padding-top: 30px;
}
h3{
 color:#004393;
 font:bold;
 }
 dt{
 font-size: 25px;
 color: #004393;
 font-weight: 500;
 font-weight: bold;
}
dd{
 font-size: 17px;
 color:#333;
 text-align:left;
 margin:0;
 }
.con-title{
 padding: 30px 30px 10px 97px;
}
.auto{
 margin: 0 auto;
 position: relative;
 width: 1076px;
}
.content-bottom-padding {
    padding-bottom: 200px;
}
</style>
</head>
<body>
  <div class="allMy">
      <div class="leftMy">
          <div class="mymar">
              <h2 class="mar">고객센터</h2>
          </div>
       	<p class="mar deta marP"><a href="Door.do">공지사항</a></p>
        <p class="mar deta"><a href="Notice.do">문의사항</a></p>
        <p class="mar deta"><a href="company.jsp">회사소개</a></p>
          <br><br>
      </div>
      <div class="rigthMy">
	<!-- 	<div class ="container"> -->
			<h3>회사소개</h3>
			<img src="./img/company.jpg" alt="회사 이미지 설명" style="width:100%; max-width:956px; height: 301px;">
			<dl>
			<dt>PalDDack</dt> 
			<dd>
			팔딱팔딱은 해양수산부 지원으로 한국수산회에서 운영하고<br>
			생산자, 수산업자, 소비자를 직접 연결하는 수산물 전문 쇼핑몰입니다.<br><br>
			2004년 수산물 온라인 판매가 미비했던 시기에 앞장서 소규모 어업들과 함께 상품구성에서부터 포장, 배송 등을<br>
			고민하고 연구하여 수산물 전문 쇼핑물 팔딱팔딱을 선보일 수 있었습니다.<br>
			처음에는 수산물 전자상거래에 대한 염려와 불신으로 많은 시행착오와 어려움을  겪었지만 많은 분의 노력으로<br> 
			지금은 택배로 신선한 생선회를 받을 수 있게 되었습니다.
			</dl>
	  </div>
	  	<div class = "auto">
	 		<div class="container" style="text-align: center;">
    		<img src="./img/company02.jpg" alt="회사 이미지 설명" style="width:100%; max-width:956px; height: 301px; margin-left:79px;">
    		</div>
    		<div class=con-title>
	  		<dl>
				<dt>PalDDack!</dt>
			<dd>
			팔딱팔딱은 우리 수산물을 최상의 품질로 고객님께 어떻게 만족을 드릴지 고민하고<br>
			우리 수산인들에게는 어떻게 소득증대에 도움을 드릴 수 있을지 연구합니다.
	  		</dl>
	  		</div>
	    </div>  
	    <div class = "auto">
	 		<div class="container" style="text-align: center;">
    		<img src="./img/company03.jpg" alt="회사 이미지 설명" style="width:100%; max-width:956px; height: 301px; margin-left:79px;">
    		</div>
    		<div class="con-title content-bottom-padding">
	  		<dl>
				<dt> ☆ 팔딱팔딱 3S ☆</dt>
			<dd>
			안전(Safe) : 수산물은 무엇보다 안전! 생산에서 배송까지 안전을 책임집니다.<br>
			만족(Satisfaction) : 좋은 품질은 물론 저렴한 가격으로 고객님께 만족을 드립니다. <br>
			봉사(Service) : 무엇이든 물어보세요! 수산물정보, 배송현황, 클레임처리 등 친절히 안내해 드립니다.
	  		</dl>
	  		</div>
    	</div>
</div>
    
<!-- 푸터영역 -->
<%@include file="include/footer.jsp" %>