package kr.or.ddit.sfc.jjim.service;

import java.util.List;

import kr.or.ddit.sfc.vo.JjimVo;
import kr.or.ddit.sfc.vo.MemberVO;

public interface IJjimService {

	/**
	 * 모든 찜 목록 위한 메서드
	 * @param mv
	 * @return 모든 찜 목록 담은 List 객체
	 */
	public List<JjimVo> displayjjim(MemberVO mv);
	/**
	 * 찜 삭제하기 위한 메서드
	 * @param JjimVo 
	 * @return  회원정보 삭제 성공하면 1
	 * 			실패하면 0반환
	 */
	public int removeJjim(JjimVo reJV);
	
	/**
	 * 찜 추가 하기 위한 메서드
	 * @param inJV  
	 * @return 회원정보 삭제 성공하면 1
	 * 			실패하면 0반환
	 */
	public int insertJjim(JjimVo inJV);
	
}
