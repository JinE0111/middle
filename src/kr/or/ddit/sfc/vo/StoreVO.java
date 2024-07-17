package kr.or.ddit.sfc.vo;

// 입고사항 VO
public class StoreVO {
	private String storeCode; // 입고코드
	private int storeCost; // 매입가격
	private int storeQty; // 수량
	private int storeUnitCost; // 단가
	private String storeDate; // 입고일자
	
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public int getStoreCost() {
		return storeCost;
	}
	public void setStoreCost(int storeCost) {
		this.storeCost = storeCost;
	}
	public int getStoreQty() {
		return storeQty;
	}
	public void setStoreQty(int storeQty) {
		this.storeQty = storeQty;
	}
	public int getStoreUnitCost() {
		return storeUnitCost;
	}
	public void setStoreUnitCost(int storeUnitCost) {
		this.storeUnitCost = storeUnitCost;
	}
	public String getStoreDate() {
		return storeDate;
	}
	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}

}
