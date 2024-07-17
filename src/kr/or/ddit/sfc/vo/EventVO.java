package kr.or.ddit.sfc.vo;

// 이벤트 VO
public class EventVO {
	private String evCode;
	private String evName;
	private String evStrDate;
	private String evEndDate;
	private String evCon;
	private int evDiscount;
	
	public String getEvCode() {
		return evCode;
	}
	public void setEvCode(String evCode) {
		this.evCode = evCode;
	}
	public String getEvName() {
		return evName;
	}
	public void setEvName(String evName) {
		this.evName = evName;
	}
	public String getEvStrDate() {
		return evStrDate;
	}
	public void setEvStrDate(String evStrDate) {
		this.evStrDate = evStrDate;
	}
	public String getEvEndDate() {
		return evEndDate;
	}
	public void setEvEndDate(String evEndDate) {
		this.evEndDate = evEndDate;
	}
	public String getEvCon() {
		return evCon;
	}
	public void setEvCon(String evCon) {
		this.evCon = evCon;
	}
	public int getEvDiscount() {
		return evDiscount;
	}
	public void setEvDiscount(int evDiscount) {
		this.evDiscount = evDiscount;
	}
	
}
