package kr.or.ddit.sfc.vo;

public class JjimVo {
	private String memId; 
	 private String proCode;   //상품코드
	 private String proName;	//상품명
	 private int proSellCost;	//상품가격
	 private String proRepImg;//상품대표이미지
	 private String cgName;	//카테고리명
	 private double evDiscount;	//할인율
	 private String evCode;	//카테고리명
	 private int evAvg;	//상품가격
	 
	
	public int getEvAvg() {
		return evAvg;
	}
	public void setEvAvg(int evAvg) {
		this.evAvg = evAvg;
	}
	public double getEvDiscount() {
		return evDiscount;
	}
	public void setEvDiscount(double evDiscount) {
		this.evDiscount = evDiscount;
	}
	public String getEvCode() {
		return evCode;
	}
	public void setEvCode(String evCode) {
		this.evCode = evCode;
	}
	public String getCgName() {
		return cgName;
	}
	public void setCgName(String cgName) {
		this.cgName = cgName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProSellCost() {
		return proSellCost;
	}
	public void setProSellCost(int proSellCost) {
		this.proSellCost = proSellCost;
	}
	public String getProRepImg() {
		return proRepImg;
	}
	public void setProRepImg(String proRepImg) {
		this.proRepImg = proRepImg;
	}
	@Override
	public String toString() {
		return "jjimVo [memId=" + memId + ", proCode=" + proCode + ", proName=" + proName + ", proSellCost="
				+ proSellCost + ", proRepImg=" + proRepImg + "]";
	}
	 
	 

}
