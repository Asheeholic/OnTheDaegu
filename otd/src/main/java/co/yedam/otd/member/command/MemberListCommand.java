package co.yedam.otd.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 관리자용 OTD 회원 목록보기
		MemberService dao = new MemberServiceImpl();
		
		List<MemberVO> list = dao.memberSelectList();
		request.setAttribute("otdMemberList", list);
		
		return "member/memberList";
	}

}
