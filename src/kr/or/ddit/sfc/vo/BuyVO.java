package kr.or.ddit.sfc.vo;

// 구매 VO
public class BuyVO {

	private String buyNo; // 구매번호
	private String buyWay; // 결제방법
	private String payVal; // 결제 방법
	private String userId; // 멤버 아이디
	private String addCode; // 배송지 코드
	private int buyCost; // 결제금액
	
	public int getBuyCost() {
		return buyCost;
	}
	public void setBuyCost(int buyCost) {
		this.buyCost = buyCost;
	}
	public String getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(String buyNo) {
		this.buyNo = buyNo;
	}
	public String getBuyWay() {
		return buyWay;
	}
	public void setBuyWay(String buyWay) {
		this.buyWay = buyWay;
	}
	public String getPayVal() {
		return payVal;
	}
	public void setPayVal(String payVal) {
		this.payVal = payVal;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddCode() {
		return addCode;
	}
	public void setAddCode(String addCode) {
		this.addCode = addCode;
	}
}
