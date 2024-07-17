package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.sfc.vo.AdminDeliVO;
import kr.or.ddit.sfc.vo.AdminVO;
import kr.or.ddit.sfc.vo.DeliStatusVO;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.NoticeVO;

public class AdminServiceImpl implements IAdminService{

	private static IAdminService service;
	private IAdminDao dao;
	
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}
	
	public static IAdminService getInstance() {
		if(service == null) {
			service = new AdminServiceImpl();
		}
		return service;
	}
	
	// 어드민 로그인
	@Override
	public AdminVO adminLogin(AdminVO avo) {
		AdminVO cnt = new AdminVO();
		
		try {
			cnt = dao.adminLogin(avo);
		} catch (Exception e) {
			// TODO: handle exception
		} 
				
		return cnt;
	}

	// 어드민 배송 관리
	@Override
	public List<AdminDeliVO> adminDeli(Map<String, Object> map) {
		List<AdminDeliVO> admindeli = null;
		
		try {
			admindeli = dao.adminDeli(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return admindeli;
	}

	@Override
	public List<DeliStatusVO> deliStatus() {
		List<DeliStatusVO> deliStatus = null;
		
		try {
			deliStatus = dao.deliStatus();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return deliStatus;
	}

	@Override
	public int adminDoorInsert(DoorVO dv) {
		return dao.adminDoorInsert(dv);
	}

	@Override
	public int deliStatUpdate(AdminDeliVO advo) {
		// TODO Auto-generated method stub
		int cnt = 0;
		try {
			cnt = dao.deliStatUpdate(advo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
		
	}

	@Override
	public int noticeInsert(NoticeVO nv) {
		return dao.noticeInsert(nv);
	}

	@Override
	public int deliCnt() {
		int cnt = 0;
		try {
			cnt = dao.deliCnt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
