package co.yedam.otd.event.service;

import java.util.List;

import co.yedam.otd.event.vo.EventVO;

public interface EventMapper {
	List<EventVO> eventList(); // 이벤트목록
}
