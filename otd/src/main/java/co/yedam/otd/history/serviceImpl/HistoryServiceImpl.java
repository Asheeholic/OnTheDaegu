package co.yedam.otd.history.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.history.service.HistoryMapper;
import co.yedam.otd.history.service.HistoryService;
import co.yedam.otd.history.vo.HistoryVO;

public class HistoryServiceImpl implements HistoryService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private HistoryMapper map = sqlSession.getMapper(HistoryMapper.class);
	@Override
	public List<HistoryVO> histroyList() {
		// TODO 히스토리 전체조회 
		return map.histroyList();
	}

	@Override
	public Map<String, String> historySelect(HistoryVO vo) {
		// TODO 히스토리 사용자 한건 조회
		return map.historySelect(vo);
	}

}
