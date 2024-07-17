package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sfc.vo.AdminDeliVO;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.DeliStatusVO;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.NoticeVO;

public interface IAdminDao {
	public AdminVO adminLogin(AdminVO avo) throws SQLException;
	
	public List<AdminDeliVO> adminDeli(Map<String, Object> map) throws SQLException; 
	
	public List<DeliStatusVO> deliStatus() throws SQLException;
	/**
	 * insert 등록
	 * @param dv adId,doorCode,aCon 
	 * @return 성공 할때 1 실패할때 0
	 */
	public int adminDoorInsert(DoorVO dv);
	
	public int deliStatUpdate(AdminDeliVO advo) throws SQLException;
	/**
	 * notice 등록
	 */
	public int noticeInsert(NoticeVO nv);

	public int deliCnt() throws SQLException;
}
