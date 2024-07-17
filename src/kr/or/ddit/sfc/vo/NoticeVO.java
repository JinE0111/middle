package kr.or.ddit.sfc.vo;

// 공지사항 VO
public class NoticeVO {
	private int noticeNo; // 공지사항 번호
	private String noticeName; // 공지사항 제목
	private String noticeCon; // 공지사항 내용
	private String noticeDate; // 공지사항 작성일
	private String adId; // 관리자아이디
	
	
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeName() {
		return noticeName;
	}
	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}
	public String getNoticeCon() {
		return noticeCon;
	}
	public void setNoticeCon(String noticeCon) {
		this.noticeCon = noticeCon;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeName=" + noticeName + ", noticeCon=" + noticeCon
				+ ", noticeDate=" + noticeDate + ", adId=" + adId + "]";
	}
}
