package co.yedam.otd.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.notice.service.NoticeMapper;
import co.yedam.otd.notice.service.NoticeService;
import co.yedam.otd.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private NoticeMapper map = sqlSession.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeList() {
		// TODO 전체공지목록
		return map.noticeList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		// TODO 공지조회
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO 공지작성
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO 공지수정
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		// TODO 공지삭제
		return map.noticeDelete(vo);
	}

}
