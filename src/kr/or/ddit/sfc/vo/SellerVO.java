package kr.or.ddit.sfc.vo;

// 판매자 VO
public class SellerVO {
	private String selCode; // 판매자 코드
	private String selCom; // 판매업체
	private String selAgent; // 대표자
	private String selLocal; // 위치
	private String selTel; // 전화번호
	
	public String getSelCode() {
		return selCode;
	}
	public void setSelCode(String selCode) {
		this.selCode = selCode;
	}
	public String getSelCom() {
		return selCom;
	}
	public void setSelCom(String selCom) {
		this.selCom = selCom;
	}
	public String getSelAgent() {
		return selAgent;
	}
	public void setSelAgent(String selAgent) {
		this.selAgent = selAgent;
	}
	public String getSelLocal() {
		return selLocal;
	}
	public void setSelLocal(String selLocal) {
		this.selLocal = selLocal;
	}
	public String getSelTel() {
		return selTel;
	}
	public void setSelTel(String selTel) {
		this.selTel = selTel;
	}
	
}
