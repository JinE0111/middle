package kr.or.ddit.sfc.notice.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.notice.dao.INoticeDao;
import kr.or.ddit.sfc.notice.dao.NoticeDaoImpl;
import kr.or.ddit.sfc.vo.NoticeVO;

public class NoticeServiceImpl extends MyBatisDao implements INoticeService{

	private static INoticeService service;
	private INoticeDao dao;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	
	public static INoticeService getInstance() {
		if(service == null) {
			service = new NoticeServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<NoticeVO> noticeList() {
		List<NoticeVO> notList = null;
		
		try {
			notList = dao.noticeList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notList;
	}

	@Override
	public NoticeVO noticeDetail(String noticeNo) {
		NoticeVO nv = null;
		
		try {
			nv = dao.noticeDetail(noticeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nv;
	}

}
