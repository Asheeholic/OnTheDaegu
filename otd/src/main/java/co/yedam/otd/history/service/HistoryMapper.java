package co.yedam.otd.history.service;

import java.util.List;
import java.util.Map;

import co.yedam.otd.history.vo.HistoryVO;

public interface HistoryMapper {
	// History Mapper
	List<Map<String, String>> histroyList(HistoryVO vo); // 전체 사용자 내역 보기(관리자용)

	Map<String, String> historySelect(HistoryVO vo); // OTD회원 한건 조회

	// 결제후 히스토리 기록
	int historyInsert(HistoryVO vo);

	int historyUpdate(HistoryVO vo);
}
