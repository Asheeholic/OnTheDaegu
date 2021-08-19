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
	public List<Map<String, String>> histroyList(HistoryVO vo) {
		// TODO 히스토리 전체조회 
		return map.histroyList(vo);
	}

	@Override
	public Map<String, String> historySelect(HistoryVO vo) {
		// TODO 히스토리 사용자 한건 조회
		return map.historySelect(vo);
	}

	@Override
	public int historyInsert(HistoryVO vo) {
		// 결제내역 추가
		int n = map.historyInsert(vo);
		sqlSession.commit();
		return n;
	}

	@Override
	public int historyUpdate(HistoryVO vo) {
		// 결제내역 삭제
		int n = map.historyUpdate(vo);
		sqlSession.commit();
		return n;
	}
}
