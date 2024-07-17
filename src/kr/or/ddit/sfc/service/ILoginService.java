package kr.or.ddit.sfc.service;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.core.config.composite.MergeStrategy;

import kr.or.ddit.sfc.vo.MemberVO;

public interface ILoginService{

	/**
	 * 로그인 id/pw 검증
	 * @param map
	 * @return
	 */
	//	public String loginCheck(Map<String, Object> map);
	
	
	/**회원 정보가 존재하는지 체크하기 위한 메서드
	 * @param memId 존재여부 체크할 회원id
	 * @return 회원정보가 존재하면 true, 존재하지 않으면 false 반환
	 */
	public boolean checkMember(String memId); 
	
	/**
	 * 회원 상세 정보를 가져오기 위한 메서드
	 * @param memId 상세정보를 가져올 회원id
	 * @return 상세회원정보를 담은 MemberVo객체
	 */
	public MemberVO getMember(MemberVO mvo);
	
}
