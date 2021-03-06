package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberSelectCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO OTD 회원 한건 조회 
		MemberService dao = new MemberServiceImpl();
		MemberVO vo =  new MemberVO();
		
		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO) session.getAttribute("session");
		
		vo.setEmail(memberVo.getEmail());
		
		vo = dao.memberSelect(vo);
		request.setAttribute("otd", vo);
		
		return "member/memberSelectForm";
	}

}
