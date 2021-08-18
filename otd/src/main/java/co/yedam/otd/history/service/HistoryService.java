package co.yedam.otd.history.service;

import java.util.List;
import java.util.Map;

import co.yedam.otd.history.vo.HistoryVO;

public interface HistoryService {
	List<HistoryVO> histroyList(); //전체 사용자 내역 보기(관리자용)
	
	Map<String, String> historySelect (HistoryVO vo); //OTD회원 한건 조회
}
