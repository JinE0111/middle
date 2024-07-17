package kr.or.ddit.sfc.vo;

// 상품 VO
public class ProductVO {
	private String proCode; 	// 상품코드
	private String proName; 	// 상품명
	private int proSellCost; 	// 상품판매가격
	private String proInDate; 	// 등록일
	private int proStock; 		// 재고
	private String proDelYn; 	// 삭제여부
	private String proCon; 		// 상품설명
	private String proUnit; 	// 상품단위
	private String proRepImg; 	// 상품 대표 이미지
	private String proImg; 		// 상품 이미지
	
	private int ttCost;			// 할인율*상품가격*상품구매수량 
	
	private int cartQty; 		// 상품 구매 수량
	
	private int discountCost;	// 할인가격
	
	private int sellCnt;		// 판매수량 
	
	
	public int getTtCost() {
		return ttCost;
	}
	public void setTtCost(int ttCost) {
		this.ttCost = ttCost;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProSellCost() {
		return proSellCost;
	}
	public void setProSellCost(int proSellCost) {
		this.proSellCost = proSellCost;
	}
	public String getProInDate() {
		return proInDate;
	}
	public void setProInDate(String proInDate) {
		this.proInDate = proInDate;
	}
	
	public int getProStock() {
		return proStock;
	}
	public void setProStock(int proStock) {
		this.proStock = proStock;
	}
	public String getProDelYn() {
		return proDelYn;
	}
	public void setProDelYn(String proDelYn) {
		this.proDelYn = proDelYn;
	}
	public String getProCon() {
		return proCon;
	}
	public void setProCon(String proCon) {
		this.proCon = proCon;
	}
	public String getProUnit() {
		return proUnit;
	}
	public void setProUnit(String proUnit) {
		this.proUnit = proUnit;
	}
	
	public String getProRepImg() {
		return proRepImg;
	}
	public void setProRepImg(String proRepImg) {
		this.proRepImg = proRepImg;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public int getDiscountCost() {
		return discountCost;
	}
	public void setDiscountCost(int discountCost) {
		this.discountCost = discountCost;
	}
	public int getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}
	@Override
	public String toString() {
		return "ProductVO [proCode=" + proCode + ", proName=" + proName + ", proSellCost=" + proSellCost
				+ ", proInDate=" + proInDate + ", proStock=" + proStock + ", proDelYn=" + proDelYn + ", proCon="
				+ proCon + ", proUnit=" + proUnit + ", proRepImg=" + proRepImg + "]";
	}
	
}
