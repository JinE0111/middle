package kr.or.ddit.sfc.door.service;

import java.util.List;

import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;

public interface IDoorService {
	
	/**
	 * 조회
	 * @param mv 로그인 한 회원정보
	 * @return 로그인한 회원정보
	 */
	public List<DoorVO> display(MemberVO mv);
	/**
	 * doorDetail
	 * @param memId
	 * @return
	 */
	public DoorVO doorDetail(DoorVO param);
	/**
	 * 문의글 추가
	 * @param memId 로그인한 회원
	 * @return 성공 1 실패 0
	 */
	public int insertDoor(DoorVO dv);
}
