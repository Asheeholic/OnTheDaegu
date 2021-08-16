package co.yedam.otd.member.service;

import java.util.List;

import co.yedam.otd.member.vo.MemberVO;

public interface MemberMapper {
	//MemberMapper 영역
	List<MemberVO> memberSelectList(); // OTD전체 회원 조회
	
	MemberVO memberSelect(MemberVO vo); //OTD회원 한건 조회
	
	MemberVO memberLogin(MemberVO vo); //OTD회원 로그인
	
	int memberIdCheck(String email); //중복아이디 체크 
	int memberCheckIdAndPassword(MemberVO vo); // 로그인 체크
	int memberInsert(MemberVO vo); //OTD 회원가입
	int memberUpdate(MemberVO vo); //OTD 회원수정
	int memberDelete(MemberVO vo); //OTD 회원탈퇴(탈퇴시Update State='D')
	
}
