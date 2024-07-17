package kr.or.ddit.sfc.buy.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.vo.BuyDetailVO;
import kr.or.ddit.sfc.vo.BuyVO;
import kr.or.ddit.sfc.vo.CartVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.ProductVO;

public interface IBuyDao {
	
	// 장바구니 번호를 받아 상품코드와 수량 출력
	public List<CartVO> buy(String memId) throws SQLException;
	
	// buy 테이블에 값 추가
	public void buyListInsert(BuyVO buy) throws SQLException;
	
	// 구매내역 가져옴
	public List<ProductVO> buyProductList(String memId) throws SQLException;
	
	// buy detail 테이블에 값 추가
	public void buyDetailInsert(BuyDetailVO bui) throws SQLException;
	
	// cart 테이블에 값 삭제
	public void buyAfter(String memId) throws SQLException;
}
