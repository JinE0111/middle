package kr.or.ddit.sfc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.MemberVO;

public interface ILoginDao {
	
	/** id/pw 값 받아서 
	 * 회원정보를 가져오기 위한 메서드 (로그인)
	 * 
	 * @param memId 회원정보 가져올 회원ID
	 * @return 회원정보 존재하면 MemberVo 객체 반환, 실패하면 0 반환
	 */

	public MemberVO getMember(MemberVO mvo); 
	
	
	
	/** 회원가입시 아이디 중복체크
	 *  회원 정보가 존재하는지 체크하기 위한 메서드
	 * 
	 * @param memId 존재여부 체크할 회원id
	 * @return 회원 정보가 존재하면 true, 존재하지 않으면 false 반환
	 */
	
	public boolean checkMember(String memId); 
	
	/**
	 * 회원 가입
	 * @param mv : 등록할 회원 정보를 담은 MemberVO 객체
	 * @return 회원 등록 작업이 성공하면 1, 실패하면 0이 반환됨
	 */
	public int SignUpMember(MemberVO mv);


}
