package kr.or.ddit.sfc.buy.service;

import java.util.List;

import kr.or.ddit.sfc.vo.BuyDetailVO;
import kr.or.ddit.sfc.vo.BuyVO;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

public interface IBuyService {
	
	// 장바구니 번호를 받아 상품코드와 수량 출력
	public List<CartVO> buyProd(String memId);
	
	// buy 테이블에 값 추가
	public void buyListInsert(BuyVO buy);
	
	// 구매내역 가져옴
	public List<ProductVO> buyProductList(String memId);
	
	// buy detail 테이블에 값 추가
	public void buyDetailInsert(BuyDetailVO bui);
	
	// cart 테이블에 값 삭제
	public void buyAfter(String memId);
}
