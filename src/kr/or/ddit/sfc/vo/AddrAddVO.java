package kr.or.ddit.sfc.vo;

public class AddrAddVO {
	 private String deliCode; //배송지번호
	 private String memName; //이름
	 private String memTel; //휴대폰
	 private int deliPostNo; //우편번호
	 private String deliAddr; //배송주소
	 private String deliAddrD; //상세주소
	 private String deliReq; //배송메모
	 private String deliDelYn; //배송 삭제 유무
	 private String deliId; //회원아이디
	 
	 
	 
	@Override
	public String toString() {
		return "AddrAddVO [deliCode=" + deliCode + ", memName=" + memName + ", memTel=" + memTel + ", deliPostNo="
				+ deliPostNo + ", deliAddr=" + deliAddr + ", deliAddrD=" + deliAddrD + ", deliReq=" + deliReq
				+ ", deliDelYn=" + deliDelYn + ", deliId=" + deliId + "]";
	}
	public String getDeliDelYn() {
		return deliDelYn;
	}
	public void setDeliDelYn(String deliDelYn) {
		this.deliDelYn = deliDelYn;
	}
	public String getDeliId() {
		return deliId;
	}
	public void setDeliId(String deliId) {
		this.deliId = deliId;
	}
	public String getDeliCode() {
		return deliCode;
	}
	public void setDeliCode(String deliCode) {
		this.deliCode = deliCode;
	}
	public String getDeliAddrD() {
		return deliAddrD;
	}
	public void setDeliAddrD(String deliAddrD) {
		this.deliAddrD = deliAddrD;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
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
	public String getDeliReq() {
		return deliReq;
	}
	public void setDeliReq(String deliReq) {
		this.deliReq = deliReq;
	}
	 
	 
	 
}
