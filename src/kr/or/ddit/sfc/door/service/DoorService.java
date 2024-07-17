package kr.or.ddit.sfc.door.service;

import java.util.List;

import kr.or.ddit.sfc.door.dao.DoorDao;
import kr.or.ddit.sfc.vo.DoorVO;
import kr.or.ddit.sfc.vo.MemberVO;

public class DoorService implements IDoorService{
	//싱글톤
		private static DoorService instance =null;
		
		private DoorService() {
			
		}
		
		public static DoorService getInstance() {
			if(instance == null) {
				instance = new DoorService();
			}
			return instance;
		}
		
		
		DoorDao doorDao = DoorDao.getInstance();
	@Override
	public List<DoorVO> display(MemberVO mv) {
		return doorDao.display(mv);
	}

	public DoorVO doorDetail(DoorVO param) {
		return doorDao.doorDetail(param);
	}

	@Override
	public int insertDoor(DoorVO dv) {
		return doorDao.insertDoor(dv);
	}

}
