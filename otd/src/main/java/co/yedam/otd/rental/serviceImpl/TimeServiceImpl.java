package co.yedam.otd.rental.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.rental.service.TimeMapper;
import co.yedam.otd.rental.service.TimeService;
import co.yedam.otd.rental.vo.TimeVO;

public class TimeServiceImpl implements TimeService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private TimeMapper map = sqlSession.getMapper(TimeMapper.class);
	
	@Override
	public TimeVO timeSelectOne(String email) {
		
		return map.timeSelectOne(email);
	}

}
