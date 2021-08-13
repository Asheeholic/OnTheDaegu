package co.yedam.otd.rental.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.rental.service.RentalMapper;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.vo.ZoneVO;

public class RentalServiceImpl implements RentalService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private RentalMapper map = sqlSession.getMapper(RentalMapper.class);
	
	@Override
	public List<ZoneVO> zoneList() {
		// TODO Auto-generated method stub
		return map.zoneList();
	}

}
