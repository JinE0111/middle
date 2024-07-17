package kr.or.ddit.sfc.vo;

// 관리자 VO
public class AdminVO {
	
	private String adId; // 관리자 id
	private String adPw; // 관리자 pw
	
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPw() {
		return adPw;
	}
	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}
	@Override
	public String toString() {
		return "AdminVO [adId=" + adId + ", adPw=" + adPw + "]";
	}
}
