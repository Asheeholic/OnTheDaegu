package co.yedam.otd.notice.service;

import java.util.List;

import co.yedam.otd.notice.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> noticeSelectList(); // 전체공지목록
	NoticeVO noticeSelect(NoticeVO vo); // 공지조회
	int noticeInsert(NoticeVO vo); // 공지작성
	int noticeUpdate(NoticeVO vo); // 공지수정
	int noticeDelete(NoticeVO vo); // 공지삭제
}
