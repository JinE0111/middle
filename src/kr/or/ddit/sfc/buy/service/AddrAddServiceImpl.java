package kr.or.ddit.sfc.buy.service;

import java.util.List;

import kr.or.ddit.sfc.buy.dao.AddrAddDaoImpl;
import kr.or.ddit.sfc.buy.dao.IAddrAddDao;
import kr.or.ddit.sfc.vo.AddrAddVO;
import kr.or.ddit.sfc.vo.MemberVO;

public class AddrAddServiceImpl implements IAddrAddService {
	
	private static IAddrAddService addrAddService;
	
	private IAddrAddDao addrAddDao;
	
	private AddrAddServiceImpl() {
		addrAddDao = AddrAddDaoImpl.getInstance();
	}
	public static IAddrAddService getInstance() {
		if(addrAddService == null) {
			addrAddService = new AddrAddServiceImpl();
		}
		return addrAddService;
	}
	@Override
	public List<AddrAddVO> displayAddrAdd(String mv) {
		return addrAddDao.displayAddrAdd(mv);
	}
	@Override
	public int deleteAddrAdd(AddrAddVO delAV) {
		return addrAddDao.deleteAddrAdd(delAV);
	}
	@Override
	public int insertAddrAdd(AddrAddVO inAV) {
		return addrAddDao.insertAddrAdd(inAV);
	}
	

}
