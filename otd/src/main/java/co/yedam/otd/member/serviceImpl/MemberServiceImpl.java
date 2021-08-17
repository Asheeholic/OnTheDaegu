package co.yedam.otd.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.member.service.MemberMapper;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberSelectList() {
		// TODO 회원 전체 조회
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		// TODO OTD 회원 한건 조회
		return map.memberSelect(vo);
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) {
		// TODO OTD 회원 로그인
		return map.memberLogin(vo);
	}

	@Override
	public int memberIdCheck(String email) {
		// TODO OTD 회원 아이디 중복 체크
		return map.memberIdCheck(email);
	}
	@Override
	public int memberCheckIdAndPassword(MemberVO vo) {
		// TODO OTD 회원 로그인체크
		return map.memberCheckIdAndPassword(vo);
	}
	
	@Override
	public int memberInsert(MemberVO vo) {
		// TODO OTD 회원 가입 
		
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO OTD 회원 수정
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO OTD 회원 삭제(State 'Y' -> 'D')
		return map.memberDelete(vo);
	}

}
