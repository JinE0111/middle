package kr.or.ddit.sfc.service;

import java.sql.SQLException;

import kr.or.ddit.sfc.vo.MemberVO;

public interface IMemUpdateDao {

	public int memUpdate(MemberVO mv) throws SQLException;
}
