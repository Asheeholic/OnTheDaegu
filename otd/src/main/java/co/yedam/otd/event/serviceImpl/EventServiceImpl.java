package co.yedam.otd.event.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.event.service.EventMapper;
import co.yedam.otd.event.vo.EventVO;

public class EventServiceImpl implements EventMapper {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private EventMapper map = sqlSession.getMapper(EventMapper.class);

	@Override
	public List<EventVO> eventList() {
		// TODO 이벤트목록
		return map.eventList();
	}

}
