package kr.or.ddit.sfc.vo;

// 회원 VO
public class MemberVO {
	
	private String memId; // 회원 ID
	private String memPw; // 회원 PW
	private String memName; // 회원명
	private String memAddr; // 주소
	private String memPostNo; // 우편변호
	private String memAddrD; // 상세주소
	private String memEmail; // 이메일
	private String memTel; // 전화번호
	private String memBirth; // 생일
	private String memDelyn; // 삭제여부
	
	private int rnum; // 회원리스트 넘버
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemPostNo() {
		return memPostNo;
	}
	public void setMemPostNo(String memPostNo) {
		this.memPostNo = memPostNo;
	}
	public String getMemAddrD() {
		return memAddrD;
	}
	public void setMemAddrD(String memAddrD) {
		this.memAddrD = memAddrD;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemDelyn() {
		return memDelyn;
	}
	public void setMemDelyn(String memDelyn) {
		this.memDelyn = memDelyn;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memAddr=" + memAddr
				+ ", memPostNo=" + memPostNo + ", memAddrD=" + memAddrD + ", memEmail=" + memEmail + ", memTel="
				+ memTel + ", memBirth=" + memBirth + ", memDelyn=" + memDelyn + "]";
	}
}
