package kr.or.ddit.sfc.vo;

// 배송지 VO
public class DeleveryVO {
	private String deliCode; // 배송지 코드
	private int deliPostNo; // 우편번호
	private String deliAddr; // 받는분 주소
	private String deliAddrD; // 받는분 상세 주소
	private String deliTel; // 받는분 전화번호
	private String deliName; // 받는분 명
	private String deliReq; // 요청사항
	
	public String getDeliCode() {
		return deliCode;
	}
	public void setDeliCode(String deliCode) {
		this.deliCode = deliCode;
	}
	public int getDeliPostNo() {
		return deliPostNo;
	}
	public void setDeliPostNo(int deliPostNo) {
		this.deliPostNo = deliPostNo;
	}
	public String getDeliAddr() {
		return deliAddr;
	}
	public void setDeliAddr(String deliAddr) {
		this.deliAddr = deliAddr;
	}
	public String getDeliAddrD() {
		return deliAddrD;
	}
	public void setDeliAddrD(String deliAddrD) {
		this.deliAddrD = deliAddrD;
	}
	public String getDeliTel() {
		return deliTel;
	}
	public void setDeliTel(String deliTel) {
		this.deliTel = deliTel;
	}
	public String getDeliName() {
		return deliName;
	}
	public void setDeliName(String deliName) {
		this.deliName = deliName;
	}
	public String getDeliReq() {
		return deliReq;
	}
	public void setDeliReq(String deliReq) {
		this.deliReq = deliReq;
	}
	
}
