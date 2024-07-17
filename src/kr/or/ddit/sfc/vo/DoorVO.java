package kr.or.ddit.sfc.vo;
import java.time.LocalDate;

// 문의사항 VO
public class DoorVO {
	 private String doorCode; //문의코드
	 private String doorCon;//문의 내용
	 private String doorWriDate; // 문의 작성날짜
	 private String doorYn; //문의 답변여부
	 private String memId; //아이디
	 private String doorName; //문의제목
	 private String aCon; //문의내용
	 private String aWriDate; //답변작성 날짜
	 private String adId; //관리자아이디
	 
	 
	 
	
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	@Override
	public String toString() {
		return "DoorVO [doorCode=" + doorCode + ", doorCon=" + doorCon + ", doorWriDate=" + doorWriDate + ", doorYn="
				+ doorYn + ", memId=" + memId + ", doorName=" + doorName + ", aCon=" + aCon + ", aWriDate=" + aWriDate
				+ "]";
	}
	public String getDoorWriDate() {
		return doorWriDate;
	}
	public void setDoorWriDate(String doorWriDate) {
		this.doorWriDate = doorWriDate;
	}
	public String getaWriDate() {
		return aWriDate;
	}
	public void setaWriDate(String aWriDate) {
		this.aWriDate = aWriDate;
	}
	public String getDoorCode() {
		return doorCode;
	}
	public void setDoorCode(String doorCode) {
		this.doorCode = doorCode;
	}
	public String getDoorCon() {
		return doorCon;
	}
	public void setDoorCon(String doorCon) {
		this.doorCon = doorCon;
	}

	public String getDoorYn() {
		return doorYn;
	}
	public void setDoorYn(String doorYn) {
		this.doorYn = doorYn;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getDoorName() {
		return doorName;
	}
	public void setDoorName(String doorName) {
		this.doorName = doorName;
	}
	public String getaCon() {
		return aCon;
	}
	public void setaCon(String aCon) {
		this.aCon = aCon;
	}
	
	
	
}
