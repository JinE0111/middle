package kr.or.ddit.sfc.vo;

// 배송상태 VO
public class DeliStatusVO {
	private String deliStatCode; // 배송분류코드
	private String deliStat; // 배송상태
	
	public String getDeliStatCode() {
		return deliStatCode;
	}
	public void setDeliStatCode(String deliStatCode) {
		this.deliStatCode = deliStatCode;
	}
	public String getDeliStat() {
		return deliStat;
	}
	public void setDeliStat(String deliStat) {
		this.deliStat = deliStat;
	}
	
}
