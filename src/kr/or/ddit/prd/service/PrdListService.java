package kr.or.ddit.prd.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.prd.dao.IPrdListDao;
import kr.or.ddit.prd.dao.PrdListDao;
import kr.or.ddit.sfc.vo.ProductVO;

public class PrdListService implements IPrdListService{
	
	// 싱글톤
	private static IPrdListService service = null;
	private PrdListService() {
		// TODO Auto-generated constructor stub
	}
	public static IPrdListService getInstance() {
		if(service == null) service = new PrdListService();
		return service;
	}
	
	//dao 객체 
	IPrdListDao dao = PrdListDao.getInstance();
			
	
	@Override
	public int prdCnt(String category) {
		// TODO Auto-generated method stub
		int cnt = 0;
		try {
			cnt = dao.prdCnt(category);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<ProductVO> pageRange(Map<String, Object> map) {
		List<ProductVO> list = null;
		try {
			list = dao.pageRange(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
