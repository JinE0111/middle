package kr.or.ddit.sfc.notice.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.sfc.vo.NoticeVO;

public interface INoticeService {

	// 공지사항 리스트 출력
	public List<NoticeVO> noticeList();
	
	// 공지사항 상세 내용 출력
	public NoticeVO noticeDetail(String noticeNo);
}
