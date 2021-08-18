package co.yedam.otd.rental.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.rental.service.RentalMapper;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.vo.BicycleVO;
import co.yedam.otd.rental.vo.ZoneVO;

public class RentalServiceImpl implements RentalService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private RentalMapper map = sqlSession.getMapper(RentalMapper.class);
	
	@Override
	public List<ZoneVO> zoneList() {
		// TODO Auto-generated method stub
		return map.zoneList();
	}
	@Override
	public ZoneVO zoneSelectOne(int parkNum) {
		// TODO Auto-generated method stub
		return map.zoneSelectOne(parkNum);
	}
	@Override
	public int zoneUpdate(int parkNum) {
		// TODO Auto-generated method stub
		return map.zoneUpdate(parkNum);
	}
	@Override
	public List<BicycleVO> bicycleListAll() {
		// TODO Auto-generated method stub
		return map.bicycleListAll();
	}
	@Override
	public List<BicycleVO> zoneSelectAndBicycleList(int parkNum) {
		// TODO Auto-generated method stub
		return map.zoneSelectAndBicycleList(parkNum);
	}
	@Override
	public BicycleVO bicycleSelectOne(int bicycleNum) {
		// TODO Auto-generated method stub
		return map.bicycleSelectOne(bicycleNum);
	}
	@Override
	public int bicycleUpdate(int bicycleNum) {
		// TODO Auto-generated method stub
		return map.bicycleUpdate(bicycleNum);
	}
	
	
}
