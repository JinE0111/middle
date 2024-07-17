package kr.or.ddit.sfc.vo;

// 답변 VO
public class AnswerVO {
	
	private String aCode; // 답변코드
	private String aWriDate; // 작성일자
	private String aCon; // 내용
	
	
	
	@Override
	public String toString() {
		return "AnswerVO [aCode=" + aCode + ", aWriDate=" + aWriDate + ", aCon=" + aCon + "]";
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	public String getaWriDate() {
		return aWriDate;
	}
	public void setaWriDate(String aWriDate) {
		this.aWriDate = aWriDate;
	}
	public String getaCon() {
		return aCon;
	}
	public void setaCon(String aCon) {
		this.aCon = aCon;
	}
	
}
