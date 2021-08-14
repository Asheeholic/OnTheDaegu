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
	public void noticeHitUpdate(int no) {
		// TODO 공지 조회수 증가
		map.noticeHitUpdate(no);
		sqlSession.commit(); // commit을 해줘야 db에 반영이 되는 것 확인
	}
	
	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO 공지작성
		int n = map.noticeInsert(vo);
		sqlSession.commit();
		return n;
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO 공지수정
		int n = map.noticeUpdate(vo);
		sqlSession.commit();
		return n;
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		// TODO 공지삭제
		int n = map.noticeDelete(vo);
		sqlSession.commit();
		return n;
	}

}
