package kr.or.ddit.sfc.buy.dao;

import java.util.List;

import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.MemberVO;
import kr.or.ddit.sfc.vo.JjimVo;

public interface IAddrAddDao {
	/**
	 * 모든 찜 목록 위한 메서드
	 * @return 모든 찜 목록 담은 List 객체
	 */
	public List<AddrAddVO> displayAddrAdd(String mv);
	/**
	 * 찜 삭제하기 위한 메서드
	 * @param memId 삭제할 회원 ID
	 * @return  회원정보 삭제 성공하면 1
	 * 			실패하면 0반환
	 */
	public int deleteAddrAdd(AddrAddVO reAV);
	/**
	 * 찜 추가 하기 위한 메서드
	 * @param inJV  
	 * @return 회원정보 삭제 성공하면 1
	 * 			실패하면 0반환
	 */
	public int insertAddrAdd(AddrAddVO inAV);


}
