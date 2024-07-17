package kr.or.ddit.sfc.vo;

// 장바구니 VO
public class CartVO {
	private String memId; // 아이디
	private String cartNo; // 장바구니 코드
	private int cartQty; // 상품수량
	private String proCode; // 상품코드 
	private String proName; // 상품명
	private int proSellCost; // 판매가
	private String proRepImg; // 상품 이미지 경로
	private String proImg; // 상품 이미지
	private String evCode; // 이벤트코드
	private int evDiscount; // 할인율
	private int discountCost;	// 할인가
	
	
	public int getDiscountCost() {
		return discountCost;
	}
	public void setDiscountCost(int discountCost) {
		this.discountCost = discountCost;
	}
	public int getEvDiscount() {
		return evDiscount;
	}
	public void setEvDiscount(int evDiscount) {
		this.evDiscount = evDiscount;
	}
	public String getEvCode() {
		return evCode;
	}
	public void setEvCode(String evCode) {
		this.evCode = evCode;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProRepImg() {
		return proRepImg;
	}
	public void setProRepImg(String proRepImg) {
		this.proRepImg = proRepImg;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
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
	
}
