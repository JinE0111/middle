package kr.or.ddit.sfc.notice.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.common.MyBatisDao;
import kr.or.ddit.sfc.vo.NoticeVO;

public class NoticeDaoImpl extends MyBatisDao implements INoticeDao{

	private static NoticeDaoImpl dao;
	
	private NoticeDaoImpl() {}
	
	public static INoticeDao getInstance() {
		if(dao == null) {
			dao = new NoticeDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<NoticeVO> noticeList() throws SQLException {
		return selectList("notice.noticeList");
	}

	@Override
	public NoticeVO noticeDetail(String noticeNo) throws SQLException {
		return selectOne("notice.noticeDetail", noticeNo);
	}

}
