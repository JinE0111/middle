package kr.or.ddit.sfc.vo;

// 주문내역 VO
public class OrderVO {
	private String buyDate; // 구매일자
	private String buyNo; // 주문 번호
	private String proName; // 상품명
	private String deliStatCode; // 배송 코드
	private int buyCost; // 주문 금액
	private String deliStat; // 배송 상태
	private String proCode; // 상품 코드
	private int buyQty; // 상품 구매 갯수
	
	
	public int getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(int buyQty) {
		this.buyQty = buyQty;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getDeliStat() {
		return deliStat;
	}
	public void setDeliStat(String deliStat) {
		this.deliStat = deliStat;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(String buyNo) {
		this.buyNo = buyNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getDeliStatCode() {
		return deliStatCode;
	}
	public void setDeliStatCode(String deliStatCode) {
		this.deliStatCode = deliStatCode;
	}
	public int getBuyCost() {
		return buyCost;
	}
	public void setBuyCost(int buyCost) {
		this.buyCost = buyCost;
	}
	
}
