package kr.or.ddit.admin.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.MemberVO;

public interface IAdminMemberDao {
	
	/**
	 * 회원 관리에서 회원 목록 출력하는 메서드
	 * @return
	 */
	public List<MemberVO> memberList(Map<String, Object> map);
	
	/**
	 * 페이징을 위한 회원 총 인원수
	 * @return
	 */
	public int memberCnt();
	
	/**
	 * 회원 강퇴 메서드
	 * @return
	 */
	public int memberDel(Map<String,Object> map);
	
	/**
	 * 회원 검색 메서드 
	 * @param searchWord 검색어
	 * @return 검색결과 
	 */
	public List<MemberVO> memberSearch(String searchWord);
}
